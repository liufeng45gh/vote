<!DOCTYPE html>
<html>
<head>
    <#include "../c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/appreciate.css' type='text/css' media='screen' />
    <link rel="stylesheet" href="/artDialog/css/ui-dialog.css">
    <script src="/artDialog/dist/dialog-min.js"></script>
</head>

<body>
<div class="web-main page-min-width">
    <#include "../c-top.ftl"/>
    <div class="next-block">
        <div class="info-fr wrapper-996 b-line" style="height: 80px;">
            <div class="finance-block news-left">
                <div class="news-nav">
                    <a href="/"><div class="nav-item" >首页</div></a>   <div class="nav-item" >&gt;</div>
                    <a href="/appreciate/index"><div class="nav-item" >鉴赏</div></a>   <div class="nav-item" >&gt;</div>
                    <a href="/appreciate/index?categoryId=${(entity.categoryId)!}"><div class="nav-item" >${(entity.categoryName)?default("全部")}</div></a>
                </div>
            </div>
            <div class="separate-block">
                &nbsp;
            </div>
            <#include "search_box.ftl"/>
        </div>

        <div class="info-fr wrapper-996 " id="entity-list">
            <div class="news-info">
                <div class="span"><img src="/web/images/time_icon.png" class="a-icon"/></div>
                <div class="span"> ${(entity.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}</div>

                <div class="span" style="margin-left:20px;"><img src="/web/images/ll_icon.png" class="a-icon"/></div>
                <div class="span" id="click-count"> ${(entity.clickCount)!}</div>

                <div class="span" style="margin-left:20px;"><img id="like-img-btn" src="/web/images/zan_icon2.png" class="a-icon pointer"/></div>
                <div class="span" id="like-count"> ${(entity.likeCount)!}</div>

                <div class="span" style="margin-left:20px;"><img src="/web/images/pl_icon.png" class="a-icon"/></div>
                <div class="span" id="comment-count"> ${(entity.commentCount)!}</div>

            </div>

            <div class="news-title">${entity.title?default("")}</div>

            <div class="news-content">${entity.content?default("")}</div>
            <div class="comment-box">
                <input type="hidden" id="appreciateId" value="${entity.id?default("")}"/>
                <div class="nick-box" id="c-nick-div">&nbsp;</div>
                <div>
                    <div class="c-h-box"><img id="c-avatar" src="/web/images/default-avatar.jpg"/></div>
                    <div class="comment-area" id="comment-area" contenteditable="true">写下您的评论</div>
                    <div class="comment-btn" id="c-submit">
                        <img src="/web/images/tjpl_icon.png"/>
                        <div class="btn-text">提交评论</div>
                    </div>
                </div>
            </div>
            <div class="new-comment">
                <div class="c-title">
                    最新评论
                </div>
                <div class="comment-list" id="comment-list">
                    <!--
                    <div class="comment-item">
                        <div class="a-img">
                            <img src="/web/images/default-avatar.jpg"></img>
                        </div>
                        <div class="c-right">
                            <div class="c-top"><div class="nick-red">张浩然</div><div class="c-date">21小时前</div></div>
                            <div class="c-text">的方式来打开房间都是拉飞机 发送到路口附近的考虑是否绝对是附加费娄底市解放路独守空房附近的书房里</div>
                            <div class="c-parent">
                                <div class="nick-red" style="padding-left: 20px;">张浩然</div>
                                <div class="colon">:</div>
                                <div class="patent-text">路口附近的考虑是否绝对是路口附近的考虑是否绝对是</div>
                                <div style="clear: both;"></div>
                            </div>
                            <div style="clear: both;"></div>
                            <div class="reply-btn">回复</div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    -->
                </div>

            </div>
        </div>
        <div style="clear: both"></div>

    <div class="load-more" id="load-more">点击加载更多</div>
    <input type="hidden" id="load-more-url" value="/appreciate/${(entity.id)!}/comment-list"/>
    <input type="hidden" id="reply-url" value="/appreciate/reply"/>
    <input type="hidden" id="post-comment-url" value="/appreciate/post-comment"/>
    <input type="hidden" id="counts-url" value="/appreciate/${(entity.id)!}/counts"/>
    <input type="hidden" id="like-url" value="/appreciate/${(entity.id)!}/like"/>
    <input type="hidden" id="read-url" value="/appreciate/${(entity.id)!}/read"/>
</div>

<script  src="/web/js/appreciate/detail.js"></script>
<script  src="/web/js/appreciate/comment-list.js"></script>
<script  src="/web/js/appreciate/like.js"></script>
</body>
</html>