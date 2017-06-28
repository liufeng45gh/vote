package com.lucifer.service.vote;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lucifer.utils.Constant;
import com.lucifer.utils.HttpClientUtils;
import com.lucifer.utils.StringHelper;
import com.lucifer.utils.WxSign;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by liufx on 2017/4/13.
 */
@Component
public class WxConfigService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    final Logger logger = LoggerFactory.getLogger(this.getClass());

    private ObjectMapper objectMapper = new ObjectMapper();

    @Value("${wx.appId}")
    private String AppId;

    @Value("${wx.secret}")
    private String AppSecret;

    public Map getWxConfig(String shareUrl){
         String jsapiTicket =  stringRedisTemplate.opsForValue().get(Constant.KEY_WX_JSAPI_TICKET);
         return WxSign.sign(jsapiTicket,shareUrl);
    }

    @Scheduled(cron = "0 0 */1 * * ?")
    //@PostConstruct
    public void refreshWxJsapiTicket() throws IOException {
          String accessToken =  this.getAccessToken();
          String jsapiTiket = this.getJsapiTicket(accessToken);
          if (!StringHelper.isEmpty(jsapiTiket)) {
              stringRedisTemplate.opsForValue().set(Constant.KEY_WX_JSAPI_TICKET,jsapiTiket);
          }
    }

    private String getAccessToken() throws IOException {
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+this.AppId+"&secret="+this.AppSecret;
        logger.info(url);
        String jsonString = HttpClientUtils.get(url);
        logger.info("jsonString is : {}",jsonString);
        Map result = objectMapper.readValue(jsonString, HashMap.class);
        return (String) result.get("access_token");

    }

    private String getJsapiTicket(String acccessToken) throws IOException {
        String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+acccessToken+"&type=jsapi";
        logger.info(url);
        String jsonString = HttpClientUtils.get(url);
        logger.info("jsonString is : {}",jsonString);
        Map result = objectMapper.readValue(jsonString, HashMap.class);
        return (String) result.get("ticket");
        
    }
}
