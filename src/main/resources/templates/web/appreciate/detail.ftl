


<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>天然气销售分公司首届文创评选展示活动</title>
    <link rel="stylesheet" type="text/css" href="/web/css/vote.css"/>
    <script  src="/web/js/jquery-3.1.1.js"></script>
    <script  src="/web/js/common.js"></script>
    <script  type="text/javascript" src="/layer/layer.js"></script>
</head>
<body>

<div class=" top-bg">
    <div class="t-bg">
        <div class="category-title">${entity.title?default("")}</div>
    </div>
    <!--
    <div class="logo"><img src="http://osi1i0y6i.bkt.clouddn.com/logo.png"/></div>
    -->
    <div class="right-total">
        <span> 票数: </span><span style="margin-left: 5px;">${(entity.voteCount)!}</span>
    </div>

    <div class="left-total">
        <a href="/appreciate/category">
            <img src="/web/images/btn-bk.png" />
        </a>
    </div>

    <div style="clear: both;"></div>


</div>




<div class="vote-content">${entity.content?default("")}</div>



</body>
</html>