package com.lucifer.service.vote;

import com.lucifer.cache.AppCache;
import com.lucifer.cache.CacheProvider;
import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.dao.vote.VoteDao;
import com.lucifer.exception.ArgumentException;
import com.lucifer.exception.RepetitiveOperationException;
import com.lucifer.model.vote.Appreciate;
import com.lucifer.model.vote.Vote;
import com.lucifer.utils.Constant;
import io.swagger.models.auth.In;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by liufx on 2017/6/26.
 */

@Component
public class VoteService {
    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private VoteDao voteDao;

    @Resource
    private AppreciateDao appreciateDao;


    @Resource
    private AppCache appCache;

    public void checkVoteRepeat(Vote vote) throws RepetitiveOperationException ,ArgumentException{
        Appreciate appreciate = appreciateDao.getAppreciate(vote.getAppreciateId());
        if (null == appreciate) {
            throw new ArgumentException("作品 不存在");
        }
        vote.setCategoryId(appreciate.getCategoryId());

        Integer count = voteDao.getTodayCategoryCount(vote);
        logger.info("count is {}",count );
        if (count>4) {
            throw new RepetitiveOperationException("每天没类作品最多投5票");
        }



    }

    public void saveVote(Vote vote) throws RepetitiveOperationException {
//        if(true){
//            throw new RepetitiveOperationException("投票已结束谢谢参与");
//        }
        //logger.info("insert vote {}",vote);
        try{
            voteDao.insertVote(vote);
        } catch (Exception e){
           // logger.error("exception",e);
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
