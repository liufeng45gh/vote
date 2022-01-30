package com.lucifer.controller.web;

import com.lucifer.config.ImageConfig;
import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.model.vote.Appreciate;
import com.lucifer.model.vote.AppreciateCategory;
import com.lucifer.service.vote.AppreciateReadService;
import com.lucifer.service.vote.AppreciateService;
import com.lucifer.service.vote.VoteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiAppreciateController {

    @Resource
    private AppreciateDao appreciateDao;



    @Resource
    private AppreciateService appreciateService;

    @Resource
    private AppreciateReadService appreciateReadService;

    @Resource
    private VoteService voteService;


    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @GetMapping("/resources")
    @ResponseBody
    public Map<String,String> resources(){
        return ImageConfig.resource;
    }


    @RequestMapping(value="/category/list",method = RequestMethod.GET)
    public List<AppreciateCategory> categoryApi(HttpServletRequest request){
        List<AppreciateCategory> appreciateCategoryList =  appreciateDao.appreciateCategoryList();
        return appreciateCategoryList;
    }

    @RequestMapping(value="/category/{id}",method = RequestMethod.GET)
    public AppreciateCategory getCategory(@PathVariable(name = "id") Long id){
        AppreciateCategory currentCategory = appreciateDao.getAppreciateCategory(id);
        return currentCategory;
    }

    @RequestMapping(value="/appreciate-list/{categoryId}",method = RequestMethod.GET)
    public List<Appreciate> listByCategory(HttpServletRequest request,@PathVariable(name = "categoryId") Long categoryId){
        List<Appreciate> appreciateList = appreciateDao.appreciateList(null,categoryId,0,1000);
        return appreciateList;
    }

    @GetMapping(value="/vote-count")
    public Integer listByCategory(){
        Integer allVoteCount = voteService.allVoteCount();
        return allVoteCount;
    }
}
