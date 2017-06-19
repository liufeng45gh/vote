package com.lucifer.controller.cms.vote;

import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.model.vote.Appreciate;
import com.lucifer.model.vote.AppreciateCategory;
import com.lucifer.model.vote.AppreciateComment;
import com.lucifer.service.vote.AppreciateCommentService;
import com.lucifer.utils.Constant;
import com.lucifer.utils.DateUtils;
import com.lucifer.utils.PageUtil;
import com.lucifer.utils.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by liufx on 17/1/16.
 */

@Controller
@RequestMapping("/cms/appreciate")
public class CmsAppreciateController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private AppreciateDao appreciateDao;

    @Resource
    private AppreciateCommentService appreciateCommentService;

    @RequestMapping(value="/list",method = RequestMethod.GET)
    public String appreciateList(HttpServletRequest request, @RequestParam(value = "title",required=false,defaultValue="") String title,
                                 @RequestParam(value = "categoryId",required=false,defaultValue="") Long categoryId,
                           @RequestParam(value = "page",required=false,defaultValue="1")Integer page){
        Integer pageSize = Constant.PAGESIZE;
        Integer offset = (page-1) * pageSize;
        List<Appreciate> appreciateList = appreciateDao.appreciateList(title,categoryId,offset,pageSize);
        request.setAttribute("appreciateList",appreciateList);

        Integer matchRecordCount=appreciateDao.matchRecordCount(title,categoryId);

        Integer totalPageCount= PageUtil.getTotalPageCount(matchRecordCount, pageSize);

        PageUtil pageUtil = new PageUtil(request);
        String pageDiv = pageUtil.willPaginate(totalPageCount,  "pages_bar",new String []{"page","msg"});
        request.setAttribute("pageDiv",pageDiv);
        request.setAttribute("title",title);
        return "/cms/appreciate/list";
    }

    @RequestMapping(value="/top-list",method = RequestMethod.GET)
    public String appreciateTopList(HttpServletRequest request, @RequestParam(value = "title",required=false,defaultValue="") String title,
                                 @RequestParam(value = "page",required=false,defaultValue="1")Integer page){
        Integer pageSize = Constant.PAGESIZE;
        Integer offset = (page-1) * pageSize;
        List<Appreciate> appreciateList = appreciateDao.appreciateTopList(title,offset,pageSize);
        request.setAttribute("appreciateList",appreciateList);

        Integer matchRecordCount=appreciateDao.matchTopRecordCount(title);

        Integer totalPageCount= PageUtil.getTotalPageCount(matchRecordCount, pageSize);

        PageUtil pageUtil = new PageUtil(request);
        String pageDiv = pageUtil.willPaginate(totalPageCount,  "pages_bar",new String []{"page","msg"});
        request.setAttribute("pageDiv",pageDiv);
        request.setAttribute("title",title);
        return "/cms/appreciate/top_list";
    }

    @RequestMapping(value="/add",method = RequestMethod.GET)
    public String appreciateAddInput(HttpServletRequest request){
        List<AppreciateCategory> appreciateCategoryList = appreciateDao.appreciateCategoryList();
        request.setAttribute("appreciateCategoryList",appreciateCategoryList);

        Appreciate appreciate = new Appreciate();
        request.setAttribute("entity",appreciate);
        appreciate.setLogo("/cms/images/logo.png");
        appreciate.setPublishAt(DateUtils.now());
        return "/cms/appreciate/add";
    }

    @RequestMapping(value="/add",method = RequestMethod.POST)
    @ResponseBody
    public Result appreciateAddSubmit(Appreciate appreciate){
        logger.info(" appreciate AddSubmit has been called");
        appreciateDao.insertAppreciate(appreciate);
        return Result.ok();
    }
    @RequestMapping(value="/{id}/update",method = RequestMethod.GET)
    public String appreciateUpdateInput(HttpServletRequest request,@PathVariable Long id){
        Appreciate appreciate = appreciateDao.getAppreciate(id);
        request.setAttribute("entity",appreciate);
//        request.setAttribute("publishAt",news.getPublishAt());

        List<AppreciateCategory> appreciateCategoryList = appreciateDao.appreciateCategoryList();
        request.setAttribute("appreciateCategoryList",appreciateCategoryList);
        return "/cms/appreciate/update";
    }

    @RequestMapping(value="/update",method = RequestMethod.POST)
    @ResponseBody
    public Result appreciateUpdateSubmit(Appreciate appreciate){
        appreciateDao.updateAppreciate(appreciate);

        return Result.ok();
    }

    @RequestMapping(value="/{id}/delete",method = RequestMethod.POST)
    @ResponseBody
    public Result deleteAppreciate(@PathVariable Long id) {
        appreciateDao.deleteAppreciate(id);
        return Result.ok();
    }

    @RequestMapping(value="/{appreciateId}/comments",method = RequestMethod.GET)
    public String comments(HttpServletRequest request,
                              @PathVariable Long appreciateId
                              ){
        Appreciate appreciate = appreciateDao.getAppreciate(appreciateId);
        request.setAttribute("entity",appreciate);
        return "/cms/appreciate/comments";
    }

    @RequestMapping(value="/{appreciateId}/comment-list",method = RequestMethod.GET)
    public String commentList(HttpServletRequest request,
                              @PathVariable Long appreciateId,
                              @RequestParam(value = "page",required=false,defaultValue="1") Integer page){
        Integer pageSize = Constant.PAGESIZE;
        Integer offset = (page-1) * pageSize;
        List<AppreciateComment> commentList = appreciateCommentService.appreciateCommentList(appreciateId,offset,pageSize);
        request.setAttribute("dataList",commentList);
        return "/cms/appreciate/comment-list";
    }

    @RequestMapping(value="/comment/{id}/delete",method = RequestMethod.POST)
    @ResponseBody
    public Result deleteComment(@PathVariable Long id){
        appreciateCommentService.deleteComment(id);
        return Result.ok();
    }


}
