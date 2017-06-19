package com.lucifer.model.vote;

import com.lucifer.utils.RelativeDateFormat;

import java.util.Date;

/**
 * Created by liufx on 17/1/16.
 */
public class AppreciateComment {

    private Long id;

    private Long appreciateId;

    private Long parentId;

    private Long userId;

    private String content;

    private Date createdAt;

    private Date updatedAt;

    private Long timestamp;

    private Integer isDeleted;

    private String deleteReason;

    private String userNick;

    private String answerUserNick;

    private Long answerUserId;

    private String answerContent;

    private Member user;

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

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getDeleteReason() {
        return deleteReason;
    }

    public void setDeleteReason(String deleteReason) {
        this.deleteReason = deleteReason;
    }

    public String getUserNick() {
        return userNick;
    }

    public void setUserNick(String userNick) {
        this.userNick = userNick;
    }

    public String getAnswerUserNick() {
        return answerUserNick;
    }

    public void setAnswerUserNick(String answerUserNick) {
        this.answerUserNick = answerUserNick;
    }

    public Long getAnswerUserId() {
        return answerUserId;
    }

    public void setAnswerUserId(Long answerUserId) {
        this.answerUserId = answerUserId;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public Member getUser() {
        return user;
    }

    public void setUser(Member user) {
        this.user = user;
    }

    public String showRelativeCreatedAt(){
        return RelativeDateFormat.format(this.createdAt);
    }
}
