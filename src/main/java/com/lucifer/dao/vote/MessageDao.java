package com.lucifer.dao.vote;

import com.lucifer.dao.IBatisBaseDao;
import com.lucifer.model.vote.Message;
import com.lucifer.utils.DateUtils;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liufx on 17/3/18.
 */
@Component
public class MessageDao extends IBatisBaseDao {

    public List<Message> messageList(Long userId,Integer offset,Integer count) {
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("toUserId",userId);
        param.put("offset",offset);
        param.put("count",count);
        return this.voteSqlSession.selectList("messageList",param);
    }

    public Integer insertMessage(Message message) {
        message.setCreatedAt(DateUtils.now());
        message.setUpdatedAt(DateUtils.now());
        message.setIsDeleted(0);
        message.setIsRead(0);
        return this.voteSqlSession.insert("insertMessage",message);
    }

}
