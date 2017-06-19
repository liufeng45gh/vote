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
                    <div class="news-title">${entity.title?default("")}</div>
                    <div class="news-info">
                        <span>
                              ${entity.reporter?default("")}
                        </span>
                        <span>
                            ${(entity.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}
                        </span>
                    </div>
                    <div class="news-content">${entity.content?default("")}</div>
                </div>

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