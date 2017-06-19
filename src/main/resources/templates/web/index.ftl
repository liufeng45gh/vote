<!DOCTYPE html>
<html>
<head>
    <title>海富文化艺术网-首页</title>
    <meta name="keywords" content="海富文化艺术网，海富文化艺术，海富文化，海富集团，北京海富集团，北京海富，海富"/>
    <meta name="keywords" content="瓷器，玉器，木雕，书画，红木，紫砂，民间藏品，珠宝首饰，刺绣，艺术家培养，艺术品创作，展览，拍卖，销售，金融服务"/>
    <meta name="description" content="北京海富国际文化艺术集团有限责任公司，是一家从源头上进行艺术家培育、从根本上改变艺术品流通方式和提高艺术品流通效率的多功能综合性投资管理服务集团。集团下辖北京中海国金农业咨询有限公司、北京锦泓轩文化艺术传媒有限责任公司、北京观檀家具有限责任公司。业务范围囊括书画、红木、紫砂、陶瓷、玉器、木雕、民间藏品、珠宝首饰、刺绣九大艺术门类的艺术家培养，艺术品创作、展览、拍卖、销售、金融服务。"/>

    <#include "c-head.ftl"/>
    <link rel='stylesheet' href='/web/css/research-report.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/appreciate.css' type='text/css' media='screen' />
</head>

