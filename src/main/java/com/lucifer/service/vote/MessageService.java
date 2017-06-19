package com.lucifer.service.vote;

import com.lucifer.dao.vote.MemberDao;
import com.lucifer.dao.vote.MessageDao;
import com.lucifer.enums.MessageType;
import com.lucifer.model.vote.Member;
import com.lucifer.model.vote.Message;
import com.lucifer.utils.Constant;
import com.lucifer.utils.StringHelper;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liufx on 17/3/18.
 */
@Component
public class MessageService {

    @Resource
    private MessageDao messageDao;

    @Resource
    private MemberDao memberDao;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    public List<Message> messageList(String token,Integer offset,Integer count){
        Long userId = memberDao.getMemberIdByToken(token);
        if (null == userId) {
            return null;
        }
        List<Message> messageList = messageDao.messageList(userId,offset,count);
        for (Message message: messageList) {
            Member member = memberDao.getMemberById(message.getFromUserId());
            message.setFrom(member);
        }
        return messageList;
    }

    public void saveReplyAppreciateCommentMessage(Long fromUserId,Long toUserId,String text,String parentText,String targetId){
        Message message = new Message();
        message.setType(MessageType.reply_appreciate_comment.name());
        message.setFromUserId(fromUserId);
        message.setToUserId(toUserId);
        message.setText(text);
        message.setParentText(parentText);
        message.setTargetId(targetId);
        messageDao.insertMessage(message);
        String key = Constant.CACHE_KEY_PERSISTENCE_MESSAGE_NEW_COUNT + toUserId;
        stringRedisTemplate.opsForValue().increment(key,1l);
    }

    public Integer newMessageCount(String token){
        Long userId = memberDao.getMemberIdByToken(token);
        if (null == userId) {
            return 0;
        }
        String key = Constant.CACHE_KEY_PERSISTENCE_MESSAGE_NEW_COUNT + userId;
        String count =  stringRedisTemplate.opsForValue().get(key);
        if (!StringHelper.isEmpty(count)) {
             return Integer.valueOf(count);
        }
        return 0;
    }

    public void clearMessageCount(String token){
        Long userId = memberDao.getMemberIdByToken(token);
        if (null == userId) {
            return ;
        }
        String key = Constant.CACHE_KEY_PERSISTENCE_MESSAGE_NEW_COUNT + userId;
        stringRedisTemplate.delete(key);

    }
}
