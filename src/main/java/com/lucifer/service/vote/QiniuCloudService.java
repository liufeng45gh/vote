package com.lucifer.service.vote;


import com.baidu.ueditor.define.FileType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

/**
 * Created by lijc on 15/8/27.
 */
@Component
@EnableConfigurationProperties
@ConfigurationProperties(prefix="qiniu")
public class QiniuCloudService {

    private static QiniuCloudService instance;

    public static QiniuCloudService getInstance(){
        return instance;
    }

    @PostConstruct
    public void init(){
        instance  = this;
    }

    private String accessKey;

    private String secretKey;

    private String publicBucket;

    private String url;


    public String getAccessKey() {
        return accessKey;
    }

    public void setAccessKey(String accessKey) {
        this.accessKey = accessKey;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public String getPublicBucket() {
        return publicBucket;
    }

    public void setPublicBucket(String publicBucket) {
        this.publicBucket = publicBucket;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void test() throws QiniuException {
        Auth auth = Auth.create(this.accessKey,
                this.secretKey);
        String token = auth.uploadToken(this.publicBucket);
        UploadManager um = new UploadManager();
        try {
            Response resp = um.put("/Users/lijc/Downloads/8mm.png", null,
                    token);
            System.out.println(resp.bodyString());
        } catch (QiniuException ex) {
            System.out.println(ex.getMessage());
        }
    }

    private ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 上传无key文件，这种上传方式将使得七牛使用文件的hash作为文件名
     * */
    public String simpleUploadWithoutKey(byte[] file) throws IOException {
        Auth auth = Auth.create(this.accessKey,
                this.secretKey);
        String token = auth.uploadToken(this.publicBucket);
        UploadManager um = new UploadManager();
        String key = "";
        try {
            Response resp = um.put(file, null,
                    token);
            Map<String,Object> map = objectMapper.readValue(resp.bodyString(),Map.class) ;
            key = (String)map.get("key");
            System.out.println(resp.bodyString());
            System.out.println(key);
        } catch (QiniuException ex) {
            System.out.println(ex.getMessage());
        }
        return url + key + "";
    }

    public String simpleUploadWithoutKey(MultipartFile file) throws IOException {
        Auth auth = Auth.create(this.accessKey,
                this.secretKey);
        String token = auth.uploadToken(this.publicBucket);
        UploadManager um = new UploadManager();
        String key = "";
        String originFileName = file.getOriginalFilename();
        String suffix = FileType.getSuffixByFilename(originFileName);
        key = UUID.randomUUID().toString()+suffix;
        try {
            Response resp = um.put(file.getBytes(), key,
                    token);
            Map<String,Object> map = objectMapper.readValue(resp.bodyString(),Map.class) ;
            key = (String)map.get("key");
            System.out.println(resp.bodyString());
            System.out.println(key);
        } catch (QiniuException ex) {
            System.out.println(ex.getMessage());
        }
        return url + key + "";
    }

    /**
     * 上传有key文件，七牛将使用指定的key作为文件名
     * */
    public void simpleUploadWithKey(byte[] file,String key) throws QiniuException {
        Auth auth = Auth.create(this.accessKey, this.secretKey);
        String token = auth.uploadToken(this.publicBucket);
        UploadManager um = new UploadManager();
        try {
            Response resp = um.put(file,
                    key, token);
            System.out.println(resp.bodyString());
        } catch (QiniuException ex) {
            System.out.println(ex.getMessage());
        }
    }

    /**
     * 带扩展参数上传，所谓扩展参数就是除了七牛规定的参数之外的请求参数， 必须符合一定的命名规则，而且值不能为空。
     * */
    public void simpleUploadWithExtraParams(byte[] file,String key,StringMap extraParams) {
        Auth auth = Auth.create(this.accessKey,
                this.secretKey);
        String token = auth.uploadToken(this.publicBucket);

//        StringMap extraParams = new StringMap();
//        extraParams.put("x:hello", "hello");
//        extraParams.put("x:qiniu", "qiniu");
//        extraParams.put("apple", "");
//        extraParams.put("x:apple", "");
//        extraParams.put("", "");

        UploadManager um = new UploadManager();
        try {
            Response resp = um.put(file,
                    key, token, extraParams, null, false);
            System.out.println(resp.bodyString());
        } catch (QiniuException ex) {
            System.out.println(ex.getMessage());
        }
    }

    /**
     * 客户端上传指定文件的类型
     * */
    public void simpleUploadWithType(byte[] file,String key,String type) {
        Auth auth = Auth.create(this.accessKey,
                this.secretKey);
        String token = auth.uploadToken(this.publicBucket);
        UploadManager um = new UploadManager();
        try {
            Response resp = um.put(file,
                    key, token, null, type, false);
            System.out.println(resp.bodyString());
        } catch (QiniuException ex) {
            System.out.println(ex.getMessage());
        }
    }

    /**
     * 客户端上传设置文件的crc32校验，这将触发七牛对文件做crc32的计算，并和上传端指定的文件crc32做比较
     * */
    public void simpleUploadWithCrc32Check() {
        Auth auth = Auth.create(this.accessKey,
                this.secretKey);
        String token = auth.uploadToken(this.publicBucket);
        UploadManager um = new UploadManager();
        try {
            Response resp = um.put("/Users/jemy/Documents/qiniu.png",
                    "qiniu_crc32.png", token, null, null, true);
            System.out.println(resp.bodyString());
        } catch (QiniuException ex) {
            System.out.println(ex.getMessage());
        }
    }

    /**
     * 自定义文件上传后七牛的回复内容
     * */
    public void simpleUploadWithReturnBody() {
        Auth auth = Auth.create(this.accessKey,
                this.secretKey);
        StringMap extraParams = new StringMap();
        extraParams.put("x:hello", "hello");
        extraParams.put("x:qiniu", "qiniu");
        StringMap putPolicy = new StringMap();
        putPolicy
                .put("returnBody",
                        "{\"hash\":\"$(hash)\",\"key\":\"$(key)\",\"bucket\":\"$(bucket)\",\"hello\":\"$(x:hello)\"}");
        String token = auth.uploadToken(this.publicBucket, null,
                3600, putPolicy);
        UploadManager um = new UploadManager();
        try {
            Response resp = um.put("/Users/jemy/Documents/qiniu.png",
                    "qiniu_r1.png", token, extraParams, null, true);
            System.out.println(resp.bodyString());
        } catch (QiniuException ex) {
            System.out.println(ex.code());
        }
    }

}
