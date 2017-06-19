package com.lucifer.model.vote;

import com.lucifer.utils.Constant;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by liufx on 17/1/16.
 */
public class Appreciate implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private Long categoryId;

    private String title;

    private String summary;

    private String logo;

    private String author;

    private String content;

    private Integer clickCount;

    private Integer lWidth;

    private Integer lHeight;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date publishAt;

    private Date createdAt;

    private Date updatedAt;

    private Float top;

    private Integer isDeleted;

    private String categoryName;

    private Integer likeCount;

    private Integer commentCount;

    private Integer voteCount;

    private List<AppreciateComment> commentList = new ArrayList<AppreciateComment>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPublishAt() {
        return publishAt;
    }

    public void setPublishAt(Date publishAt) {
        this.publishAt = publishAt;
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

    public Float getTop() {
        return top;
    }

    public void setTop(Float top) {
        this.top = top;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getClickCount() {
        return clickCount;
    }

    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getlWidth() {
        return lWidth;
    }

    public void setlWidth(Integer lWidth) {
        this.lWidth = lWidth;
    }

    public Integer getlHeight() {
        return lHeight;
    }

    public void setlHeight(Integer lHeight) {
        this.lHeight = lHeight;
    }

    public String pinHtml(){
        String html =
        "<div id=\"pin_" + this.id +"\"  class=\"pin wfc wft\" style=\"position: absolute; left: 0px; top: 0px; opacity: 1;\">"+

            "<a href=\"/appreciate/" +this.id + "/detail\"target=\"_blank\"  class=\"img x layer-view loaded\">"+
                "<img src=\""+this.logo +"\" width=\"220\" height=\""+this.pinHeight() +"\"  />"+
            "</a>"+

            "<div  class=\"name\">"+this.title+"</div>"+

                "<p class=\"stats less\">"+
                    "<span title=\"喜欢\" class=\"like\"><i></i>"+this.likeCount+"</span>"+
                    "<span title=\"评论\" class=\"comment\"><i></i>"+this.commentCount+"</span>"+
                "</p>"+

                "<div  class=\"comments muted\">"+
                    "<div class=\"comment convo clearfix\">"+
                        this.commentHtml()+
                    "</div>"+
            "</div>"+

        "</div>";
        return html;
    }

    private String commentHtml(){
        String html = "";
        if (null == this.commentList || this.commentList.size()==0) {
            return html;
        }
        for (AppreciateComment appreciateComment: this.commentList) {
            String avatar = Constant.defaultAvatar;
            String nick = "**";
            if (null != appreciateComment.getUser() ) {
                avatar = appreciateComment.getUser().getAvatar();
                nick = appreciateComment.getUser().getNickName();
            }

            html = html +
                    "<div class=\"comment convo clearfix\">"+
                        "<a href=\"#\"  class=\"img x\">"+
                        "<img src=\""+avatar+"\" class=\"avt\">"+
                        "</a>"+
                        "<div class=\"content\">"+
                            "<a href=\"#\" class=\"author\">"+nick+"</a>:&nbsp;"+appreciateComment.getContent()+
                        "</div>"+
                    "</div>";
        }
        return html;
    }

    private Integer defaultPinHeight = 131;

    private Integer defaultPinWidth = 220;

    public Integer pinHeight(){
        if (null == this.lWidth||this.lWidth==0) {
            return defaultPinHeight;
        }
        if (null == this.lHeight||this.lHeight==0) {
            return defaultPinHeight;
        }
        return this.lHeight * this.defaultPinWidth/this.lWidth;

    }

    public List<AppreciateComment> _getCommentList() {
        return commentList;
    }

    public void setCommentList(List<AppreciateComment> commentList) {
        this.commentList = commentList;
    }

    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    public Integer getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    public Integer getVoteCount() {
        return voteCount;
    }

    public void setVoteCount(Integer voteCount) {
        this.voteCount = voteCount;
    }
}
