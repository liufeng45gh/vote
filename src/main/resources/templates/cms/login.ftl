
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <meta name="renderer" content="webkit">
  <title>用户登录 - 投票系统后台管理系统</title>


  <link rel='stylesheet' href='/cms/css/theme-default.css' type='text/css' media='screen' />
  <link rel='stylesheet' href='/cms/css/login.css' type='text/css'  />
  <link rel='icon' href='/favicon.ico' type='image/x-icon' />
  <link rel='shortcut icon' href='/favicon.ico' type='image/x-icon' />
  <script type="text/javascript" charset="UTF-8" src="/cms/script/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" charset="UTF-8" src="/cms/script/common.js"></script>

</head>
<body>
  <div id='container'>
    <div id='login-panel'>
      <div class='panel-head'>
        <h4>投票系统后台管理系统</h4>



        <div class='panel-actions'>
          <div class='dropdown' id='langs'>
            <button class='btn' data-toggle='dropdown' title='Change Language/更换语言/更換語言'>简体 <span class="caret"></span></button>
            <ul class='dropdown-menu'>
              <li class="active"><a href="###" data-value="zh-cn">简体</a></li>
            </ul>
          </div>
          <button data-placement='bottom' data-toggle='popover' data-content="<img height='297' width='297' src='http://demo.zentao.net/misc-qrcode.html' />" title="手机访问" id='mobile' class='btn'><i class='icon-mobile'></i></button>
        </div>
      </div>
      <div class="panel-content" id="login-form">
        <form method='post'  class='form-condensed' action='/cms/login' onsubmit="return remember();">
          <table class='table table-form'>

            <tr>
              <th>用户名</th>
              <td><input class='form-control' type='text' name='account' id='account' /></td>
            </tr>
            <tr>
              <th>密码</th>
              <td><input class='form-control' type='password' name='password'  /></td>
            </tr>
            <tr>
              <th>验证码</th><td><input style="width:85px;display:inline-block;"  class='form-control' name='captcha' pattern='^\w{4,10}$' alt='填写下面图片所示的字符' /><label style="display:inline-block;margin-left:30px;">填写下图所示字符</label></td>
            </tr>
            <tr class="low">
              <th></th>
              <td><img src="/captcha-image" id='captchaImg' width="70px" height="30px"/><span class="light_gray" style="margin-left:45px;">看不清？<a class="link" href="javascript:changeCaptcha();">换一张</a></span></td>
            </tr>
            <tr>
              <th></th>
              <td id="keeplogin"><label class='checkbox-inline'><input type='checkbox' name='keepLogin[]' value='on'  id='keepLoginon' /> 记住用户名</label></td>
            </tr>
            <tr>
              <th></th>
              <td>
               <button type='submit' id='submit' class='btn btn-primary'  data-loading='稍候...'>登录</button><input type='hidden' name='referer' id='referer' value='/'  />
               <div style="color:red;display:inline-block;margin-left:65px;">${KEY_RESULT_MESSAGE!""}</div>
             </td>
           </tr>
         </table>
       </form>
     </div>


     <div id='demoUsers' class="panel-foot">
      <span>更多功能：</span>
      <a href='#'  target='hiddenwin'>使用手册</a>
      <a href='#'  target='hiddenwin'>官方客服</a>
      <a href='#'  target='hiddenwin'>最新版本</a>
      <a href='#'>更多软件</a>
      <a href='#'>定制开发</a>

    </div>
  </div>

  <p style='margin-top:25px; color:#fff; text-align:center'>
    开发团队：
    <a href='#' style="color:yellow">liufx</a>
    <a href='#' style="color:yellow">投票系统</a>
  </p>
  <div id="poweredby">
    <iframe id='updater' class='hidden' frameborder='0' width='100%' scrolling='no' allowtransparency='true' src="http://api.zentao.net/updater-isLatest-8.2.4-9e3dbcba3fcfa456fdc14568103d4e83.html?lang=zh_cn"></iframe>
  </div>
</div>
<script>
function changeCaptcha(){
	document.getElementById("captchaImg").src="/captcha-image?"+Math.random();
}
$(document).ready(function(){
    var account = getCookie("account");
    if (account==null||account=="") {
        //donothing
    } else {
        $("#account").val(account);
        $("#keepLoginon").get(0).checked = true;
    }
});

function remember(){
    var account = $("#account").val();
    if ($("#keepLoginon").get(0).checked) {
        setCookie("account",account);
    }else {
        setCookie("account","");
    }
}
</script>
</body>
</html>
