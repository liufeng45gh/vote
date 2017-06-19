
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title>Oauth2.0-授权登录</title>
    <link type="text/css" rel="stylesheet"  href="/oauth2/css/login.css" source="widget"/>

    </head>
<body>
<!-- SDK 登录 -->
    <div class="w">
        <div id="logo"><a href="/" clstag="pageclick|keycount|20150112ABD|45"><img src="http://www.dbdbd.cn/images/logo.png" alt="Oauth2.0" width="170" height="60"></a></div>
    </div>
    <div id="content">
        <div class="login-wrap">
            <div class="w">
                <div class="login-form">
                    <div class="login-box">
                        <div class="mt">
                            <h1>Auth2.0 授权登录</h1>

                        </div>
                        <div class="msg-wrap">
                            <div class="msg-warn hide"><b></b></div>
                            <div class="msg-error hide"><b></b></div>
                        </div>
                        <div class="mc">
                            <div class="form">
                                <form id="formlogin" method="post" onsubmit="return false;">

                                                                        <div class="item item-fore1">
                                        <label for="loginname" class="login-label name-label"></label>
                                        <input id="loginname" type="text" class="itxt" name="loginname" tabindex="1" autocomplete="off"
                                                                                           placeholder="邮箱/用户名/已验证手机" />
                                        <span class="clear-btn"></span>
                                    </div>
                                    <div id="entry" class="item item-fore2">
                                        <label class="login-label pwd-label" for="nloginpwd"></label>
                                        <label id="sloginpwd" style="display: none;"></label>
                                        <input type="password" id="nloginpwd" name="nloginpwd" class="itxt itxt-error" tabindex="2" autocomplete="off" placeholder="密码"/>

                                        <span class="clear-btn"></span>
                                        <span class="capslock"><b></b>大小写锁定已打开</span>
                                    </div>
                                    <div class="item item-fore3">
                                        <div class="safe">
                                        <span>
                                            <input id="autoLogin" name="chkRememberMe" type="checkbox" class="jdcheckbox" tabindex="3"  clstag="pageclick|keycount|20150112ABD|6">
                                            <label for="">自动登录</label>
                                        </span>
                                                                                        <span class="forget-pw-safe">
                                            <a href="//safe.jd.com/findPwd/index.action" class="" target="_blank" clstag="pageclick|keycount|20150112ABD|8">忘记密码?</a>
                                        </span>
                                        </div>

                                    </div>
                                    

                                    <div class="item item-fore5">
                                        <div class="login-btn">
                                            <a href="javascript:;" class="btn-img btn-entry" id="loginsubmit" tabindex="6" clstag="pageclick|keycount|20150112ABD|2">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>


                                    </div>
            </div>
            <div class="login-banner" clstag="pageclick|keycount|20150112ABD|46">
                <div class="w">
                    <div id="banner-bg" class="i-inner"
                                                    >
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="w">
        <div id="footer-2013">
            <div class="links">

            </div>
            <div class="copyright">
                Copyright&copy;2004-2016&nbsp;&nbsp;Oauth2.0.com&nbsp;版权所有
            </div>
        </div>
    </div>

    </body>
</html>

