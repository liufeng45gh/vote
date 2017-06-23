<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>中国石油作品投票系统</title>
    <link rel="stylesheet" type="text/css" href="/web/css/vote.css"/>
</head>
<body>

<div class="w-max top-bg">
    <div class="logo"><img src="/web/images/logo.png"/></div>
    <div class="right-total">
        <span style="color: white;"> 总投票数: </span><span style="color: #FFFF00;margin-left: 5px;">2345</span>
    </div>
    <div class="left-total">
        <span style="color: white;"> 总作品数:</span><span style="color: #FFFF00;margin-left: 10px;">${allAppreciateCount?default(0)}</span>
    </div>
    <div style="clear: both;"></div>
    <div class="vote-tips">
        <span style="font-size: 28px;"> 温馨提示:</span><span style="font-size: 25px;">每个作品每天每人只能投一票</span>
    </div>

</div>

<#list appreciateCategoryList as category>
    <div class="w-max m-bg">
        <div class="category-title"><img src="${(category.icon)!}"/></div>
    </div>

    <div class="w-max m-bg">
        <#list category.appreciateList as appreciate>
            <div class="card-item <#if appreciate?is_even_item>card-right<#else>card-left</#if>" objectId="${appreciate.id!}">
                <div class="card-img">
                    <img src="${appreciate.logo!}">
                </div>
                <div class="vote-count"><span class="c-red">${appreciate.voteCount!}</span><span class="c-rosewood">票</span></div>
                <div class="source"><span class="c-rosewood">报送单位--${appreciate.source!}</span></div>
                <div class="vote-btn">投票</div>
            </div>
        </#list>
        
        <div style="clear: both;"></div>
    </div>
    
</#list>


</body>
</html>