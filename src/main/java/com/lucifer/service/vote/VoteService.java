package com.lucifer.service.vote;

import com.lucifer.cache.AppCache;
import com.lucifer.cache.CacheProvider;
import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.dao.vote.VoteDao;
import com.lucifer.exception.RepetitiveOperationException;
import com.lucifer.model.vote.Appreciate;
import com.lucifer.model.vote.Vote;
import com.lucifer.utils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by liufx on 2017/6/26.
 */

@Component
public class VoteService {

    @Resource
    private VoteDao voteDao;

    @Resource
    private AppreciateDao appreciateDao;


    @Resource
    private AppCache appCache;

    public void saveVote(Vote vote) throws RepetitiveOperationException {
        if(true){
            throw new RepetitiveOperationException("投票已结束谢谢参与");
        }
        try{
            voteDao.insertVote(vote);
        } catch (Exception e){
           throw new RepetitiveOperationException("重复投票");
        }

        this.resetAppreciateVoteCount(vote.getAppreciateId());
        this.resetAllVoteCount();

    }

    public void resetAppreciateVoteCount(Long appreciateId){
        Integer count = voteDao.getAppreciateVoteCount(appreciateId);
        appreciateDao.updateAppreciateVoteCount(appreciateId,count);
    }

   

    public Integer allVoteCount() {
        return appCache.find(Constant.CACHE_KEY_ALL_VOTE_COUNT, new CacheProvider() {
            @Override
            public Object getData() {
                return null;
            }
        });
    }

    public void resetAllVoteCount(){
        Integer count = voteDao.getAllVoteCount();
        appCache.set(Constant.CACHE_KEY_ALL_VOTE_COUNT,count);
    }
}
