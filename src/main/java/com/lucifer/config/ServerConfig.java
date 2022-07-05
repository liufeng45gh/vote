package com.lucifer.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by liufx on 17/3/16.
 */
@Component
public class ServerConfig {

    @Value("${server.resetCache}")
    public Boolean resetCache;

    @Value("${server.port}")
    public String port;

    @Value("${vote.deadline}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deadline;

    @Value("${vote.start}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date start;

    public boolean inVoteTime(){
        if (new Date().before(start)) {
            return false;
        }
        if (new Date().after(deadline)) {
            return false;
        }
        return true ;
    }
}
