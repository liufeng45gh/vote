


<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>中国石油作品投票系统</title>
    <link rel="stylesheet" type="text/css" href="/web/css/vote.css"/>
    <script  src="/web/js/jquery-3.1.1.js"></script>
    <script  src="/web/js/common.js"></script>
    <script  type="text/javascript" src="/layer/layer.js"></script>
</head>
<body>

<div class="w-max bottom-line padding-side">
    <!--
    <div class="vote-info">
        <div class="span"><img src="/web/images/time_icon.png" class="a-icon"/></div>
        <div class="span"> ${(entity.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}</div>
        
        <div class="span" style="margin-left:20px;"><img src="/web/images/pl_icon.png" class="a-icon"/></div>
        <div class="span" id="comment-count"> ${(entity.voteCount)!}</div>

    </div>
    -->

    <div class="vote-title">${entity.title?default("")}</div>

    <div class="vote-content">${entity.content?default("")}</div>

</div>



</body>
</html>