package com.lucifer.service.vote;

import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.dao.vote.MemberDao;
import com.lucifer.utils.Constant;
import com.lucifer.utils.DateUtils;
import com.lucifer.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by liufx on 17/3/15.
 */
@Component
public class AppreciateLikeService {

    @Autowired
    private RedisTemplate redisTemplate;

    @Resource
    private MemberDao memberDao;

    @Resource
    private AppreciateDao appreciateDao;



    public Result saveLike(Long appreciateId, String token) {
        Long userId = memberDao.getMemberIdByToken(token);
        if (null == userId) {
            return Result.fail("你还没有登录");
        }
        boolean isLiked = this.isLiked(appreciateId,userId);
        if (isLiked) {
           return Result.ok("您已赞过");
        }
        redisTemplate.opsForZSet().add(Constant.CACHE_KEY_PRAISE_APPRECIATE_PRE+appreciateId,userId, DateUtils.now().getTime());
        this.resetDbLikeCount(appreciateId);
        return Result.ok();

    }

    public boolean isLiked(Long appreciateId,Long userId) {
        Double score = redisTemplate.opsForZSet().score(Constant.CACHE_KEY_PRAISE_APPRECIATE_PRE+appreciateId,userId);
        if (null != score) {
            return true;
        }
        return false;
    }

    public Result isLiked(Long appreciateId, String token) {
        Long userId = memberDao.getMemberIdByToken(token);
        if (null == userId) {
            return Result.fail("你还没有登录");
        }
        boolean isLiked = this.isLiked(appreciateId,userId);
        if (isLiked) {
            return Result.ok();
        }
        return Result.fail();
    }

    public Integer likeCount(Long appreciateId){
        Long count =  redisTemplate.opsForZSet().zCard(Constant.CACHE_KEY_PRAISE_APPRECIATE_PRE+appreciateId);
        if (null == count) {
            return 0;
        }
        return count.intValue();
//      return sqlSession.selectOne("selectActivePraiseCount",activeId);
    }

    public void resetDbLikeCount(Long appreciateId){
        Integer count = this.likeCount(appreciateId);
        appreciateDao.updateAppreciateLikeCount(appreciateId,count);
        appreciateDao.removeAppreciateCache(appreciateId);
    }
}
