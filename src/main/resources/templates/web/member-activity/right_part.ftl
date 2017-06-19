<div class="separate-block">
    &nbsp;
</div>

<div class="report-block news-right">
    <div class="search-box">
        <form method="get" action="/news/search" class="new-searching-unit" data-regestered="regestered" id="search-form">
            <input id="query" type="text" size="27" name="title" autocomplete="off" placeholder="搜索你喜欢的" value="${title!}" />
            <a href="#" onclick="return false;" class="go" id="search-btn"></a>
        </form>
    </div>


    <div class="title" >
        <div class="t-zh">最热新闻</div>
        <div class="t-en">HOT NEWS</div>
    </div>
    <div class="hot-list">
        <#list hotList as news>
        <div class="hot-item">
            <#if news.isLogoHave()>
            <div class="logo">
                <a href="/news/${news.id}/detail" target="_blank">
                    <img src="${news.logo?default("")}" >
                </a>
            </div>
            </#if>
            <div class="text <#if !news.isLogoHave()>long-text</#if>">
                <a href="/news/${news.id}/detail" target="_blank">
                    <div class="hot-title">${news.title?default("")}</div>
                </a>
                <div class="date-info">[${(news.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}]</div>
            </div>
        </div>
        </#list>
     </div>

    <div class="hr-border" style="width:360px;">
        <hr  class="line-info-hr"/>
    </div>

    <div class="title" >
        <div class="t-zh">精彩推荐</div>
        <div class="t-en">WONDERFUL RECOMMEND</div>
    </div>

    <div class="wonderful-recommend-list">
        <#list recommendList as recommend>
        <div class="wonderful-recommend-item <#if recommend?is_even_item>left-36</#if>" >
            <#if recommend.news.isLogoHave()>
            <div class="logo">
                <a href="/news/${(recommend.news.id)!}}/detail" target="_blank">
                    <img src="${recommend.news.logo?default("")}" >
                </a>
            </div>
            </#if>
            <div class="text">
                <a href="/news/${(recommend.news.id)!}/detail" target="_blank">
                    <div class="recommend-title">${(recommend.news.rightRecommendTitle())!}</div>
                </a>
            </div>
        </div>
        </#list>
    </div>

</div>

<script>

$(function() {
	$("#search-btn").click(function (){
        $("#search-form").submit();
	});
	$("#head-href-member-activity").addClass("active");
});
</script>