
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title>Oauth2.0-授权登录</title>
    <link type="text/css" rel="stylesheet"  href="/web/css/login.css" source="widget"/>
    <script type="text/javascript" charset="UTF-8" src="/oauth2/script/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="/oauth2/script/login.js"></script>
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
                            <#if Request["KEY_RESULT_MESSAGE"]?exists>
                               <div class="msg-error">${KEY_RESULT_MESSAGE}</div>
                            </#if>

                        </div>
                        <div class="mc">
                            <div class="form">
                                <form id="formlogin" method="post" action="/oauth2.0/authorize">

                                                                        <div class="item item-fore1">
                                        <label for="loginname" class="login-label name-label"></label>
                                        <input type="hidden" name="response_type" value="${response_type?default("")}">
                                        <input type="hidden" name="client_id" value="${client_id?default("")}">
                                        <input type="hidden" name="redirect_uri" value="${redirect_uri?default("")}">
                                        <input id="loginname" type="text" class="itxt" name="account" tabindex="1" autocomplete="off"
                                                                                           placeholder="邮箱/用户名/手机" />
                                        <span class="clear-btn"></span>
                                    </div>
                                    <div id="entry" class="item item-fore2">
                                        <label class="login-label pwd-label" for="nloginpwd"></label>
                                        <label id="sloginpwd" style="display: none;"></label>
                                        <input type="password" id="nloginpwd" name="password" class="itxt itxt-error" tabindex="2" autocomplete="off" placeholder="密码"/>

                                        <span class="clear-btn"></span>
                                        <span class="capslock"><b></b>大小写锁定已打开</span>
                                    </div>
                                    <div class="item item-fore3">
                                        <div class="safe">
                                        <span>
                                            <input id="autoLogin" name="chkRememberMe" type="checkbox" class="jdcheckbox">
                                            <label for="">自动登录</label>
                                        </span>
                                        <span class="forget-pw-safe">
                                            <a href="#" class="" target="_blank" >忘记密码?</a>
                                        </span>
                                        </div>

                                    </div>


                                    <div class="item item-fore5">
                                        <div class="login-btn">
                                            <a href="javascript:;" class="btn-img btn-entry" onclick="loginSubmit();">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>


                                    </div>
            </div>
            <div class="login-banner" >
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