<body>
<div class="web-main page-min-width">
    <#include "index-top.ftl"/>

    <div class="news-block bgf7">
        <div style="width:100%;height:1px;"></div>
        <div class="title-line wrapper-996 ">
            <div class="line line-left b-line">
               &nbsp;
            </div>
            <div class="line line-middle">
                <div class="title-en">RECOMMEND</div>
                <div class="title-zh">重点推荐</div>
            </div>
            <div class="line line-right b-line">
               &nbsp;
            </div>
        </div>

        <div class="news-recommend wrapper-996 ">
            <div class="carousel-border">

                <div id="focus" class="focus">
                    <ul>
                        <#list carouselList as carousel>
                        <li><a href="${carousel.link?default("")}" target="_blank"><img src="${carousel.logo?default("")}" class="carousel-img" alt="${carousel.title?default("")}" des="${carousel.summary?default("")}"/></a></li>
                        </#list>


                    </ul>
                    <div id="focusTitle">
                        <div class="tit" id="focus-tit">

                        </div>
                        <div class="des" id="focus-des"></div>
                    </div>
                </div>
            </div>
            <div class="news-border">
                <div class="Clear rnTopic imgScale mt14">
                    <#list newsCarouselList as carousel>
                    <div class="news-item">
                        <a href="${carousel.link?default("")}" target="_blank">
                            <p><img src="${carousel.logo?default("")}" ></p>
                            <div class="n-title">${carousel.title?default("")}</div>
                        </a>
                    </div>
                    </#list>

                </div>
            </div>

        </div>
    </div>

    <#include "index/atlas-block.ftl"/>
    <div class="third-block bgf7">
        <div class="info-fr wrapper-996">
            <div class="finance-block">
                <div class="title-line">
                    <div class="line line-left b-line"  style="width:100px;">
                       &nbsp;
                    </div>
                    <div class="line line-middle" style="width:390px;">
                        <div class="title-en">HFC STUDY </div>
                        <div class="title-zh">海富学习</div>
                    </div>
                    <div class="line line-right b-line"  style="width:100px;">
                        &nbsp;
                    </div>
                </div>
                <div class="finance-list">
                    <#list financeRecommendList as recommend>
                    <div class="finance-item">
                        <div class="logo">
                            <a href="/cultural-finance/${recommend.target.id?default("")}/detail" target="_blank">
                                <img src="${recommend.target.logo?default("")}" >
                            </a>
                        </div>
                        <div class="text">
                            <a href="/cultural-finance/${recommend.target.id?default("")}/detail" target="_blank">
                            <div class="title">【${(recommend.target.categoryName)!}】${recommend.target.title?default("")}</div>
                             </a>
                            <div class="desc">${recommend.target.indexSummaryText()}</div>
                            <div class="date-info">[${(recommend.target.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}]</div>
                        </div>

                    </div>
                    </#list>




                </div>

            </div>
            <div class="separate-block">
                &nbsp;
            </div>
            <div class="report-block">
                <div class="title-line">
                    <div class="line line-left b-line" style="width:100px;">
                        &nbsp;
                    </div>
                    <div class="line line-middle" style="width:390px;">
                        <div class="title-en">GLOBAL CULTURE </div>
                        <div class="title-zh">环球文化</div>
                    </div>
                    <div class="line line-right b-line"  style="width:100px;">
                        &nbsp;
                    </div>
                </div>
                <div class="finance-list">
                    <#list researchRecommendList as recommend>
                    <div class="finance-item">
                        <#if recommend.target.isLogoHave()>
                        <div class="logo">
                            <a href="/research-report/${recommend.target.id}/detail" target="_blank">
                                <img src="${recommend.target.logo?default("")}" >
                            </a>
                        </div>
                         </#if>
                        <div class="text <#if !recommend.target.isLogoHave()>w588</#if>"">
                            <a href="/research-report/${recommend.target.id}/detail" target="_blank">
                                <div class="title">${recommend.target.title?default("")}</div>
                            </a>
                            <a href="/research-report/${recommend.target.id}/detail" target="_blank">
                                <div class="desc"> ${recommend.target.indexSummaryText()}</div>
                            </a>
                            <div>
                                ${recommend.target.downloadHtml()}
                                <div class="date-info">[${(recommend.target.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}]</div>
                            </div>
                        </div>

                    </div>
                    </#list>



                </div>
            </div>


        </div>
    </div>
    <!--
    <div class="member-block">
        <div class="title-line wrapper-996">
            <div class="line line-left b-line" style="width:400px;">
                &nbsp;
            </div>
            <div class="line line-middle" style="width:400px;">
                <div class="title-en">MEMBER ACTIVITY</div>
                <div class="title-zh">会员活动</div>
            </div>
            <div class="line line-right b-line" style="width:400px;">
                &nbsp;
            </div>

        </div>
        <div class="member-list wrapper-996">
            <div class="finance-list">
                <#list memberActivityRecommendList as recommend>
                <div class="finance-item active-item" <#if recommend_index%2!=0>style="margin-left: 20px;"</#if>>
                    <#if recommend.target.isLogoHave()>
                    <div class="logo">
                        <a href="/member-activity/${recommend.target.id}/detail" target="_blank">
                            <img src="${recommend.target.logo?default("")}">
                        </a>
                    </div>
                    </#if>
                    <div class="text <#if !recommend.target.isLogoHave()>w588</#if>">
                        <a href="/member-activity/${recommend.target.id}/detail" target="_blank">
                            <div class="title">${recommend.target.title?default("")}</div>
                        </a>
                        <a href="/member-activity/${recommend.target.id}/detail" target="_blank">
                        <div class="desc">${recommend.target.indexSummaryText()}</div>
                        </a>
                        <div class="date-info">[${(recommend.target.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}]</div>
                    </div>

                </div>
                </#list>
            </div>
        </div>
    -->

    </div>
    <div style="clear: both"></div>
    <div class="third-block bgf7" id="appreciate-block">
            <div>&nbsp;</div>
            <div class="title-line wrapper-996">
                <div class="line line-left b-line" style="width:400px;">
                    &nbsp;
                </div>
                <div class="line line-middle" style="width:400px;">
                    <div class="title-en">HFC ARTWORK</div>
                    <div class="title-zh">海富艺术品</div>
                </div>
                <div class="line line-right b-line" style="width:400px;">
                    &nbsp;
                </div>

            </div>
            <div class="info-fr wrapper-996 appreciate-list" id="entity-list">


            </div>
            <div style="clear: both"></div>
            <div class="load-more" id="load-more">点击加载更多</div>
            <input type="hidden" id="load-more-url" value="/appreciate/list.json"/>
    </div>


</div>

<script type="text/javascript">
$(function() {
	$('#focus').slideFocus();
});
</script>

<script  src="/web/js/index.js"></script>

</body>
</html>