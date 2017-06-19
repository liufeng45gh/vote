<#list artistInterviewList as interview>
   <div class="news-item">
       <#if interview.isLogoHave()>
       <div class="logo">
           <a href="/artist/interview/${interview.id}/detail" target="_blank">
               <img src="${interview.logo?default("")}">
           </a>
       </div>
   </#if>
       <div class="text <#if !interview.isLogoHave()>w800</#if>">
           <a href="/artist/interview/${interview.id}/detail" target="_blank">
               <div class="title">${interview.title?default("")}</div>
           </a>
           <a href="/artist/interview/${interview.id}/detail" target="_blank">
               <div class="desc">
                   ${interview.summaryText()}
               </div>
           </a>
           <div class="date-info">[${(interview.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}]</div>
       </div>

   </div>
</#list>
