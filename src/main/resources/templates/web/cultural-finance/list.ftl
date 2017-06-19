<#list entityList as news>
<div class="news-item">
    <#if news.isLogoHave()>
    <div class="logo">
        <a href="/cultural-finance/${news.id}/detail" target="_blank">
            <img src="${news.logo?default("")}">
        </a>
    </div>
    </#if>
    <div class="text <#if !news.isLogoHave()>w800</#if>">
        <a href="/cultural-finance/${news.id}/detail" target="_blank">
            <div class="title">${news.title?default("")}</div>
        </a>
        <a href="/cultural-finance/${news.id}/detail" target="_blank">
            <div class="desc">
                ${news.summaryText()}
            </div>
        </a>
         <div class="date-info">[${(news.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}]</div>
    </div>

</div>
</#list>