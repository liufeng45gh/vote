<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>中国石油第二届新媒体内容创作大赛投票系统</title>
    <link rel="stylesheet" type="text/css" href="/web/css/vote.css?version=1.0"/>
    <script  src="/web/js/jquery-3.1.1.js"></script>
    <script  src="/web/js/common.js"></script>
    <script  type="text/javascript" src="/layer/layer.js"></script>
    <script  type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script  type="text/javascript" src="/web/js/wx-share.js"></script>
</head>
<body>

<div class="w-max top-bg">
    <div class="logo"><img src="/web/images/logo.png"/></div>
    <div class="right-total">
        <span style="color: white;"> 总投票数: </span><span style="color: #FFFF00;margin-left: 5px;">${allVoteCount?default(0)}</span>
    </div>
    <div class="left-total">
        <span style="color: white;"> 总作品数:</span><span style="color: #FFFF00;margin-left: 10px;">${allAppreciateCount?default(0)}</span>
    </div>
    <div style="clear: both;"></div>
    <div class="vote-tips">
        <span style="font-size: 28px;"> 温馨提示:</span><span style="font-size: 25px;">每类作品均需投票（可多选），每个作品每人每天只能投一票。</span>
    </div>

</div>

<#list appreciateCategoryList as category>
    <div class="w-max t-bg">
        <div class="category-title"><img src="${(category.icon)!}"/></div>
    </div>

    <div class="w-max m-bg">
        <#list category.appreciateList as appreciate>
            <div class="card-item <#if appreciate?is_even_item>card-right<#else>card-left</#if>" objectId="${appreciate.id!}">
                <div class="card-img">
                    <a href="/appreciate/${appreciate.id!}/detail" target="_blank"><img src="${appreciate.logo!}"></a>
                </div>
                <div class="vote-count"><span class="c-red">${appreciate.voteCount!}</span><span class="c-rosewood">票</span></div>
                <div class="source"><span class="c-rosewood">标题--${appreciate.source!}</span></div>
                <div class="vote-btn">投票</div>
            </div>
        </#list>
        
        <div style="clear: both;"></div>
    </div>
    
</#list>
<div class="to_index">
    <a href="/appreciate/category"><img src="/web/images/to_index.jpg"/></a>
</div>

<script  src="/web/js/appreciate/index.js"></script>
</body>
</html>