
<#list dataList as comment>
<div class="comment-item">
    <div class="a-img">
        <img src="${(comment.user.avatar)!}"></img>
    </div>
    <div class="c-right">
        <div class="c-top"><div class="nick-red">${(comment.user.nickName)!}</div><div class="c-date">${(comment.showRelativeCreatedAt())!}</div></div>
        <div class="c-text">${(comment.content)!}</div>
        <#if (comment.parentId)??>
        <div class="c-parent">
            <div class="nick-red" style="padding-left: 20px;">${(comment.answerUserNick)!}</div>
            <div class="colon">:</div>
            <div class="patent-text">${(comment.answerContent)!}</div>
            <div style="clear: both;"></div>
        </div>
        </#if>
        <div style="clear: both;"></div>
        <div class="reply-btn" onclick="toReply(this);" parentId="${(comment.id)!}">回复</div>

    </div>
    <div style="clear: both;"></div>
</div>
</#list>