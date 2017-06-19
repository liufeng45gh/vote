<!DOCTYPE html>
<html>
<head>
    <#include "../common_header.ftl"/>
    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/appreciate.css' type='text/css' media='screen' />
</head>

<body>
<div class="web-main page-min-width">

    <div class="next-block">


        <div class="info-fr wrapper-996 " id="entity-list">
            <div class="news-info">
                <div class="span"><img src="/web/images/time_icon.png" class="a-icon"/></div>
                <div class="span"> ${(entity.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}</div>



            </div>

            <div class="news-title">${entity.title?default("")}</div>

            <div class="news-content">${entity.content?default("")}</div>
            <input type="hidden" id="appreciateId" value="${entity.id?default("")}"/>

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
    <input type="hidden" id="load-more-url" value="/cms/appreciate/${(entity.id)!}/comment-list"/>
    <input type="hidden" id="delete-url" value="/cms/appreciate/comment/{id}/delete"/>
</div>


<script  src="/web/js/appreciate/comment-list.js"></script>

</body>
</html>