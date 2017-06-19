package com.lucifer.controller.cms.vote;

import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.model.vote.AppreciateCategory;
import com.lucifer.utils.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by fx on 2017/1/30.
 */

@Controller
@RequestMapping("/cms/appreciate")
public class CmsAppreciateCategoryController {

    @Resource
    private AppreciateDao appreciateDao;

    @RequestMapping(value="/category/list",method = RequestMethod.GET)
    public String categoryList(HttpServletRequest request){
        List<AppreciateCategory> appreciateCategoryList= appreciateDao.appreciateCategoryList();
        request.setAttribute("appreciateCategoryList",appreciateCategoryList);
        return "/cms/appreciate/category_list";
    }

    @RequestMapping(value="/category/list.json",method = RequestMethod.GET)
    @ResponseBody
    public List<AppreciateCategory>  categoryListForJSON(HttpServletRequest request){
        List<AppreciateCategory> appreciateCategoryList = appreciateDao.appreciateCategoryList();
        return appreciateCategoryList;
    }

    @RequestMapping(value="/category/add",method = RequestMethod.POST)
    public String categoryAdd(AppreciateCategory appreciateCategory) {
        appreciateDao.addAppreciateCategory(appreciateCategory);
        return "redirect:/cms/appreciate/category/list";
    }

    @RequestMapping(value="/category/delete",method = RequestMethod.POST)
    @ResponseBody
    public Result categoryDelete(Long id) {
        appreciateDao.deleteAppreciateCategory(id);
        return Result.ok();
    }

    @RequestMapping(value="/category/{id}/update",method = RequestMethod.GET)
    public String categoryUpdateInput(@PathVariable Long id, HttpServletRequest request) {
        AppreciateCategory appreciateCategory = appreciateDao.getAppreciateCategory(id);
        request.setAttribute("entity",appreciateCategory);
        return "/cms/appreciate/category_update";
    }

    @RequestMapping(value="/category/update",method = RequestMethod.POST)
    @ResponseBody
    public Result categoryUpdateSubmit(AppreciateCategory appreciateCategory){
        appreciateDao.updateAppreciateCategory(appreciateCategory);
        return Result.ok();
    }

}
