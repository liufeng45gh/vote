package com.lucifer.dao.vote;

import com.lucifer.dao.IBatisBaseDao;
import com.lucifer.model.vote.Vote;
import com.lucifer.utils.DateUtils;
import org.springframework.stereotype.Component;

/**
 * Created by liufx on 2017/6/26.
 */
@Component
public class VoteDao  extends IBatisBaseDao {

    public void insertVote(Vote vote){
        vote.setDate(DateUtils.now());
        vote.setCreatedAt(DateUtils.now());
        vote.setUpdatedAt(DateUtils.now());
        this.voteSqlSession.insert("insertVote",vote);
    }

    public Integer getAppreciateVoteCount(Long appreciateId){
         return  this.voteSqlSession.selectOne("getAppreciateVoteCount",appreciateId);
    }

    public Integer getAllVoteCount(){
        return  this.voteSqlSession.selectOne("getAllVoteCount");
    }

    public Integer getTodayCategoryCount(Vote vote){
        return this.voteSqlSession.selectOne("getTodayCategoryCount",vote);
    }
}
