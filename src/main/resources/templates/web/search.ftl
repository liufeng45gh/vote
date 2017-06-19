<!DOCTYPE html>
<html>
<head>
    <#include "c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/search-index.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/appreciate.css' type='text/css' media='screen' />

</head>

<body>
<div class="web-main page-min-width">
    <#include "index-top.ftl"/>
    <div class="title-line-block">
        <div style="width:100%;height:1px;"></div>
        <div class="title-line wrapper-996 ">
            <div class="line line-left b-line">
                &nbsp;
            </div>
            <div class="line line-middle">
                <div class="title-en">SEARCH RESULT</div>
                <div class="title-zh">搜索结果</div>
            </div>
            <div class="line line-right b-line">
                &nbsp;
            </div>
        </div>
    </div>
    <div class="news-block bgf7">
        <div class="search-title"><div class="left-title">资讯对应匹配${newsNumberFound!}条</div><div class="right-btn"><a target="_blank" href="/news/search?title=${(RequestParameters["title"])!}">查看更多</a></div></div>
        <div style="clear: both;"></div>

        <div class="news-search b-line w1200">
            <div class="Clear rnTopic imgScale mt14">
                <#list newsList as news>
                <div class="news-item" <#if news_index%6==0>style="margin-left:0px;"</#if> >
                    <a href="/news/${(news.id)!}/detail" target="_blank">
                        <p><img src="${(news.logo)!}" ></p>
                        <div class="n-title">${(news.title)!}</div>
                    </a>
                </div>
                </#list>

                <div style="clear:both;"></div>
            </div>
        </div>


    </div>
    <div style="clear:both;"></div>
    <div class="artist-block bgf7">

        <div class="search-title"><div class="left-title">艺术家对应匹配${artistNumberFound!}条</div><div class="right-btn"><a target="_blank" href="/artist/search?name=${(RequestParameters["title"])!}">查看更多</a></div></div>
        <div style="clear: both;"></div>

        <div class="artist-recommend b-line">
            <#list artistList as artist>
            <div  class="artist-item" <#if artist_index%8==7>style="margin-right: 0px;"</#if>>
                <a href="/artist/${artist.id?default("")}/detail" target="_blank">
                    <div class="artist-img-border"><img src="${artist.avatar?default("")}" ></div>
                    <div class="artist-name">${artist.name?default("")}</div>
                </a>
            </div>
            </#list>
            <div style="clear: both;"></div>
        </div>

    </div>
    <div style="clear: both;"></div>
    <div class="appreciate-block bgf7">

        <div class="search-title"><div class="left-title" id="appreciate-desc">鉴赏对应匹配0条</div><div class="right-btn"><a target="_blank" href="/appreciate/search?title=${(RequestParameters["title"])!}">查看更多</a></div></div>
        <div style="clear: both;"></div>

        <div class="appreciate-list w1200" id="entity-list">
        </div>
    </div>
    <div class="load-more" id="load-more">点击加载更多</div>
    <input type="hidden" id="load-more-url" value="/appreciate/search-list.json"/>

</div>
<script type="text/javascript">

var title = "${(RequestParameters["title"])!}";
</script>
<script  src="/web/js/search-index.js"></script>
</body>
</html>