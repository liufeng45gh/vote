package com.lucifer.controller.web;

import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.model.vote.Appreciate;
import com.lucifer.model.vote.AppreciateCategory;
import com.lucifer.service.vote.AppreciateReadService;
import com.lucifer.service.vote.AppreciateService;
import com.lucifer.utils.Constant;
import com.lucifer.utils.PageInfoWriter;
import com.lucifer.utils.Result;
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
    public String index(HttpServletRequest request,
                        @RequestParam(value = "categoryId",required=false,defaultValue="") Long categoryId,
                        @RequestParam(value = "page",required=false,defaultValue="1")Integer page){
        Integer pageSize = Constant.PAGESIZE;
        Integer offset = (page-1) * pageSize;
        //List<Appreciate> appreciateList = appreciateDao.appreciateList(null,categoryId,offset,pageSize);
        //request.setAttribute("appreciateList",appreciateList);

        List<AppreciateCategory> appreciateCategoryList =  appreciateDao.appreciateCategoryList();

        request.setAttribute("appreciateCategoryList",appreciateCategoryList);

        if (null != categoryId) {
            AppreciateCategory appreciateCategory = appreciateDao.getAppreciateCategory(categoryId);
            request.setAttribute("appreciateCategory",appreciateCategory);
        }


        return "/web/appreciate/index";
    }

    @RequestMapping(value="/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,
                       @RequestParam(value = "categoryId",required=false,defaultValue="") Long categoryId,
                       @RequestParam(value = "page",required=false,defaultValue="1")Integer page){
        Integer pageSize = Constant.PAGESIZE;
        Integer offset = (page-1) * pageSize;
        List<Appreciate> appreciateList = appreciateDao.appreciateList(null,categoryId,offset,pageSize);
        request.setAttribute("appreciateList",appreciateList);
        return "/web/appreciate/list";

    }

    @RequestMapping(value="/list.json",method = RequestMethod.GET)
    @ResponseBody
    public List<Map> jsonList(HttpServletRequest request,
                       @RequestParam(value = "categoryId",required=false,defaultValue="") Long categoryId,
                       @RequestParam(value = "page",required=false,defaultValue="1")Integer page){
        Integer pageSize = Constant.PAGESIZE;
        Integer offset = (page-1) * pageSize;

        List<Map> resultList = appreciateService.jsonList(categoryId,offset,pageSize);
        //request.setAttribute("appreciateList",appreciateList);
        return resultList;

    }

    @RequestMapping(value="/{id}/detail",method = RequestMethod.GET)
    public String detail(HttpServletRequest request,@PathVariable Long id){
        Appreciate appreciate = appreciateDao.getAppreciate(id);
        request.setAttribute("entity",appreciate);
        return "/web/appreciate/detail";
    }


    @RequestMapping(value="/search",method = RequestMethod.GET)
    public String search(HttpServletRequest request,
                        @RequestParam(value = "page",required=false,defaultValue="1")Integer page,
                         @RequestParam(value = "title",required=false,defaultValue="")String title){
        Integer pageSize = Constant.PAGESIZE;
        Integer offset = (page-1) * pageSize;
        //List<Appreciate> appreciateList = appreciateDao.appreciateList(null,categoryId,offset,pageSize);
        //request.setAttribute("appreciateList",appreciateList);

        request.setAttribute("title",title);


        return "/web/appreciate/search";
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
