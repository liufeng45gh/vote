package com.lucifer.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class RequestUtils {

    public static String getCookie(String name, HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(null ==cookies){
            return null;
        }
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(name)) {
                return cookie.getValue();
            }
        }
        return null;
    }
}
