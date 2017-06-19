package com.lucifer.service.vote;

import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.utils.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

/**
 * Created by liufx on 17/3/16.
 */
@Component
public class AppreciateReadService extends  Thread{

    @Autowired
    private RedisTemplate redisTemplate;

    @Resource
    private AppreciateDao appreciateDao;

    final Logger logger = LoggerFactory.getLogger(this.getClass());

    public void readAppreciate(Long id){
        redisTemplate.opsForList().leftPush(Constant.CACHE_KEY_PERSISTENCE_READ_APPRECIATE,id);
    }


    @Override
    public void run(){

        logger.info("template is: {}",redisTemplate);
        //logger.info(redisTemplate);

        //Object cacheObject = redisTemplate.opsForValue().get("test--001");

        //log.info("cacheObject is : "+cacheObject);

        while (true){
            executeOne();
        }

    }

    public void executeOne() {
        try {
            Long id = (Long)redisTemplate.opsForList().rightPop(Constant.CACHE_KEY_PERSISTENCE_READ_APPRECIATE);
            if (null == id) {
                logger.debug(Constant.CACHE_KEY_PERSISTENCE_READ_APPRECIATE + "right pop id is null and turn to sleep");
                Thread.sleep(5000);
                return;
            }
            appreciateDao.appreciateAddOneRead(id);
        } catch (Exception e) {
            //log.info("sendOne catch Exception");
            //log.info(e.getMessage());
            e.printStackTrace();
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e1) {
                e1.printStackTrace();
            }
        }
    }

    @PostConstruct
    public void init(){
        this.start();
    }


}
