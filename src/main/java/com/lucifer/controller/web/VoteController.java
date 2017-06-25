package com.lucifer.controller.web;

import com.lucifer.exception.NotLoginException;
import com.lucifer.model.vote.Vote;
import com.lucifer.service.vote.WxService;
import com.lucifer.utils.Result;
import com.lucifer.utils.StringHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/6/23.
 */

@Controller
@RequestMapping("/vote")
public class VoteController {


    @Resource
    private WxService wxService;
    @RequestMapping(value="/submit",method = RequestMethod.POST)
    @ResponseBody
    public Result voteSubmit(Vote vote, @CookieValue(required = false) String token) throws NotLoginException {
        if(StringHelper.isEmpty(token)) {
            throw new NotLoginException("没有传入token");
        }
        String wxId = wxService.getWxIdByToken(token);
        if (StringHelper.isEmpty(wxId)) {
            throw new NotLoginException("无效token");
        }

        return Result.ok();
    }
}
