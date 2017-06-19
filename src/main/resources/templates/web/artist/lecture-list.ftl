<#list artistLectureList as entity>
  <div class="news-item">
      <#if entity.isLogoHave()>
      <div class="logo">
          <a href="/artist/lecture/${entity.id}/detail" target="_blank">
              <img src="${entity.logo?default("")}">
          </a>
      </div>
  </#if>
      <div class="text <#if !entity.isLogoHave()>w800</#if>">
          <a href="/artist/lecture/${entity.id}/detail" target="_blank">
              <div class="title">${entity.title?default("")}</div>
          </a>
          <a href="/artist/lecture/${entity.id}/detail" target="_blank">
              <div class="desc">
                  ${entity.summaryText()}
              </div>
          </a>
          <div class="date-info">[${(entity.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}]</div>
      </div>

  </div>
</#list>