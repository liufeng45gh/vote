package com.lucifer.controller.web;

import com.lucifer.service.vote.AppreciateLikeService;
import com.lucifer.utils.Result;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * Created by liufx on 17/3/15.
 */
@Controller
@RequestMapping("/appreciate")
public class WebAppreciateLikeController {

    @Resource
    private AppreciateLikeService appreciateLikeService;

    @ApiOperation(value = "赞鉴赏", notes = "赞鉴赏")
    @RequestMapping(value="/{appreciateId}/like",method= RequestMethod.POST)
    @ResponseBody
    public Result saveLike(@PathVariable(value = "appreciateId") Long appreciateId, @CookieValue(required = false) String token){
        return appreciateLikeService.saveLike(appreciateId,token);
    }

    @ApiOperation(value = "是否赞过鉴赏", notes = "是否赞过鉴赏")
    @RequestMapping(value="/{appreciateId}/like",method= RequestMethod.GET)
    @ResponseBody
    public Result isLiked(@PathVariable(value = "appreciateId") Long appreciateId, @CookieValue(required = false) String token){
        return appreciateLikeService.isLiked(appreciateId,token);
    }
}
