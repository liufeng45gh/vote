<div class="artist-block">
    <div class="title-line wrapper-996">
        <div class="line line-left b-line">
            &nbsp;
        </div>
        <div class="line line-middle">
            <div class="title-en">HFC IMAGE</div>
            <div class="title-zh">海富映像</div>
        </div>
        <div class="line line-right b-line">
            &nbsp;
        </div>
    </div>
    <div class="news-search b-line w1200">
        <div class="Clear rnTopic imgScale mt14" style="width: 1200px;">
            <#list atlasRecommendList as recommend>
                <div class="news-item img-item" <#if recommend_index%6==0>style="margin-left: 0px;"</#if>>
                    <a href="/atlas/${(recommend.target.id)}/detail" target="_blank">
                        <p><img src="${(recommend.target.logo)}" /></p>
                        <div class="img-text">${(recommend.target.title)}</div>
                    </a>
                </div>
            </#list>

            <div style="clear:both;"></div>
        </div>
    </div>

</div>