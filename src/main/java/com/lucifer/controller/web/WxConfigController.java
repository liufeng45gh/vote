package com.lucifer.controller.web;


import com.lucifer.service.vote.WxConfigService;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by liufx on 2017/4/13.
 */
@Controller
@RequestMapping("/api")
public class WxConfigController {

    @Resource
    private WxConfigService wxConfigService;

    @ApiOperation(value = "获取微信签名配置")
    @RequestMapping(value="/wx-config",method= RequestMethod.POST)
    @ResponseBody
    public Map getWxConfig(@RequestBody String shareUrl){
       return wxConfigService.getWxConfig(shareUrl);
    }
}
