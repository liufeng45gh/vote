package com.lucifer.controller.web;

import com.lucifer.dao.vote.WxUserDao;
import com.lucifer.exception.WxAuthenticationException;
import com.lucifer.model.vote.WxInfo;
import com.lucifer.service.vote.WxService;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * Created by Administrator on 2017/6/23.
 */

@Controller
@RequestMapping("/wx")
public class WxLoginController {

    @Resource
    private WxService wxService;



    @RequestMapping(value="/login-by-code",method = RequestMethod.GET)
    public String loginByCode( String code) throws JSONException, WxAuthenticationException, IOException {

        return "redirect:/appreciate/index";
    }

    @RequestMapping(value="/login",method = RequestMethod.GET)
    public String toLogin(){
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx7933d55ea3872f4d&redirect_uri=http%3a%2f%2fvote.dbdbd.cn%2fwx%2flogin-by-code&response_type=code&scope=snsapi_userinfo&state=vote#wechat_redirect";
        //return "redirect: https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx7933d55ea3872f4d&redirect_uri=https%3a%2f%2fwww.jd.com&response_type=code&scope=snsapi_userinfo&state=vote#wechat_redirect";
    }
}
