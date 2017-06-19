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
                    <#list artistList as artist>
                        <div class="artist-item" <#if artist_index%4==0>style="margin-left: 0px;"</#if>>
                            <div class="logo">
                                <a href="/artist/${artist.id}/detail" target="_blank">
                                    <img src="${(artist.avatar)!}" >
                                </a>
                            </div>
                            <div class="text">
                                <div class="name">${(artist.name)!}</div>
                                <div class="tag">${(artist.tag)!}</div>
                            </div>

                        </div>

                    </#list>
                </div>
                <div style="clear:both;"></div>
                <div class="load-more" id="load-more">点击加载更多</div>
                <input type="hidden" id="load-more-url" value="/artist/list"/>
                <input type="hidden" id="search-more-url" value="/artist/search-list"/>
                <div class="fill-bottom">&nbsp;</div>

            </div>

            <#include "right_part.ftl"/>


        </div>
    </div>




</div>

<script type="text/javascript">
var name = "${name!}";
$(function() {
	$('#menu-item-yhj').addClass("active");
});
</script>

<script  src="/web/js/artist/search.js"></script>
</body>
</html>