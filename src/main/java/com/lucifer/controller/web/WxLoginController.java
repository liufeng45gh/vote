package com.lucifer.controller.web;

import com.lucifer.exception.ArgumentException;
import com.lucifer.exception.NotLoginException;
import com.lucifer.exception.WxAuthenticationException;
import com.lucifer.service.vote.WxService;
import com.lucifer.utils.Result;
import com.lucifer.utils.StringHelper;
import org.json.JSONException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2017/6/23.
 */

@Controller
@RequestMapping("/api/wx")
public class WxLoginController {

    @Resource
    private WxService wxService;

    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private Environment environment;



    @RequestMapping(value="/login-by-code",method = RequestMethod.GET)
    public String loginByCode(@RequestParam  String code, @RequestParam String state, HttpServletResponse response, HttpServletRequest request) throws JSONException, WxAuthenticationException, IOException {
        logger.info("loginByCode has been called ");
        String token = wxService.loginByCode(code);
        logger.info("wxService.loginByCode has pass");
        String redirectUrl = environment.getProperty("wxLoginRedirect."+state);
        logger.info("redirectUrl is : {}",redirectUrl);
        return "redirect:"+ redirectUrl + "?token=" + token;
    }

    @RequestMapping(value="/login/{state}",method = RequestMethod.GET)
    public String toLogin(@PathVariable String state){
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx1b792045969d2147&redirect_uri=https%3a%2f%2fvote.klny.xyz%2fapi%2f%2fwx%2flogin-by-code&response_type=code&scope=snsapi_userinfo&state="+state+"#wechat_redirect";
        //return "redirect: https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx7933d55ea3872f4d&redirect_uri=https%3a%2f%2fwww.jd.com&response_type=code&scope=snsapi_userinfo&state=vote#wechat_redirect";
    }

    @RequestMapping(value="/check-login",method = RequestMethod.POST)
    @ResponseBody
    public Result checkLogin(@RequestHeader(required = false,name = "Authorization") String token) throws NotLoginException, ArgumentException {
        logger.info("token is: {}", token);
        if (StringHelper.isEmpty(token)) {
            throw new NotLoginException("没有传入token");
        }
        String wxId = wxService.getWxIdByToken(token);
        logger.info("wxId is : {}", wxId);
        if (StringHelper.isEmpty(wxId)) {
            throw new NotLoginException("无效token");
        }
        return Result.ok();
    }

}
