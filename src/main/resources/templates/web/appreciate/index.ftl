<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>天然气销售分公司首届文创评选展示活动</title>
    <link rel="stylesheet" type="text/css" href="/web/css/vote.css?v=1.3"/>
    <script  src="/web/js/jquery-3.1.1.js"></script>
    <script  src="/web/js/common.js"></script>
    <script  type="text/javascript" src="/layer/layer.js"></script>
    <script  type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
    <script  type="text/javascript" src="/web/js/wx-share.js?version=1.3"></script>
</head>
<body>

<div class=" top-bg">
  <div class="t-bg">
        <div class="category-title">${(currentCategory.name)!}</div>
    </div>
    <!--
    <div class="logo"><img src="http://osi1i0y6i.bkt.clouddn.com/logo.png"/></div>
    -->
    <div class="right-total">
        <span> 票数: </span><span style="margin-left: 5px;" id="all-vote-count">${allVoteCount?default(0)}</span>
    </div>

    <div class="left-total">
       <a href="/appreciate/category">
       <img src="/web/images/btn-bk.png" />
       </a>
    </div>

    <div style="clear: both;"></div>
    <!--
    <div class="vote-tips">

        <span style="font-size: 28px;"> 温馨提示:</span><span style="font-size: 25px;">每类作品均需投票（可多选），每个作品每人每天只能投一票。</span>

        <span style="font-size: 28px;"> 温馨提示:</span><span style="font-size: 25px;">投票已经结束,谢谢您的参与</span>

    </div>
     -->

</div>

<#list appreciateCategoryList as category>


    <div class="w-max m-bg">
        <#list category.appreciateList as appreciate>
            <div class="card-item <#if appreciate?is_even_item>card-right<#else>card-left</#if>" objectId="${appreciate.id!}">
                <div class="card-border">
                    <div class="card-title"><span class="c-rosewood">${appreciate.title!}</span></div>
                    <div class="card-img">

                        <a href="/appreciate/${appreciate.id!}/detail" ><img src="${appreciate.logo!}"></a>
                        <!--
                        <img src="${appreciate.logo!}">
                         -->
                    </div>

                    <div class="vote-count">
                        <span class="c-rosewood">票数</span>
                        <span class="c-rosewood">${appreciate.voteCount!}</span>

                        <span class="c-red s-right">${appreciate.id!} 号</span>
                    </div>



                </div>
                <div class="vote-btn">&nbsp;</div>
                
            </div>
        </#list>
        
        <div style="clear: both;"></div>
    </div>

</#list>
<!--
<div class="to_index">
    <a href="/appreciate/category"><img src="http://osi1i0y6i.bkt.clouddn.com/to_index.jpg"/></a>
</div>
-->

<script  src="/web/js/appreciate/index.js?version=1.1"></script>
</body>
</html>