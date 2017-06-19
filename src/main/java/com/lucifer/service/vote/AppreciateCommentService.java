package com.lucifer.service.vote;

import com.lucifer.dao.vote.AppreciateCommentDao;
import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.dao.vote.MemberDao;
import com.lucifer.model.vote.AppreciateComment;
import com.lucifer.model.vote.Member;
import com.lucifer.utils.Result;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/12.
 */
@Component
public class AppreciateCommentService {

    @Resource
    private MemberService memberService;

    @Resource
    private MemberDao memberDao;

    @Resource
    private AppreciateCommentDao appreciateCommentDao;

    @Resource
    private AppreciateDao appreciateDao;

    @Resource
    private MessageService messageService;

    @Transactional(propagation= Propagation.REQUIRED)
    public Result saveComment(AppreciateComment appreciateComment, String token){
//        Long userId = memberDao.getMemberIdByToken(token);
//        if (null == userId) {
//            return Result.fail("你还没有登录");
//        }
        Member member = memberService.getMemberByToken(token);
        if (null == member) {
            return Result.fail("你还没有登录");
        }
        appreciateComment.setUserId(member.getId());
        appreciateComment.setUserNick(member.getNickName());
        if (appreciateComment.getParentId() != null) {
            AppreciateComment parentComment = appreciateCommentDao.getAppreciateComment(appreciateComment.getParentId());
            Member parentMember = memberDao.getMemberById(parentComment.getUserId());
            appreciateComment.setAnswerUserId(parentComment.getUserId());
            appreciateComment.setAnswerUserNick(parentMember.getNickName());
            appreciateComment.setAnswerContent(parentComment.getContent());

            appreciateCommentDao.insertAppreciateComment(appreciateComment);
            messageService.saveReplyAppreciateCommentMessage(parentComment.getUserId(),member.getId(),appreciateComment.getContent(),parentComment.getContent(),appreciateComment.getId().toString());

        } else {
            appreciateCommentDao.insertAppreciateComment(appreciateComment);
        }

        this.resetCommentCount(appreciateComment.getAppreciateId());

        return Result.ok();
    }

    public List<AppreciateComment> appreciateCommentList(Long appreciateId,Integer offset,Integer count){
        List<AppreciateComment> appreciateCommentList = appreciateCommentDao.appreciateCommentList(appreciateId, offset, count);
        for (AppreciateComment appreciateComment: appreciateCommentList) {
            Member member = memberDao.getMemberById(appreciateComment.getUserId());
            appreciateComment.setUser(member);
        }
        return appreciateCommentList;
    }

    private void resetCommentCount(Long appreciateId){
        Integer count = appreciateCommentDao.getAppreciateCommentCount(appreciateId);
        appreciateCommentDao.updateAppreciateCommentCount(appreciateId,count);
        appreciateDao.removeAppreciateCache(appreciateId);
    }

    @Transactional(propagation= Propagation.REQUIRED)
    public void deleteComment(Long id){
        AppreciateComment comment = appreciateCommentDao.getAppreciateComment(id);
        appreciateCommentDao.deleteAppreciateComment(id);
        this.resetCommentCount(comment.getAppreciateId());
    }
}
