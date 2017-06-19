package com.lucifer.service.vote;


import com.lucifer.dao.vote.MemberDao;
import com.lucifer.exception.Oauth2CodeInvalidException;
import com.lucifer.model.AccessToken;
import com.lucifer.model.vote.Member;
import com.lucifer.service.UserService;
import com.lucifer.utils.*;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

@Service
public class MemberLoginService {

	
	@Resource
	private UserService userService;
	
	@Resource
	private MemberDao memberDao;


	final Logger logger = LoggerFactory.getLogger(this.getClass());


	/**
	 * 总登陆接口
	 * @param member
	 * @return
	 * @throws Exception
	 */
	@Transactional(propagation= Propagation.REQUIRED)
	public Result login(Member member) throws Exception{
		if (!StringHelper.isEmpty(member.getPhone())) {//手机号登录
			return this.loginByPhone(member);
		}
//		if (!StringHelper.isEmpty(member.getWeiboId())) {//微博登录
//			return this.loginByWeiBo(member);
//		}
		if (!StringHelper.isEmpty(member.getWeixinId())) {//微信登陆
			return this.loginByWeiXin(member);
		}
		if (!StringHelper.isEmpty(member.getQqId())) {
			return this.loginByQQ(member);
		}
		return Result.fail();
	}
	
	/**
	 * 手机号登录
	 * @param member
	 * @return
	 * @throws Exception 
	 */
	public Result loginByPhone(Member member) throws Exception{

		Member dbUser = memberDao.getMemberByPhone(member.getPhone());
		if  (null == dbUser)  {
			return Result.fail("用户未找到");
		}
		String md5Password = Md5Utils.md5(Md5Utils.md5(member.getPassword())+dbUser.getSalt());
		if (!md5Password.equals(dbUser.getPassword())) {
			return Result.fail("密码错误");
		}

		String token = memberDao.newUserLoginToken(dbUser.getId());
		return this.loginSuccess(dbUser,token);

	}





	/**
	 * 返回token
	 * @param user
	 * @return
	 * @throws IOException 
	 */
	public Result loginSuccess(Member user, String token) throws IOException{
		//String token = RandomStringUtils.randomAlphanumeric(20);
		//stringRedisTemplate.opsForValue().set(RedisKeyPreConstant.USER_TOKEN_PRE+token, user.getUserId().toString());
		//stringRedisTemplate.expire(RedisKeyPreConstant.USER_TOKEN_PRE+token, 10, TimeUnit.DAYS);
		Map resultMap = new HashMap();
		resultMap.put("user", user);
		resultMap.put("token", token);
		user.setPassword(null);
		return Result.ok(resultMap);
	}
	
	public JSONObject  getWeiboUserInfo(String accessToken,String uid) throws IOException, KeyManagementException, NoSuchAlgorithmException, JSONException {
		String url = "https://api.weibo.com/2/users/show.json?access_token="+accessToken+"&uid="+uid;
		String result = HttpsUtil.getAsString(url, "utf-8");
		logger.info(result);
		return new JSONObject(result);
	}
	
	public String getWeiboUidByAccessToken(String accessToken) throws KeyManagementException, NoSuchAlgorithmException, IOException, JSONException {
		String url = "https://api.weibo.com/2/account/get_uid.json?access_token="+accessToken;
		String jsonString = HttpsUtil.getAsString(url, "utf-8");
		logger.info("getWeiboUidByAccessToken body is : "+jsonString);
		JSONObject jsonObject =  new JSONObject(jsonString);
		return jsonObject.getString("uid");
	}
	
	/**
	 * 微信登陆
	 * @param member
	 * @return
	 * @throws IOException 
	 * @throws HttpException 
	 */
	public Result loginByWeiXin(Member member) throws Exception{
		Boolean isAvailable = this.checkWeixinToken(member.getAccessToken(), member.getWeixinId());
		if (!isAvailable) {
			return Result.fail("auth  is fail");
		}
//		Result result =   userCenterService.thirdLogin(user);
//		if (!result._isOk()) {
//			return result;
//		}
		//String token = (String)result.getData();
		Member dbUser = memberDao.getMemberByWxId(member.getWeixinId());
		

		if (null==dbUser) {		
			String account = "wx_"+ RandomUtil.getNextAccount();

			member.setCreatedAt(DateUtils.now());
			member.setUpdatedAt(DateUtils.now());
			this.syncWeixinUserInfo(member);
			memberDao.insertMember(member);
			//user.setUserId(Long.valueOf(id));
			
			//user.setNickName("用户"+user.getUserId());
			//userDao.initUserNick(user);
			//userDao.updateUserInfo(user);
			//user.setUserId(userId);
			//初始化
			userService.userInit(member.getId());
			dbUser =  memberDao.getMemberByWxId(member.getWeixinId());
		}
		String token =  memberDao.newUserLoginToken(dbUser.getId());
		return this.loginSuccess(dbUser,token);
	}
	
