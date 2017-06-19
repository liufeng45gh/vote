<!DOCTYPE html>
<html>
<head>
    <#include "../c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/artist.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/page-bar.css' type='text/css' media='screen' />
    <title>海富映像</title>
</head>

<body>
<div class="web-main page-min-width">


    <#include "../c-top.ftl"/>



    <div class="third-block">
            <div class="w1200">
                <div class="news-menu">
                    <a href="/atlas/index"><div class="menu-item" id="menu-item-yhj">${(atlas.title)!}</div></a>
                </div>



            </div>
        <#include "picture-wrap.ftl"/>




    </div>




</div>

<script type="text/javascript">
$(function() {
	$('#menu-item-yhj').addClass("active");
});

$(function() {
	$('#head-href-atlas').addClass("active");
});
</script>

<script  src="/web/js/atlas/detail.js"></script>
</body>
</html>