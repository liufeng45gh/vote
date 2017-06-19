package com.lucifer.config;

import com.lucifer.interceptor.CmsCheckAuthInterceptor;
import com.lucifer.interceptor.UCenterCheckAuthInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/7/2.
 */
@Configuration
public class CmsWebAppConfigure  extends WebMvcConfigurerAdapter {

    @Resource
    private UCenterCheckAuthInterceptor uCenterCheckAuthInterceptor;

    @Resource
    private CmsCheckAuthInterceptor cmsCheckAuthInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(cmsCheckAuthInterceptor).addPathPatterns("/cms/**");
        //registry.addInterceptor(new MyInterceptor2()).addPathPatterns("/**");
        registry.addInterceptor(uCenterCheckAuthInterceptor).addPathPatterns("/u-center/**");
        //registry.addInterceptor(indexCacheInterceptor).addPathPatterns("/");
        super.addInterceptors(registry);
    }

}
