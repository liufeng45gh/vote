package com.lucifer.controller.web;

import com.lucifer.config.ServerConfig;
import com.lucifer.exception.ArgumentException;
import com.lucifer.exception.NotLoginException;
import com.lucifer.exception.RepetitiveOperationException;
import com.lucifer.model.vote.Vote;
import com.lucifer.service.vote.VoteService;
import com.lucifer.service.vote.WxService;
import com.lucifer.utils.Result;
import com.lucifer.utils.StringHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017/6/23.
 */

@Controller
@RequestMapping("/api/vote")
public class VoteController {

    @Resource
    private WxService wxService;

    @Resource
    private VoteService voteService;

    @Resource
    private ServerConfig serverConfig;

    final Logger logger = LoggerFactory.getLogger(this.getClass());

    
    @RequestMapping(value="/submit",method = RequestMethod.POST)
    @ResponseBody
    public Result voteSubmit(Vote vote, @RequestHeader(required = false,name = "Authorization") String token) throws NotLoginException, ArgumentException, RepetitiveOperationException {

        logger.info("token is: {}",token);
        if(StringHelper.isEmpty(token)) {
            throw new NotLoginException("没有传入token");
        }
        String wxId = wxService.getWxIdByToken(token);
        logger.info("wxId is : {}",wxId);
        if (StringHelper.isEmpty(wxId)) {
            throw new NotLoginException("无效token");
        }
        if (vote.getAppreciateId() == null) {
            throw new ArgumentException("appreciateId 不能为空");
        }

        if(serverConfig.isAfterDeadline()){
            throw new ArgumentException("投票已结束");
        }

        vote.setWxId(wxId);
        voteService.checkVoteRepeat(vote);
        voteService.saveVote(vote);

        return Result.ok();
    }

    @RequestMapping(value="/reset-all-count",method = RequestMethod.POST)
    @ResponseBody
    public Result resetAllVoteCount(){
        voteService.resetAllVoteCount();
        return Result.ok();
    }


}
