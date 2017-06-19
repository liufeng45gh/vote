<div class="head-box">

    <div class="banner-background" style="background-image: url(/web/images/banner.jpg); opacity: 1; ">
        <div class="new-banner" id="wave-effect">

        </div>
    </div>




    <!--
    <div class="slides-container banner-background">
        <div id="slides">
            <img src="/web/images/platform-1.jpg"/>
            <img src="/web/images/platform-2.jpg" />
            <img src="/web/images/platform-3.jpg" />
            <img src="/web/images/platform-4.jpg" />
            <img src="/web/images/platform-5.jpg" />
            <img src="/web/images/platform-6.jpg" />
            <img src="/web/images/platform-7.jpg" />
            <img src="/web/images/platform-8.jpg" />
        </div>
    </div>

    -->



    <div class="slogan" style="z-index: 100;" id="slogan">以艺术品流通为使命</div>
    <!--
    <div class="hfc-address" style="z-index: 100;">北京市东城区史家胡同68号[海富文化艺术金融中心大厦]</div>
    <div class="mask" style="z-index: 100;"></div>
    -->

    <#include "menu-bar.ftl"/>





</div>
<!--
<div class="w1200">
    <div class="search-box">
        <form method="get" action="/search" class="new-searching-unit" id="search-form">
            <input id="query" type="text" size="27" name="title" autocomplete="off" placeholder="搜索你喜欢的" value="${(RequestParameters["title"])!}"/>
            <a href="#" onclick="return false;" class="go"  id="search-btn"></a>
        </form>
        <div class="search-hint">

        </div>

    </div>
</div>
-->

<script>

$(function() {
	$("#search-btn").click(function (){
        $("#search-form").submit();
	});
	$("#head-href-index").addClass("active");
});
</script>

<script  src="/web/js/slogan.js"></script>


