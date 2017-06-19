package com.lucifer.model.vote;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.lucifer.utils.Constant;
import com.lucifer.utils.DateTimeSerializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Member implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1183367815938163456L;
	
	static final Logger logger = LoggerFactory.getLogger(Member.class);

	// id        自增长(长整,以下所有id字段皆为该规则)
	private Long id;

	// weixin_id 微信绑定ID,允许为空
	private String weixinId;

	// weibo_id  微博绑定ID,允许为空
	private String weiboId;

	// qq_id     QQ绑定ID,允许为空
	private String qqId;

	// phone     绑定手机,允许为空
	private String phone;
	
	// mail      绑定邮箱,允许为空
	private String mail;
	
	// password  密码,(加密后的密码,非明文),允许为空
	private String password;
	
	//重复密码
	private String rePassword;
	
	// salt      加密盐,6位随机数字字母组合,允许为空
	private String salt;
	

	//验证码
	private String code;

	private String status;
	
	//第三方token
	private String accessToken;
	
	// nick_name 昵称
	private String nickName;
	
	// avatar    头像图片路径
	private String avatar;

	// gender       性别 male:男 female:女  secrecy:保密
	private String gender;
	

	// birth     出生年月日

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;

	private String receiptAddress;

	private String signature;


	


	// 创建时间（记录）
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	protected  Date createdAt;
	
	// 更新时间（记录）
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	
	protected Date updatedAt;
	

	
//	// level     用户等级
//	private String level;
//	
//	// points    用户积分
//	private Integer points;
	
	public Member() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}



	public String getWeixinId() {
		return weixinId;
	}

	public void setWeixinId(String weixinId) {
		this.weixinId = weixinId;
	}

	public String getWeiboId() {
		return weiboId;
	}

	public void setWeiboId(String weiboId) {
		this.weiboId = weiboId;
	}

	public String getQqId() {
		return qqId;
	}

	public void setQqId(String qqId) {
		this.qqId = qqId;
	}



	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}



	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	@JsonSerialize(using=DateSerializer.class)
//	public Date getBirth() {
//		return birth;
//	}
//
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	public void setBirth(Date birth) {
//		this.birth = birth;
//	}


	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getCreatedAt() {
		if (null == createdAt) {
			createdAt = Constant.firstOnlineDate;
		}
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReceiptAddress() {
		return receiptAddress;
	}

	public void setReceiptAddress(String receiptAddress) {
		this.receiptAddress = receiptAddress;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}
}
