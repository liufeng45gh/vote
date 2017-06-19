<!DOCTYPE html>
<html>
<head>
    <#include "../c-head.ftl"/>

    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/appreciate.css' type='text/css' media='screen' />

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
                    <a href="#"><div class="nav-item" >搜索</div></a>
                </div>
            </div>
            <div class="separate-block">
                &nbsp;
            </div>
            <#include "search_box.ftl"/>
        </div>

        <div class="info-fr wrapper-996 appreciate-list" id="entity-list">


        </div>
        <div style="clear: both"></div>
    <div class="load-more" id="load-more">点击加载更多</div>
    <input type="hidden" id="load-more-url" value="/appreciate/search-list.json"/>

    </div>




</div>

<script type="text/javascript">

var title = "${RequestParameters["title"]?default("")}";
</script>

<script  src="/web/js/appreciate/search.js"></script>
</body>
</html>