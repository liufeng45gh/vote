package com.lucifer.service.vote;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lucifer.dao.vote.WxUserDao;
import com.lucifer.exception.WxAuthenticationException;
import com.lucifer.model.vote.WxInfo;
import com.lucifer.utils.Constant;
import com.lucifer.utils.HttpClientUtils;
import com.lucifer.utils.StringHelper;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/24.
 */
@Component
public class WxService {

    @Value("${wx.secret}")
    private String secret;

    @Value("${wx.appId}")
    private String appId;

    @Value("${wx.loginSecret}")
    private String loginSecret;

    @Value("${wx.loginAppId}")
    private String loginAppId;

    @Resource
    private WxUserDao wxUserDao;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    final Logger logger = LoggerFactory.getLogger(this.getClass());

    private ObjectMapper objectMapper = new ObjectMapper();

    @PostConstruct
    public void init(){
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    public WxInfo getWxInfo(String code) throws IOException, WxAuthenticationException, JSONException {
        String url =  "https://api.weixin.qq.com/sns/oauth2/access_token?appid=#{appId}&secret=#{secret}&code=#{code}&grant_type=authorization_code";
        url = url.replace("#{appId}",loginAppId);
        url = url.replace("#{secret}",loginSecret);
        url = url.replace("#{code}",code);
        logger.info("url is : {}",url);
        String resultString = HttpClientUtils.get(url);
        //JSONObject resultJ=  new JSONObject(resultString);
        logger.info("resultString is : {}",resultString);
        Map resultMap = objectMapper.readValue(resultString,Map.class);
        //WxInfo wxInfo = objectMapper.readValue(resultString,WxInfo.class);
        WxInfo wxInfo = new WxInfo();

        if (resultMap.get("errcode") !=  null) {
            throw new WxAuthenticationException("认证失败");
        }

        wxInfo.setAccessToken((String) resultMap.get("access_token"));
        wxInfo.setWxId((String) resultMap.get("openid"));

        this.syncWeixinUserInfo(wxInfo);
        return wxInfo;
    }

    private void syncWeixinUserInfo(WxInfo user) throws HttpException, IOException, JSONException {
        JSONObject jsonObject = this.getWeixinUserInfo(user.getAccessToken(), user.getWxId());
        user.setAvatar(jsonObject.getString("headimgurl"));
        user.setNickName(jsonObject.getString("nickname"));
        //user.setCity(jsonObject.getString("city"));
        //user.setProvince(jsonObject.getString("province"));
    }

    private JSONObject getWeixinUserInfo(String accessToken,String openId) throws JSONException, IOException {
        OkHttpClient okHttpClient = new OkHttpClient();
        String url = "https://api.weixin.qq.com/sns/userinfo?access_token="+accessToken+"&openid="+openId;
        Request request = new Request.Builder().url(url).get().build();

        Response response = okHttpClient.newCall(request).execute();

        Integer code = response.code();
        logger.info("getWeixinUserInfo response code is {}", code);

        String resultString =  response.body().string();
        logger.info(resultString);
        JSONObject resultJ=  new JSONObject(resultString);
        return resultJ;
    }

    public void loginByCode(String code,  HttpServletResponse response) throws JSONException, WxAuthenticationException, IOException {
        WxInfo wxInfo = this.getWxInfo(code);
        WxInfo dbWxInfo = wxUserDao.getWxUserByWxId(wxInfo.getWxId());
        if (null == dbWxInfo) {
            wxUserDao.insertWxUser(wxInfo);
        }
        String token = UUID.randomUUID().toString();
        //stringRedisTemplate.opsForValue().set(Constant.CACHE_KEY_PERSISTENCE_TOKEN_PRE+token,wxInfo.getWxId());
        this.writeToken(token,wxInfo.getWxId());
        Cookie c2 = new Cookie("token",token);
//设置生命周期为1小时，秒为单位
        c2.setPath("/");
        c2.setMaxAge(12 * 30 * 24 * 3600);
        response.addCookie(c2);
    }

    public String loginByCode(String code) throws JSONException, WxAuthenticationException, IOException {
        WxInfo wxInfo = this.getWxInfo(code);
        WxInfo dbWxInfo = wxUserDao.getWxUserByWxId(wxInfo.getWxId());
        if (null == dbWxInfo) {
            wxUserDao.insertWxUser(wxInfo);
        }
        String token = UUID.randomUUID().toString();
        //stringRedisTemplate.opsForValue().set(Constant.CACHE_KEY_PERSISTENCE_TOKEN_PRE+token,wxInfo.getWxId());
        this.writeToken(token,wxInfo.getWxId());
        return token;
    }

    public void writeToken(String token,String wxId){
        stringRedisTemplate.opsForValue().set(Constant.CACHE_KEY_PERSISTENCE_TOKEN_PRE+token,wxId);
    }
    public String getWxIdByToken(String token){
        return stringRedisTemplate.opsForValue().get(Constant.CACHE_KEY_PERSISTENCE_TOKEN_PRE+token);
    }

}
