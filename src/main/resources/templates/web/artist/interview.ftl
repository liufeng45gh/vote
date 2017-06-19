<!DOCTYPE html>
<html>
<head>
    <#include "../c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/artist.css' type='text/css' media='screen' />

</head>

<body>
<div class="web-main page-min-width">


    <#include "../c-top.ftl"/>



    <div class="third-block">
        <div class="info-fr wrapper-996">
            <div class="finance-block news-left">
                <#include "second_menu.ftl"/>



                <div class="artist-list news-list" id="entity-list">
                    <#list artistInterviewList as interview>
                    <div class="news-item">
                        <#if interview.isLogoHave()>
                        <div class="logo">
                            <a href="/artist/interview/${interview.id}/detail" target="_blank">
                                <img src="${interview.logo?default("")}">
                            </a>
                        </div>
                    </#if>
                        <div class="text <#if !interview.isLogoHave()>w800</#if>">
                            <a href="/artist/interview/${interview.id}/detail" target="_blank">
                                <div class="title">${interview.title?default("")}</div>
                            </a>
                            <a href="/artist/interview/${interview.id}/detail" target="_blank">
                                <div class="desc">
                                    ${interview.summaryText()}
                                </div>
                            </a>
                            <div class="date-info">[${(interview.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}]</div>
                        </div>

                    </div>
                 </#list>
                </div>
                <div style="clear:both;"></div>
                <div class="load-more" id="load-more">点击加载更多</div>
                <input type="hidden" id="load-more-url" value="/artist/interview-list"/>
                <input type="hidden" id="search-more-url" value="/artist/search-list"/>
                <div class="fill-bottom">&nbsp;</div>

            </div>

            <#include "right_part.ftl"/>


        </div>
    </div>




</div>

<script type="text/javascript">
$(function() {
	$('#menu-item-interview').addClass("active");
});
</script>

<script  src="/web/js/artist/interview.js"></script>
</body>
</html>