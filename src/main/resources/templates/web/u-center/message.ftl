<!DOCTYPE html>
<html>
<head>
    <#include "../c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/u-center.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />

</head>

<body>
<div class="web-main page-min-width">

    <#include "../c-top.ftl"/>



    <div class="next-block">
        <div class="info-fr wrapper-996 b-line" style="height: 80px;">
            <div class="finance-block news-left">
                <div class="news-nav">

                    <a href="/"><div class="nav-item" >首页</div></a>   <div class="nav-item" >&gt;</div>
                    <a href="/u-center/index"><div class="nav-item" >个人中心</div></a>
                    <div class="nav-item" >&gt;</div>
                    <a href="/u-center/message"><div class="nav-item" >我的消息</div></a>


                </div>

            </div>
        </div>
        <div class="info-fr wrapper-996" style="height: 80px;">
            <#include "menu.ftl"/>

        </div>


    </div>

    <div class="next-block bgf7" style="padding-top: 22px;height: 600px;">
        <div class="info-fr wrapper-996 box" style="min-height: 555px;">
            <div class="info-title "><span class="t-cn">我的消息</span> <span class="t-en">My message</span></div>
            <div class="info-fr wrapper-996 b-line" style="height: 1px;">&nbsp;</div>
            <div style="clear:both;"></div>
            <div>

                <#list messageList as message>
                    <div class="msg-item">
                        <div class="a-img">
                            <img src="${(message.from.avatar)!}">
                        </div>
                        <div class="c-right">
                            <div class="c-top"><div class="nick-red">${(message.from.nickName)}</div><div class="t-text">在<em>鉴赏</em>板块回复了您</div></div>
                            <div class="c-date">${(message.createdAt?string("yyyy-MM-dd HH:mm:ss"))!}</div>
                            <div class="c-text">${(message.text)!}</div>

                            <div class="c-parent">
                                <b class="bot">◆</b>
                                <div class="patent-text">${(message.parentText)!}</div>
                                <div style="clear: both;"></div>
                            </div>
                            <div style="clear: both;"></div>


                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </#list>
                <!--
                <div class="msg-item">
                    <div class="a-img">
                        <img src="http://ojvbqldpg.bkt.clouddn.com/a33c02d6-612e-4642-8dc1-0c693db6052f.jpg">
                    </div>
                    <div class="c-right">
                        <div class="c-top"><div class="nick-red">mp_006omkAgvD6</div><div class="t-text">在<em>鉴赏</em>板块回复了您</div></div>
                        <div class="c-date">2017-12-32 34:32:12</div>
                        <div class="c-text">你好我也好</div>

                        <div class="c-parent">
                            <b class="bot">◆</b>
                            <div class="patent-text">好</div>
                            <div style="clear: both;"></div>
                        </div>
                        <div style="clear: both;"></div>


                    </div>
                    <div style="clear: both;"></div>
                </div>

                <div class="msg-item">
                    <div class="a-img">
                        <img src="http://ojvbqldpg.bkt.clouddn.com/a33c02d6-612e-4642-8dc1-0c693db6052f.jpg">
                    </div>
                    <div class="c-right">
                        <div class="c-top"><div class="nick-red">mp_006omkAgvD6</div><div class="t-text">在<em>鉴赏</em>板块回复了您</div></div>
                        <div class="c-date">2017-12-32 34:32:12</div>
                        <div class="c-text">你好我也好</div>

                        <div class="c-parent">
                            <b class="bot">◆</b>
                            <div class="patent-text">好</div>
                            <div style="clear: both;"></div>
                        </div>
                        <div style="clear: both;"></div>


                    </div>
                    <div style="clear: both;"></div>
                </div>
                -->
            </div>
        </div>



    </div>




</div>


<script>
    $("#message").addClass("active");
</script>
<script type="text/javascript" charset="UTF-8" src="/web/js/u-center/message.js"></script>
</body>
</html>