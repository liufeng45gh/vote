package com.lucifer.controller;

import com.baidu.ueditor.ActionEnter;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by liufx on 17/1/18.
 */
@Controller
@RequestMapping(value = "/ueditor")
public class UEditorController {


    @RequestMapping(value = "/controller.json",method = RequestMethod.GET)
    @ResponseBody
    public String execGet(HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException {

           return new ActionEnter( request, "/" ).exec(null);
    }

    @RequestMapping(value = "/controller.json",method = RequestMethod.POST)
    @ResponseBody
    public String execPost(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "upfile",required = false) MultipartFile file) throws JSONException, IOException {

        return new ActionEnter( request, "/" ).exec(file);
    }


}
