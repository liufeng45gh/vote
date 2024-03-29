<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>天然气销售分公司首届文创评选展示活动</title>
    <link rel="stylesheet" type="text/css" href="/web/css/vote.css?version=1.1"/>
      <link rel="stylesheet" type="text/css" href="/web/css/category.css?version=1.1"/>
    <script  src="/web/js/jquery-3.1.1.js"></script>
    <script  src="/web/js/common.js"></script>
    <script  type="text/javascript" src="/layer/layer.js"></script>
    <script  type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
    <script  type="text/javascript" src="/web/js/wx-share.js?version=1.3"></script>
</head>
<body>

<div class=" top-bg">
    <!--
    <div class="logo"><img src="/web/images/logo.png"/></div>
    <div class="right-total">
        <span style="color: white;"> 总投票数: </span><span style="color: #FFFF00;margin-left: 5px;">${allVoteCount?default(0)}</span>
    </div>
    <div class="left-total">
        <span style="color: white;"> 总作品数:</span><span style="color: #FFFF00;margin-left: 10px;">${allAppreciateCount?default(0)}</span>
    </div>
    -->
    <div style="clear: both;"></div>
      <!--
    <div class="vote-tips">

        <span style="font-size: 28px;"> 温馨提示:</span><span style="font-size: 25px;">每类作品均需投票（可多选），每个作品每人每天只能投一票。</span>

        <span style="font-size: 28px;"> 温馨提示:</span><span style="font-size: 25px;">投票已经结束，谢谢您的参与</span>

    </div>
    -->

</div>

<div class="w-max ">

    <#list appreciateCategoryList as category>
    <div class="c-item">
        <div class="c-img">
            <a href="/appreciate/by-category/${category.id!}"><img src="${category.image!}"/></a>
        </div>
    </div>
    </#list>

    <div class="c-culture">
        <a href="https://www.cnpc.com.cn/cnpc/gyqywh/qywh_index.shtml">
        <img class="see-culture" id="see-culture" src="/web/images/culture.png"/>
        </a>
    </div>

    <div style="clear: both;"></div>
</div>
</body>
</html>