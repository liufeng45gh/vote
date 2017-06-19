<!DOCTYPE html>
<html>
<head>
    <title>海富文化艺术网-海富艺术品</title>
    <meta name="keywords" content="艺术品，书画，红木，陶瓷，紫砂，玉器，家具艺术"/>
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
                    <a href="/appreciate/index?categoryId=${(appreciateCategory.id)!}"><div class="nav-item" >${(appreciateCategory.name)?default("全部")}</div></a>
                </div>
            </div>
            <div class="separate-block">
                &nbsp;
            </div>
            <#include "search_box.ftl"/>
        </div>
        <div class="info-fr wrapper-996 b-line news-menu" style="height: 80px;">
            <#list appreciateCategoryList as category>
            <a href="/appreciate/index?categoryId=${(category.id)!}">
                <div class="a-category"  id="menu-item-${category.id?default("")}">${category.name}</div>
            </a>
            </#list>
            <!--
            <a href="#">
                <div class="a-category">书画</div>
            </a>
            <div class="a-category">红木</div>
            <div class="a-category">陶瓷</div>
            <div class="a-category">紫砂</div>
            <div class="a-category">玉器</div>
            <div class="a-category">家具艺术</div>
            <div class="a-category">其他</div>
            -->
        </div>
        <div class="info-fr wrapper-996 appreciate-list" id="entity-list">


        </div>
        <div style="clear: both"></div>
    <div class="load-more" id="load-more">点击加载更多</div>
    <input type="hidden" id="load-more-url" value="/appreciate/list.json"/>

    </div>




</div>

<script type="text/javascript">
$(function() {
	$('#menu-item-${RequestParameters["categoryId"]?default("")}').addClass("active");
});
var categoryId = "${RequestParameters["categoryId"]?default("")}";
</script>

<script  src="/web/js/appreciate/index.js"></script>
</body>
</html>