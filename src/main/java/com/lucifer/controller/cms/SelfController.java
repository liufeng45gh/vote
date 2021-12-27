package com.lucifer.controller.cms;

import com.lucifer.dao.UserDao;
import com.lucifer.interceptor.CmsCheckAuthInterceptor;
import com.lucifer.mapper.oauth2.UserMapper;
import com.lucifer.model.user.AccessToken;
import com.lucifer.model.user.User;
import com.lucifer.service.AccountService;
import com.lucifer.service.UserService;
import com.lucifer.utils.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Properties;

@Controller
public class SelfController {

	final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private UserService userService;

	@Resource
	private AccountService accountService;

	@Resource
	private UserMapper userMapper;



	@RequestMapping(value="/cms/self/welcome",method = RequestMethod.GET)
	public String welcome(HttpServletRequest request){
		Properties props=System.getProperties(); //获得系统属性集
		String osName = props.getProperty("os.name"); //操作系统名称
		String osArch = props.getProperty("os.arch"); //操作系统构架
		String osVersion = props.getProperty("os.version"); //操作系统版本
		request.setAttribute("osName",osName);
		request.setAttribute("osArch",osArch);
		request.setAttribute("osVersion",osVersion);
		String localAddr = request.getLocalAddr();
		request.setAttribute("localAddr",localAddr);
		return "/cms/self/index";
	}
	
	
	@RequestMapping(value="/cms/self/upnick",method = RequestMethod.GET)
	public String updateNickInput(HttpServletRequest request,  @CookieValue(value = Constant.ADMIN_ACCESS_TOKEN) String token){
		AccessToken accessToken = userMapper.getAccessTokenByToken(token);
		User user = userMapper.getUserById(accessToken.getUserId());
		//User currentUser= CmsCheckAuthInterceptor.getSessionUser(request);
		request.setAttribute("nick", user.getNickName());
		return "/cms/self/upnick";
	}
	
	
	@RequestMapping(value="/cms/self/upnick",method = RequestMethod.POST)
	public String updateNickSubmit(String nick,HttpServletRequest request, @CookieValue(value = Constant.ADMIN_ACCESS_TOKEN) String token){
		logger.info("nick is:  "+nick );
		logger.info("request nick is:  "+request.getParameter("nick") );
		AccessToken accessToken = userMapper.getAccessTokenByToken(token);
		User user = userMapper.getUserById(accessToken.getUserId());
		//User currentUser= CmsCheckAuthInterceptor.getSessionUser(request);
		user.setNickName(nick);
		userMapper.updateUserNick(user);

		request.setAttribute(Constant.KEY_RESULT_MESSAGE, "修改成功");
		request.setAttribute("nick", user.getNickName());
		return "/cms/self/upnick";
	}
	
	
	@RequestMapping(value="/cms/self/uppassword",method = RequestMethod.GET)
	public String updatePasswordInput(){
		return "/cms/self/update_password";
	}
	
	
	@RequestMapping(value="/cms/self/uppassword",method = RequestMethod.POST)
	public String updatePasswordSubmit(String oldpass,String newpass,HttpServletRequest request, @CookieValue(value = Constant.ADMIN_ACCESS_TOKEN) String token){
		AccessToken accessToken = userMapper.getAccessTokenByToken(token);
		User currentUser = userMapper.getUserById(accessToken.getUserId());
		boolean result = accountService.resetPassword(currentUser.getAccount(), oldpass, newpass);
		if(result){
			request.setAttribute(Constant.KEY_RESULT_MESSAGE, "修改成功");
			request.setAttribute(Constant.KEY_RESULT_MESSAGE_COLOR, "green");
		}else{
			request.setAttribute(Constant.KEY_RESULT_MESSAGE, "修改失败:原密码输入错误");
			request.setAttribute(Constant.KEY_RESULT_MESSAGE_COLOR, "red");
		}
		return "/cms/self/update_password";
	}
	
	
}
