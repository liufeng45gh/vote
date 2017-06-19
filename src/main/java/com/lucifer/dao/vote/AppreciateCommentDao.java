package com.lucifer.dao.vote;

import com.lucifer.dao.IBatisBaseDao;
import com.lucifer.model.vote.AppreciateComment;
import com.lucifer.utils.DateUtils;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/12.
 */
@Component
public class AppreciateCommentDao extends IBatisBaseDao {

    public Integer insertAppreciateComment(AppreciateComment appreciateComment){
        appreciateComment.setCreatedAt(DateUtils.now());
        appreciateComment.setUpdatedAt(DateUtils.now());
        appreciateComment.setTimestamp(DateUtils.now().getTime());
        return this.voteSqlSession.insert("insertAppreciateComment",appreciateComment);
    }

    public List<AppreciateComment> appreciateCommentList(Long appreciateId, Integer offset, Integer count){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("appreciateId",appreciateId);
        param.put("offset",offset);
        param.put("count",count);
        return this.voteSqlSession.selectList("appreciateCommentList",param);
    }

    public AppreciateComment getAppreciateComment(Long id) {
        return this.voteSqlSession.selectOne("getAppreciateComment",id);
    }

    public Integer getAppreciateCommentCount(Long appreciateId) {
        return this.voteSqlSession.selectOne("getAppreciateCommentCount",appreciateId);
    }

    public Integer updateAppreciateCommentCount(Long appreciateId,Integer commentCount){
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("id",appreciateId);
        param.put("commentCount",commentCount);
        return this.voteSqlSession.update("updateAppreciateCommentCount",param);
    }

    public  Integer deleteAppreciateComment(Long id) {
        return this.voteSqlSession.delete("deleteAppreciateComment",id);
    }
}
