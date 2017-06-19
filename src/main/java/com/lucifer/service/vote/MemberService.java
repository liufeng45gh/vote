package com.lucifer.service.vote;

import com.lucifer.dao.vote.MemberDao;
import com.lucifer.model.SearchParam;
import com.lucifer.model.vote.Member;
import com.lucifer.utils.Md5Utils;
import com.lucifer.utils.Result;
import com.lucifer.utils.StringHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CookieValue;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * Created by liufx on 17/1/16.
 */
@Component
public class MemberService {

    @Resource
    private MemberDao memberDao;

    final Logger logger = LoggerFactory.getLogger(this.getClass());

    public Member getMemberByToken(String token){
        Long userId = memberDao.getMemberIdByToken(token);
        if (null == userId) {
            return null;
        }
        Member member = memberDao.getMemberById(userId);
        return member;
    }
    public Result updateMember(String token, Member member) throws IOException {
        Long userId = memberDao.getMemberIdByToken(token);
        if (null == userId) {
            Result.fail("can not find userId by token: "+token);
        }
        member.setId(userId);
        Result result = this.updateNick(member);
        if (!result.isOk()) {
            return result;
        }
        memberDao.updateMemberInfo(member);
        return Result.ok();
    }

    public Result updateNick(Member member) throws IOException {
        Member dbMember = memberDao.getMemberById(member.getId());

        if (member.getNickName().equals(dbMember.getNickName())) {
            return Result.ok();
        }

        if (memberDao.isNickExist(member.getNickName())) {
            return Result.fail("昵称已被其他人占用");
        }
//        JSONObject jsonObject = sensitiveWordFilter.checkWord(member.getNickName());
//        if (jsonObject.getBoolean("contain")) {
//            String message = "含有敏感词: "+jsonObject.getJSONArray("keywords");
//            return Result.fail(message);
//        }

        memberDao.updateMemberNick(member);
        return Result.ok();
    }

    public void updateMemberAvatar(String token,String avatar) {
        Long userId = memberDao.getMemberIdByToken(token);
        if (null == userId) {
            Result.fail("can not find userId by token: "+token);
        }
        Member member = new Member();
        member.setAvatar(avatar);
        member.setId(userId);
        memberDao.updateMemberAvatar(member);
    }

    public Result updatePassWord(@CookieValue(required = false) String token, String oldPass, String newPass, String repeatPass){
        Member dbMember = this.getMemberByToken(token);
        if (null == dbMember) {
            return Result.fail("您未登陆");
        }

        String md5Password = Md5Utils.md5(Md5Utils.md5(oldPass)+dbMember.getSalt());
        if (!md5Password.equals(dbMember.getPassword())) {
            return Result.fail("原密码错误");
        }
        if (null == newPass) {
            return Result.fail("新密码不能为空");
        }
        if (newPass.length() < 6) {
            return Result.fail("新密码长度必须6位以上");
        }

        if (null == repeatPass) {
            return Result.fail("重复密码不能为空");
        }

        if (repeatPass.length() < 6) {
            return Result.fail("重复密码长度必须6位以上");
        }

        if (!newPass.equals(repeatPass)) {
            return Result.fail("两次密码不一致");
        }

        String md5NewPassword = Md5Utils.md5(Md5Utils.md5(newPass)+dbMember.getSalt());
        dbMember.setPassword(md5NewPassword);
        memberDao.updateMemberPassword(dbMember);
        return Result.ok();
    }

    public List<Member> memberCmsSearch(SearchParam param){
        String sql = "select * from user   where 1=1 ";
        if (!StringHelper.isEmpty(param.getAccount())) {
            sql = sql + "and user.account like '"+param.getAccount()+"%' ";
        }
        if (!StringHelper.isEmpty(param.getNickName())) {
            sql = sql + "and user.nick_name like '"+param.getNickName()+"%' ";
        }

        if (!StringHelper.isEmpty(param.getStatus())) {
            sql = sql + "and user.status = '"+param.getStatus()+"' ";
        }
        if (!StringHelper.isEmpty(param.getRoleId())) {
            sql = sql + "and user.role_id = '"+param.getRoleId()+"' ";
        }
        sql = sql + "order by user.id desc limit "+param.getOffset()+","+param.getCount();



        logger.info("sql is : "+sql);

        List<Member> memberList = memberDao.memberCmsSearch(sql);



        return memberList;
    }

    public Integer memberCmsSearchCount(SearchParam param){
        String sql = "select count(*) from user  where 1=1 ";
        if (!StringHelper.isEmpty(param.getAccount())) {
            sql = sql + "and user.account like '"+param.getAccount()+"%' ";
        }
        if (!StringHelper.isEmpty(param.getNickName())) {
            sql = sql + "and user.nick_name like '"+param.getNickName()+"%' ";
        }

        if (!StringHelper.isEmpty(param.getStatus())) {
            sql = sql + "and user.status = '"+param.getStatus()+"' ";
        }
        if (!StringHelper.isEmpty(param.getRoleId())) {
            sql = sql + "and user.role_id = '"+param.getRoleId()+"' ";
        }

        logger.info("sql is : "+sql);

        Integer recordCount  = memberDao.memberCmsSearchCount(sql);


        return recordCount;
    }
}
