<!DOCTYPE html>
<html>
<head>
    <#include "../c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/company.css' type='text/css' media='screen' />

</head>

<body>
<div class="web-main page-min-width">


    <#include "../c-top.ftl"/>



    <div class="third-block">
        <div class="info-fr wrapper-996">
            <div class="finance-block news-left">
              


                <div class="artist-list" id="artist-list">
                    <div class="recommend-item">
                        <a href="${(entity.link)!}" target="_blank">
                        <div class="logo">
                                <img src="${(entity.logo)!}" >
                        </div>
                        </a>
                        <a href="${(entity.link)!}" target="_blank">
                        <div class="text" style="width: 644px;">
                            <div class="line1">
                                <div class="name">${(entity.name)!}</div>
                            </div>
                        </div>
                        </a>


                    </div>
                    <div class="news-content">${entity.detail?default("")}</div>
                </div>
                <div style="clear:both;"></div>

                <div class="fill-bottom">&nbsp;</div>

            </div>

            <#include "../news/right_part.ftl"/>


        </div>
    </div>




</div>

<script type="text/javascript">
$(function() {
	$('#menu-item-yhj').addClass("active");
});
$("#head-href-company").addClass("active");
</script>


</body>
</html>