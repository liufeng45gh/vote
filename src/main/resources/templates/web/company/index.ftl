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

                <div class="news-menu">
                    <a href="/company/index"><div class="menu-item" id="menu-item-hfhz">海富合作</div></a>
                </div>

                <div class="artist-list" id="artist-list">
                    <#list companyList as company>
                        <div class="artist-item" <#if company_index%4==0>style="margin-left: 0px;"</#if>>
                            <div class="logo">
                                <a href="/company/${company.id}/detail" target="_blank">
                                    <img src="${(company.logo)!}" >
                                </a>
                            </div>
                            <div class="text">
                                <div class="name">${(company.name)!}</div>
                            </div>

                        </div>

                    </#list>
                </div>
                <div style="clear:both;"></div>
                <div class="load-more" id="load-more">点击加载更多</div>
                <input type="hidden" id="load-more-url" value="/company/list"/>
                <input type="hidden" id="search-more-url" value="/company/search-list"/>
                <div class="fill-bottom">&nbsp;</div>

            </div>

            <#include "../news/right_part.ftl"/>


        </div>
    </div>




</div>

<script type="text/javascript">
$(function() {
	$('#menu-item-hfhz').addClass("active");
});
$("#head-href-company").addClass("active");
</script>

<script  src="/web/js/artist/index.js"></script>
</body>
</html>