package com.lucifer.model.vote;

import java.util.Date;

/**
 * Created by liufx on 17/3/15.
 */
public class AppreciateLike {

    private Long id;

    private Long appreciateId;

    private String userId;

    private Date createdAt;

    private Integer isDeleted;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAppreciateId() {
        return appreciateId;
    }

    public void setAppreciateId(Long appreciateId) {
        this.appreciateId = appreciateId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
}
