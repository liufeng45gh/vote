package com.lucifer.controller.web;

import com.lucifer.config.ImageConfig;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index(HttpServletRequest request){
        request.setAttribute("resource", ImageConfig.resource);
        return "/web/index/index";
    }

    @GetMapping("/rule")
    public String rule(HttpServletRequest request){
        return "/web/index/rule";
    }

    @GetMapping("/resources")
    @ResponseBody
    public Map<String,String> resources(){
        return ImageConfig.resource;
    }
}
