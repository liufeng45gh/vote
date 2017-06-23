package com.lucifer.service.vote;

import com.lucifer.cache.AppCache;
import com.lucifer.cache.CacheProvider;
import com.lucifer.dao.vote.AppreciateDao;
import com.lucifer.model.vote.Appreciate;
import com.lucifer.model.vote.AppreciateComment;
import com.lucifer.utils.Constant;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liufx on 17/1/16.
 */
@Component
public class AppreciateService {

    @Resource
    private AppreciateDao appreciateDao;

    @Resource
    private AppCache appCache;

    @Resource
    private AppreciateCommentService appreciateCommentService;

    public List<Map> jsonList(Long categoryId, Integer offset,Integer count){
        List<Appreciate> appreciateList = appreciateDao.appreciateList(null,categoryId,offset,count);
        List<Map> resultList = new ArrayList<>();
        for (Appreciate appreciate: appreciateList) {
            List<AppreciateComment> appreciateCommentList = appreciateCommentService.appreciateCommentList(appreciate.getId(),0,5);
            appreciate.setCommentList(appreciateCommentList);
            Map entityMap = new HashMap<>();
            entityMap.put("id",appreciate.getId());
            entityMap.put("pinHtml",appreciate.pinHtml());
            resultList.add(entityMap);
        }
        return resultList;
    }

    public Integer allAppreciateCount() {
          return appCache.find(Constant.CACHE_KEY_ALL_APPRECIATE_COUNT, new CacheProvider() {
              @Override
              public Object getData() {
                  return null;
              }
          });
    }

    public void updateAllAppreciateCount(){
        Integer count = appreciateDao.matchRecordCount(null,null);
        appCache.set(Constant.CACHE_KEY_ALL_APPRECIATE_COUNT,count);
    }
}
