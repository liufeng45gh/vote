package com.lucifer.interceptor;

import com.lucifer.model.user.User;
import com.lucifer.model.vote.Member;
import com.lucifer.service.vote.MemberService;
import com.lucifer.utils.Constant;
import com.lucifer.utils.StringHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2017/3/10.
 */
@Component
public class UCenterCheckAuthInterceptor extends HandlerInterceptorAdapter {

    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private MemberService memberService;

    @Override
    /**
     * 在请求处理之前进行调用（Controller方法调用之前）
     */
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception{

        logger.info("UCenterCheckAuthInterceptor preHandle method has been called");
        //log.info(request.getPathInfo());
        //log.info(request.getPathTranslated());
        //log.info(request.getContextPath());
        //log.info(request.getRequestURI());
//		if(true) {
//			return true;
//		}
        Cookie[] cookies = request.getCookies();
        String token = null;
        if (null == cookies) {
            response.sendRedirect("/login");
            return false;
        }
        for (Cookie c : cookies) {
            if (c.getName().equals("token")) {
                token = c.getValue();
                break;
            }
        }
        if (StringHelper.isEmpty(token)){
            response.sendRedirect("/login");
            return false;
        }

        Member member = memberService.getMemberByToken(token);
        if (null == member) {
            response.sendRedirect("/login");
            return false;
        }

        return true;

    }

    public static User getSessionUser(HttpServletRequest request){
        return (User)request.getSession().getAttribute(Constant.KEY_CMS_USER);
    }

    public static void saveSessionUser(User user, HttpServletRequest request){
        request.getSession().setAttribute(Constant.KEY_CMS_USER, user);
    }
}
