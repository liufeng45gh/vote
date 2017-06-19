<!DOCTYPE html>
<html>
<head>
    <link rel='stylesheet' href='/web/css/register.css' type='text/css' media='screen' />
    <script  src="/web/js/jquery-3.1.1.js"></script>
    <script  type="text/javascript" src="/layer/layer.js"></script>
    <script  src="/web/js/common.js"></script>
    <script  src="/web/js/register.js"></script>
</head>
<body>
<div class="main">
    <div class="middle">
        <div class="title-block">
            <div class="title-line">&nbsp;</div>
            <div class="title-name">会员注册</div>
        </div>
        <div class="phone-block">
            <input class="phone-input" placeholder="请输入手机号" id="phone-input"/>
            <i class="icon-phone"></i>
        </div>
        <div style="clear:both;"></div>
        <div class="check-block">
            <div class="img-check">
                <input class="img-check-input" placeholder="图片验证码" id="img-check-input"/>
            </div>
            <div class="img-code">
                <img src="/captcha-image" id='captchaImg' width="70px" height="30px"/><span class="light_gray" >看不清？<a class="link" href="javascript:changeCaptcha();">换一张</a>
            </div>
        </div>
        <div style="clear:both;"></div>
        <div class="check-block">
            <div class="code-check">
                <input class="code-check-input" placeholder="请输入手机验证码" id="phone-check-input">
            </div>
            <div class="send-code">
                <div class="btn" id="send-code-btn">发送验证码</div>
                <div class="btn-message" id="btn-message"></div>
            </div>
        </div>
        <div style="clear:both;"></div>
        <div class="pass-block">
            <input class="pass-input" type="password" placeholder="请输入密码" id="pass-input">
            <i class="icon-pass"></i>
        </div>

        <div class="btn-submit" id="btn-submit">
            提交注册
        </div>


    </div>

</div>
<script>
function changeCaptcha(){
	document.getElementById("captchaImg").src="/captcha-image?"+Math.random();
}
</script>
</body>
</html>