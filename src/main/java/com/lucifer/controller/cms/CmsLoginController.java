package com.lucifer.controller.cms;

import com.lucifer.model.user.AccessToken;
import com.lucifer.model.user.User;
import com.lucifer.service.UserLoginService;
import com.lucifer.utils.Constant;
import com.lucifer.utils.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class CmsLoginController {
	
	@Resource
	private UserLoginService userLoginService;

	@RequestMapping(value="/cms/login",method = RequestMethod.GET)
	public String logInput(){
		return "/cms/login";
	}
	
	@RequestMapping(value="/cms/login",method = RequestMethod.POST)
	public String loginSubmit(String account,String password,String captcha,HttpServletRequest request, HttpServletResponse response) throws Exception{
		String captchaCode = (String)request.getSession().getAttribute(Constant.KAPTCHA_SESSION_KEY);
		if (captchaCode == null || !captchaCode.equals(captcha)) {
			request.setAttribute(Constant.KEY_RESULT_MESSAGE, "验证码错误");
			return "/cms/login";
		}
		Result result = userLoginService.cmsLoginByAccount(account, password);
		if(result.isOk()){
			//request.getSession().setAttribute(CommonConstant.KEY_CMS_USER, adminUser);
			//CmsCheckAuthInterceptor.saveSessionUser(result.getData(), request);
			User user = result.getData();
			AccessToken accessToken = userLoginService.newUserLoginToken(user.getId());
			Cookie cookie = new Cookie(Constant.ADMIN_ACCESS_TOKEN,accessToken.getToken());
			cookie.setPath("/");
			cookie.setMaxAge(365 * 24*60*60);
			response.addCookie(cookie);
			return "redirect:/cms/self/welcome";
		}
		request.setAttribute(Constant.KEY_RESULT_MESSAGE, "用户名或密码错误");
		return "/cms/login";
	}
	
	@RequestMapping(value="/cms/logout")	
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "/WEB-INF/cms/login.jsp";
	}
}
