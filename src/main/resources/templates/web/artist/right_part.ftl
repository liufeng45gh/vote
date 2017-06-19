<div class="separate-block">
    &nbsp;
</div>

<div class="report-block news-right">
    <div class="search-box">
        <form method="get" action="/artist/search" class="new-searching-unit" data-regestered="regestered" id="search-form">
            <input id="query" type="text" size="27" name="name" autocomplete="off" placeholder="搜索你喜欢的" value="${name!}" />
            <a href="#" onclick="return false;" class="go" id="search-btn"></a>
        </form>
    </div>


    <div class="title" >
        <div class="t-zh">推荐艺术家</div>
        <div class="t-en">RECOMMEND ARTIST</div>
    </div>
    <div class="recommend-list">
        <#list artistRecommendList as recommend>
        <div class="recommend-item">
            <div class="logo">
                <a href="/artist/${(recommend.artist.id)!}/detail" target="_blank">
                    <img src="${(recommend.artist.avatar)!}" />
                </a>
            </div>
            <div class="text">
                <div class="line1">
                    <div class="name">${(recommend.artist.name)!}</div>
                    <div class="tag">${(recommend.artist.tag)!}</div>
                </div>
                <div class="intro">
                    ${(recommend.artist.shortIntro())!}
                </div>
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

	$("#head-href-artist").addClass("active");
});
</script>