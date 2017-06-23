package com.lucifer.controller.web;

import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.exception.NotLoginException;
import com.lucifer.model.vote.Appreciate;
import com.lucifer.model.vote.AppreciateCategory;
import com.lucifer.model.vote.Vote;
import com.lucifer.service.vote.AppreciateReadService;
import com.lucifer.service.vote.AppreciateService;
import com.lucifer.utils.Constant;
import com.lucifer.utils.PageInfoWriter;
import com.lucifer.utils.Result;
import com.lucifer.utils.StringHelper;
import org.json.JSONException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liufx on 17/2/11.
 */
@Controller
@RequestMapping("/appreciate")
public class WebAppreciateController {

    @Resource
    private AppreciateDao appreciateDao;

  

    @Resource
    private AppreciateService appreciateService;

    @Resource
    private AppreciateReadService appreciateReadService;


    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="/index",method = RequestMethod.GET)
    public String index(HttpServletRequest request
                       ){
        Integer pageSize = Constant.PAGESIZE;
      
        List<AppreciateCategory> appreciateCategoryList =  appreciateDao.appreciateCategoryList();

        request.setAttribute("appreciateCategoryList",appreciateCategoryList);

        for (AppreciateCategory category: appreciateCategoryList) {
            List<Appreciate> appreciateList = appreciateDao.appreciateList(null,category.getId(),0,1000);
            category.setAppreciateList(appreciateList);
        }

        Integer allAppreciateCount = appreciateService.allAppreciateCount();
        request.setAttribute("allAppreciateCount",allAppreciateCount);
        return "/web/appreciate/index";
    }

    

    @RequestMapping(value="/{id}/detail",method = RequestMethod.GET)
    public String detail(HttpServletRequest request,@PathVariable Long id){
        Appreciate appreciate = appreciateDao.getAppreciate(id);
        request.setAttribute("entity",appreciate);
        return "/web/appreciate/detail";
    }


    
   

    @RequestMapping(value="/{id}/counts",method = RequestMethod.GET)
    @ResponseBody
    public Appreciate counts(@PathVariable Long id){
        Appreciate appreciate = appreciateDao.getAppreciateCounts(id);
        return appreciate;
    }

    @RequestMapping(value="/{id}/read",method = RequestMethod.POST)
    @ResponseBody
    public Result read(@PathVariable Long id){
        appreciateReadService.readAppreciate(id);
        return Result.ok();
    }

}
