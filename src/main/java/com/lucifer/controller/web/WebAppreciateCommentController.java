package com.lucifer.controller.web;

import com.lucifer.model.vote.AppreciateComment;
import com.lucifer.service.vote.AppreciateCommentService;
import com.lucifer.utils.Constant;
import com.lucifer.utils.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2017/3/12.
 */
@Controller
@RequestMapping("/appreciate")
public class WebAppreciateCommentController {

    @Resource
    private AppreciateCommentService appreciateCommentService;

    @RequestMapping(value="/post-comment",method = RequestMethod.POST)
    @ResponseBody
    public Result postComment(AppreciateComment appreciateComment, @CookieValue(required = false) String token){
        return appreciateCommentService.saveComment(appreciateComment,token);
        //return Result.ok();
    }

    @RequestMapping(value="/{appreciateId}/comment-list",method = RequestMethod.GET)
    public String commentList(HttpServletRequest request,
                              @PathVariable Long appreciateId,
                              @RequestParam(value = "page",required=false,defaultValue="1") Integer page){
        Integer pageSize = Constant.PAGESIZE;
        Integer offset = (page-1) * pageSize;
        List<AppreciateComment> commentList = appreciateCommentService.appreciateCommentList(appreciateId,offset,pageSize);
        request.setAttribute("dataList",commentList);
        return "/web/appreciate/comment-list";
    }

    @RequestMapping(value="/reply",method = RequestMethod.GET)
    public String replyInput(){
        return "/web/appreciate/reply";
    }
}
