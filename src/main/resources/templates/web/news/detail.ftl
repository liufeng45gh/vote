<!DOCTYPE html>
<html>
<head>
    <#include "../c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />

</head>

<body>
<div class="web-main page-min-width">
    <#include "../c-top.ftl"/>



    <div class="third-block">
        <div class="info-fr wrapper-996">
            <div class="finance-block news-left">
                <div class="news-menu">
                    <#include "menu.ftl"/>

                </div>



                <div class="finance-list news-list" id="news-list">
                    <div class="news-title">${entity.title?default("")}</div>
                    <div class="news-info">
                        <span>
                              ${entity.source?default("")}
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
	$('#menu-item-important-news').addClass("active");
});
$("#head-href-about").addClass("active");
</script>

<script  src="/web/js/news/index.js"></script>
</body>
</html>