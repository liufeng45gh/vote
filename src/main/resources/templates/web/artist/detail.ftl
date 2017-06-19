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



                <div class="artist-list" id="artist-list">
                    <div class="recommend-item">
                        <div class="logo">
                                <img src="${(entity.avatar)!}" >
                        </div>
                        <div class="text" style="width: 644px;">
                            <div class="line1">
                                <div class="name">${(entity.name)!}</div>
                                <div class="tag">${(entity.tag)!}</div>
                            </div>
                            <div class="intro">
                                ${(entity.longIntro())!}
                            </div>
                        </div>


                    </div>
                    <div class="news-content">${entity.detail?default("")}</div>
                </div>
                <div style="clear:both;"></div>

                <div class="fill-bottom">&nbsp;</div>

            </div>

            <#include "right_part.ftl"/>


        </div>
    </div>




</div>

<script type="text/javascript">
$(function() {
	$('#menu-item-yhj').addClass("active");
});
</script>


</body>
</html>