package com.lucifer.dao.vote;

import com.lucifer.cache.AppCache;
import com.lucifer.cache.CacheProvider;
import com.lucifer.dao.IBatisBaseDao;
import com.lucifer.dao.UserDao;
import com.lucifer.model.AccessToken;
import com.lucifer.model.User;
import com.lucifer.model.vote.Member;
import com.lucifer.utils.Constant;
import com.lucifer.utils.StringHelper;
import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Created by liufx on 17/1/16.
 */
@Component
public class MemberDao extends IBatisBaseDao {

    static final Logger logger = LoggerFactory.getLogger(UserDao.class);

    @Autowired
    private AppCache appCache;

    @Autowired
    private RedisTemplate redisTemplate;


    public void removeAllUserCacheing(){
        logger.info("removeAllCacheing  has been called!!----");
        String keyPattern = "VOTE:CACHE:MEMBER:getMemberById:*";
        appCache.removeAll(keyPattern);
    }



    //@Cacheable(value="userByPhoneCache", key="'userByPhoneCache:'+#phone")//
    public Member getMemberByPhone(final String phone){
         return voteSqlSession.selectOne("getMemberByPhone", phone);
    }




    //@Cacheable(value="userByWeixinIdCache", key="'userByWeixinIdCache:'+#weixinId" )//
    public Member getMemberByWxId(final String wxId){
         return voteSqlSession.selectOne("getMemberByWxId", wxId);
        //return (User)sqlSession.selectOne("getUserByWeixinId", weixinId);
    }

    //@Cacheable(value="userByQqIdCache" ,key="'userByQqIdCache:'+#qqId")
    public Member getMemberByQqId(String qqId){
        return (Member)voteSqlSession.selectOne("getMemberByQqId", qqId);
    }



     public void removeMemberCache(Member user){
        logger.info("removeMemberCache has been called");
        String key = "VOTE:CACHE:MEMBER:getMemberById:"+user.getId();
        appCache.remove(key);

    }



    /**
     * 修改密码
     * @param member
     * @return
     */
    //@CacheEvict(value="userByIdCache",key="#user.getUserId()")// 清空accountCache 缓存
    public Integer updateMemberPassword(Member member){
        String key = "VOTE:CACHE:MEMBER:getMemberById:"+member.getId();
        appCache.remove(key);
        return voteSqlSession.update("updateMemberPassword", member);
    }

    /**
     * 绑定手机
     * @param member
     * @return
     */
    //@CacheEvict(value="userByIdCache",key="#user.getUserId()")// 清空accountCache 缓存
//	@Caching( evict = { @CacheEvict(value="userByIdCache",key="#user.getUserId()"),
//	         @CacheEvict(value="userByPhoneCache",key="#user.getPhone()") })
    public Integer memberBindPhone(Member member){
        this.removeMemberCache(member);
        return voteSqlSession.update("memberBindPhone", member);
    }



    public Integer updateMemberWeixinId(Member member) {
        this.removeMemberCache(member);
        return voteSqlSession.update("updateMemberWeixinId", member);
    }

    public Integer updateUserQqId(Member member) {
        this.removeMemberCache(member);
        return voteSqlSession.update("updateMemberQqId", member);
    }



    //@Cacheable(value="userByIdCache" ,key="'userByIdCache:'+#userId")//
    public Member getMemberById(final Long userId){
        String key = Constant.CACHE_KEY_GET_MEMBET_BY_ID+userId;
        Member member =  appCache.find(key, new CacheProvider() {
            @Override
            public Object getData() {
                return voteSqlSession.selectOne("getMemberById", userId);
            }
        });
        if (null != member&& StringHelper.isEmpty(member.getAvatar())) {
            member.setAvatar(Constant.defaultAvatar);
        }
        return member;
        //return sqlSession.selectOne("getUserById", userId);
    }


    //@CacheEvict(value="userByIdCache",key="#user.getUserId()")// 清空accountCache 缓存
    public Integer updateMemberInfo(Member member){
        Member dbUser = this.getMemberById(member.getId());
        this.removeMemberCache(dbUser);
        Integer updateCount = voteSqlSession.update("updateMemberInfo",member);
        return updateCount;
    }



    public Boolean isNickExist(String nickName){
        Integer resultCount = voteSqlSession.selectOne("memberCountByNickName", nickName);
        if (resultCount>0) {
            return true;
        }
        return false;
    }

    public Integer updateMemberNick(Member member){
        return voteSqlSession.update("updateMemberNick",member);
    }

    public Integer initUserNick(User user){
        return voteSqlSession.update("initUserNick",user);
    }

    public Integer allUserCount(){
        Integer resultCount = voteSqlSession.selectOne("allUserCount");
        return resultCount;
    }




    public List<Member> memberCmsSearch(String sql){
        return this.voteSqlSession.selectList("memberCmsSearch", sql);
    }

    public Integer memberCmsSearchCount(String sql){
        return this.voteSqlSession.selectOne("memberCmsSearchCount",sql);
    }

    public List<User> getAllThirdPartUserList(){
        return this.voteSqlSession.selectList("getAllThirdPartUserList");
    }

    public List<User> getAllNeedBindPhoneUserList(){
        return this.voteSqlSession.selectList("getAllNeedBindPhoneUserList");
    }

    public List<User> getAllPhoneOnlyUserList(){
        return this.voteSqlSession.selectList("getAllPhoneOnlyUserList");
    }


    public Long getMemberIdByToken(String token){
        return (Long)redisTemplate.opsForValue().get(Constant.CACHE_KEY_PERSISTENCE_TOKEN_PRE+token);
        //return hfcSqlSession.selectOne("getMemberIdByToken",token);
    }

    public String newUserLoginToken(Long userId){
        //AccessToken accessToken = new AccessToken();
        String token = RandomStringUtils.randomAlphanumeric(20);
        //String code = RandomStringUtils.randomAlphanumeric(20);
        //accessToken.setToken(token);
        //accessToken.setUserId(userId);
        //accessToken.setCode(code);

        //this.hfcSqlSession.insert("insertUserLoginToken",accessToken);
        redisTemplate.opsForValue().set(Constant.CACHE_KEY_PERSISTENCE_TOKEN_PRE+token,userId);
        redisTemplate.expire(Constant.CACHE_KEY_PERSISTENCE_TOKEN_PRE+token, Constant.LOGIN_TIME_OUT, TimeUnit.SECONDS);
        return token;
    }

    public void removeToken(String token){
        redisTemplate.delete(Constant.CACHE_KEY_PERSISTENCE_TOKEN_PRE+token);
    }

    public AccessToken getAccessTokenByCode(String code){
        return this.voteSqlSession.selectOne("getAccessTokenByCode",code);
    }

    public void setCodeInvalid(String code){
        this.voteSqlSession.update("setCodeInvalid",code);
    }

    public AccessToken getAccessTokenByToken(String accessToken){
        return this.voteSqlSession.selectOne("getAccessTokenByToken",accessToken);
    }

    @SuppressWarnings({ "unchecked", "rawtypes" })
    public List<User> getUserInfoList(Map params){
        return voteSqlSession.selectList("getUserInfoList", params);
    }

    @SuppressWarnings("rawtypes")
    public Integer getUserInfoListCount(Map params){
        return (Integer)voteSqlSession.selectOne("getUserInfoListCount", params);
    }


    public void setUserBlock(User user){
        voteSqlSession.update("setUserBlock",user);
    }

    public void insertMember(Member member){
        voteSqlSession.insert("insertMember",member);
    }

    public Integer updateMemberAvatar(Member member) {
        return voteSqlSession.update("updateMemberAvatar",member);
    }
}