	public Boolean checkWeixinToken(String accessToken,String openId) throws HttpException, IOException, JSONException {
		HttpClient httpClient = new HttpClient();
		GetMethod get = new GetMethod("https://api.weixin.qq.com/sns/auth?access_token="+accessToken+"&openid="+openId);
		httpClient.executeMethod(get);
		Header[] headers = get.getResponseHeaders();
		int statusCode = get.getStatusCode();
		logger.info("statusCode:"+statusCode);
		for(Header h : headers){
			//log.info(h);
		}
		String result = new String(get.getResponseBodyAsString().getBytes("utf8"));
		logger.info(result);
		JSONObject resultJ=  new JSONObject(result);
		if  (0 == resultJ.getInt("errcode"))  {
			return true;
		}
		return false;
	}
	
	private void syncWeixinUserInfo(Member member) throws  IOException, JSONException {
		JSONObject jsonObject = this.getWeixinUserInfo(member.getAccessToken(), member.getWeixinId());
		member.setAvatar(jsonObject.getString("headimgurl"));
		member.setNickName(jsonObject.getString("nickname"));
		//user.setCity(jsonObject.getString("city"));
		//user.setProvince(jsonObject.getString("province"));
	}
	
	private JSONObject getWeixinUserInfo(String accessToken,String openId) throws HttpException, IOException, JSONException {
		HttpClient httpClient = new HttpClient();
		GetMethod get = new GetMethod("https://api.weixin.qq.com/sns/userinfo?access_token="+accessToken+"&openid="+openId);
		httpClient.executeMethod(get);
		Header[] headers = get.getResponseHeaders();
		int statusCode = get.getStatusCode();
		logger.info("statusCode:"+statusCode);
		for(Header h : headers){
			//log.info(h);
		}
		String result = new String(get.getResponseBodyAsString().getBytes("utf8"));
		logger.info(result);
		JSONObject resultJ=  new JSONObject(result);
		return resultJ;
	}
	
	public Result loginByQQ(Member member) throws Exception{
		QQInfo qqInfo = QQInfo.getQQInfo(member.getAccessToken(),member.getQqId());
//		if (qqInfo == null) {
//			throw new NoAuthException("qq认证失败,openId 与 传入qqId 不一致");
//		}
		
		
		if (null == qqInfo) {
			return Result.fail("auth  is fail");
		}

		//String token = (String)result.getData();
		
		Member dbUser = memberDao.getMemberByQqId(member.getQqId());
		

		
		if (null==dbUser) {		
//			String account = "qq_"+RandomUtil.getNextAccount();
//			member.setAccount(account);
//			UUID uuid = UUID.randomUUID();
//			member.setUuid(uuid.toString());
			member.setCreatedAt(DateUtils.now());
			member.setUpdatedAt(DateUtils.now());
			//QQInfo qqInfo = new QQInfo(user.getAccessToken(),openIDObj.getUserOpenID());
			member.setAvatar(qqInfo.getAvatar());
			memberDao.insertMember(member);
			//user.setUserId(Long.valueOf(id));
			
			//user.setNickName("用户"+user.getUserId());
			//userDao.initUserNick(user);
			//userDao.updateUserInfo(user);
			//user.setUserId(userId);
			//初始化
			userService.userInit(member.getId());
			dbUser =  memberDao.getMemberByQqId(member.getQqId());
		}
		String token =   memberDao.newUserLoginToken(dbUser.getId());
		return this.loginSuccess(dbUser,token);
	}

	
	public void logout(String token){
//		stringRedisTemplate.delete(RedisKeyPreConstant.USER_TOKEN_PRE+token);
		memberDao.removeToken(token);
	}

	public AccessToken loginByCode(String code) throws Oauth2CodeInvalidException {
		AccessToken accessToken =  memberDao.getAccessTokenByCode(code);
		if (null == accessToken) {
			throw new Oauth2CodeInvalidException("code 无效");
		}
		logger.info("accessToken is : "+accessToken);
		logger.info("accessToken.getCodeLogin() is : "+accessToken.getCodeLogin());
		if (new Integer(1).equals(accessToken.getCodeLogin())) {
			throw new Oauth2CodeInvalidException("code 已登录");
		}
		memberDao.setCodeInvalid(code);
		return  accessToken;
	}

	public AccessToken getAccessTokenByToken(String accessToken){
		return memberDao.getAccessTokenByToken(accessToken);
	}



}
