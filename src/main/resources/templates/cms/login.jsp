
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理后台登录</title>
<link rel="stylesheet" href="/cms/css/admin.css" />

</head>
<body id="login">
	<div class="container">
		<div id="header">
			<div class="logo">
				<a href="#"><img src="/cms/images/logo.jpg" width="303" height="43" /></a>
			</div>
		</div>
		<div id="wrapper" class="clearfix">
			<div class="login_box">
				<div class="login_title">后台管理登录</div>
				<div class="login_cont">
					<form action='/cms/login' method='post'>
						<table class="form_table">
							<col width="90px" />
								<span style="color:red;"><c:out value="${KEY_RESULT_MESSAGE}"  /></span>
							<col />
							<tr>
								<th valign="middle">用户名：</th><td><input class="normal" type="text" name="account" alt="请填写用户名" /></td>
							</tr>
							<tr>
								<th valign="middle">密码：</th><td><input class="normal" type="password" name="password" alt="请填写密码" /></td>
							</tr>
							<tr>
								<th valign="middle">验证码：</th><td><input style="width:85px" type='text' class='normal' name='captcha' pattern='^\w{4,10}$' alt='填写下面图片所示的字符' /><label>填写下图所示字符</label></td>
						  	</tr>
							<tr class="low">
								<th></th>
								<td><img src="/captcha-image" id='captchaImg' width="70px" height="30px"/><span class="light_gray">看不清？<a class="link" href="javascript:changeCaptcha();">换一张</a></span></td>
							</tr>
							<tr>
								<th valign="middle"></th><td><input class="submit" type="submit" value="登录" /><input class="submit" type="reset" value="取消" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="footer">Power by 北京读书堂 Copyright &copy; 2014</div>
	</div>
</body>

<script>
function changeCaptcha(){
	document.getElementById("captchaImg").src="/captcha-image?"+Math.random();
}
</script>
</html>


