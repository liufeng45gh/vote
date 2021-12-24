package com.lucifer.dao.vote;

import com.lucifer.cache.AppCache;
import com.lucifer.cache.CacheProvider;
import com.lucifer.dao.IBatisBaseDao;
import com.lucifer.model.vote.Appreciate;
import com.lucifer.model.vote.AppreciateCategory;
import com.lucifer.service.vote.AppreciateService;
import com.lucifer.utils.Constant;
import com.lucifer.utils.DateUtils;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liufx on 17/1/16.
 */
@Component
public class AppreciateDao  extends IBatisBaseDao {

    @Resource
    private AppCache appCache;

    @Resource
    private AppreciateService appreciateService;

    public List<AppreciateCategory> appreciateCategoryList(){
        return this.voteSqlSession.selectList("appreciateCategoryList");
    }

    public Integer addAppreciateCategory(AppreciateCategory appreciateCategory){
        return this.voteSqlSession.insert("addAppreciateCategory",appreciateCategory);
    }

    public Integer deleteAppreciateCategory(Long id){
        return this.voteSqlSession.delete("deleteAppreciateCategory",id);
    }

    public AppreciateCategory getAppreciateCategory(Long id){
        return this.voteSqlSession.selectOne("getAppreciateCategory",id);
    }

    public Integer updateAppreciateCategory(AppreciateCategory appreciateCategory){
        return this.voteSqlSession.update("updateAppreciateCategory",appreciateCategory);
    }

    public List<Appreciate> appreciateList(String title, Long categoryId, Integer offset, Integer count){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("title",title);
        param.put("categoryId",categoryId);
        param.put("offset",offset);
        param.put("count",count);
        return this.voteSqlSession.selectList("appreciateList",param);
    }

    public List<Appreciate> appreciateTopList(String title, Integer offset, Integer count){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("title",title);
        param.put("offset",offset);
        param.put("count",count);
        return this.voteSqlSession.selectList("appreciateTopList",param);
    }

    public Integer matchRecordCount(String title,Long categoryId){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("title",title);
        param.put("categoryId",categoryId);
        return this.voteSqlSession.selectOne("cmsAppreciateMatchRecordCount",param);
    }

    public Integer matchTopRecordCount(String title){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("title",title);
        return this.voteSqlSession.selectOne("cmsAppreciateTopMatchRecordCount",param);
    }

    public Integer insertAppreciate(Appreciate appreciate){
        appreciate.setCreatedAt(DateUtils.now());
        appreciate.setUpdatedAt(DateUtils.now());
        //news.setTop(0f);
        appreciate.setClickCount(0);
        Integer updateCount =  this.voteSqlSession.insert("insertAppreciate",appreciate);
        appreciateService.updateAllAppreciateCount();
        return updateCount;
    }

    public Appreciate getAppreciate(Long id){
        return voteSqlSession.selectOne("getAppreciate",id);
//        String key = Constant.CACHE_KEY_GET_APPRECIATE + id;
//        return appCache.find(key, new CacheProvider() {
//            @Override
//            public Object getData() {
//                return voteSqlSession.selectOne("getAppreciate",id);
//            }
//        });

    }

    public void removeAppreciateCache(Long id){
        String key = Constant.CACHE_KEY_GET_APPRECIATE + id;
        appCache.remove(key);
    }

    public Appreciate getAppreciateCounts(Long id){
        return this.voteSqlSession.selectOne("getAppreciateCounts",id);
    }

    public Integer updateAppreciate(Appreciate appreciate){
        appreciate.setUpdatedAt(DateUtils.now());
        removeAppreciateCache(appreciate.getId());
        return this.voteSqlSession.update("updateAppreciate",appreciate);
    }

    public Integer deleteAppreciate(Long id){
        Integer updateCount = this.voteSqlSession.delete("deleteAppreciate",id);
        appreciateService.updateAllAppreciateCount();
        return updateCount;
    }

    public List<Appreciate> appreciateListOrderByUpdatedAt(Date updatedAt, int count){
        Map param = new HashMap();
        param.put("updatedAt", updatedAt);
        param.put("count", count);
        return this.voteSqlSession.selectList("appreciateListOrderByUpdatedAt",param);
    }

    public Integer updateAppreciateLikeCount(Long id,Integer likeCount) {
        Map param = new HashMap();
        param.put("id", id);
        param.put("likeCount", likeCount);
        return this.voteSqlSession.update("updateAppreciateLikeCount",param);
    }

    public Integer appreciateAddOneRead(Long id){
        return this.voteSqlSession.update("appreciateAddOneRead",id);
    }

    public Integer updateAppreciateVoteCount(Long id,Integer voteCount){
        Map param = new HashMap();
        param.put("id", id);
        param.put("voteCount", voteCount);
        return this.voteSqlSession.update("updateAppreciateVoteCount",param);
    }
}
