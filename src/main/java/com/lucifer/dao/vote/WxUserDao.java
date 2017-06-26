package com.lucifer.dao.vote;

import com.lucifer.dao.IBatisBaseDao;
import com.lucifer.model.vote.WxInfo;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2017/6/24.
 */
@Component
public class WxUserDao extends IBatisBaseDao {

    public WxInfo getWxUserByWxId(String wxId){
        return this.voteSqlSession.selectOne("getWxUserByWxId",wxId);
    }

    public Integer insertWxUser(WxInfo wxInfo){
        return this.voteSqlSession.insert("insertWxUser",wxInfo);
    }
}
