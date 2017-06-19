<!DOCTYPE html>
<html>
<head>
    <#include "../c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/research-report.css' type='text/css' media='screen' />


</head>

<body>
<div class="web-main page-min-width">


    <#include "../c-top.ftl"/>



    <div class="third-block">
        <div class="info-fr wrapper-996">
            <div class="finance-block news-left">

                <div class="news-nav b-line">
                    <a href="/"><div class="nav-item" >首页</div></a>   <div class="nav-item" >&gt;</div>
                    <a href="/research-report/index"><div class="nav-item" >研究报告</div></a>
                </div>


                <div class="finance-list news-list" id="news-list">
                    <#list entityList as news>
                    <div class="news-item">
                        <#if news.isLogoHave()>
                        <div class="logo">
                            <a href="/research-report/${news.id}/detail" target="_blank">
                                <img src="${news.logo?default("")}">
                            </a>
                        </div>
                        </#if>
                        <div class="text <#if !news.isLogoHave()>w800</#if>">
                            <a href="/research-report/${news.id}/detail" target="_blank">
                                <div class="title">${news.title?default("")}</div>
                            </a>
                            <a href="/research-report/${news.id}/detail" target="_blank">
                                <div class="desc">
                                    ${news.summaryText()}
                                </div>
                            </a>
                            <div>
                                ${news.downloadHtml()}
                                <div class="date-info">[${(news.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}]</div>
                            </div>

                        </div>

                    </div>
                    </#list>


                </div>
                <div class="load-more" id="load-more">点击加载更多</div>
                <input type="hidden" id="load-more-url" value="/research-report/list">
                <input type="hidden" id="search-more-url" value="/news/search-list">
                <div class="fill-bottom">&nbsp;</div>

            </div>

            <#include "right_part.ftl"/>


        </div>
    </div>




</div>

<script type="text/javascript">
$(function() {
	$('#menu-item-${RequestParameters["categoryId"]?default("")}').addClass("active");
});
var categoryId = "${RequestParameters["categoryId"]?default("")}";
</script>

<script  src="/web/js/news/index.js"></script>
</body>
</html>