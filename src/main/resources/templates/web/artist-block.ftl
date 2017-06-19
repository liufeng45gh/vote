<div class="artist-block">
    <div class="title-line wrapper-996">
        <div class="line line-left b-line">
            &nbsp;
        </div>
        <div class="line line-middle">
            <div class="title-en">ARTIST</div>
            <div class="title-zh">海富艺术家</div>
        </div>
        <div class="line line-right b-line">
            &nbsp;
        </div>
    </div>
    <div class="artist-recommend">
        <#list artistRecommendList as recommend>
            <div  class="artist-item" <#if recommend_index%8==0>style="margin-right: 0px;"</#if>>
            <a href="/artist/${recommend.target.id?default("")}/detail" target="_blank">
            <div class="artist-img-border"><img src="${recommend.target.avatar?default("")}" ></div>
            <div class="artist-name">${recommend.target.name?default("")}</div>
            </a>
    </div>
    </#list>


</div>
