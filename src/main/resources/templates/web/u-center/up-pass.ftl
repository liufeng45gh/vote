<!DOCTYPE html>



<html>
<head>
    <#include "../c-head.ftl"/>

    <link rel='stylesheet' href='/web/css/news.css' type='text/css' media='screen' />
    <link rel='stylesheet' href='/web/css/u-center.css' type='text/css' media='screen' />

    <script  type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="UTF-8" src="/web/js/jquery.form-3.45.js"></script>
</head>

<body>
<div class="web-main page-min-width">


    <#include "../c-top.ftl"/>



    <div class="next-block">
        <div class="info-fr wrapper-996 b-line" style="height: 80px;">
            <div class="finance-block news-left">
                <div class="news-nav">

                    <a href="/"><div class="nav-item" >首页</div></a>   <div class="nav-item" >&gt;</div>
                    <a href="/u-center/index"><div class="nav-item" >个人中心</div></a>
                    <div class="nav-item" >&gt;</div>
                    <a href="/u-center/up-pass"><div class="nav-item" >修改密码</div></a>

                </div>

            </div>
        </div>
        <div class="info-fr wrapper-996" style="height: 80px;">
            <#include "menu.ftl"/>
        </div>


    </div>

    <div class="next-block bgf7" style="padding-top: 22px;height: 600px;">
        <div class="info-fr wrapper-996 box" style="height: 555px;">
            <div class="info-title "><span class="t-cn">修改密码</span> <span class="t-en">Update Password</span></div>
            <div class="info-fr wrapper-996 b-line" style="height: 1px;">&nbsp;</div>
            <div style="clear:both;"></div>
            <div>

                <div class="i-box">
                    <form action="/u-center/pass/update" method="post" id="hfc-form">
                        <div class="ftr">
                            <div class="f-name p-name">原密码</div>
                            <div class="f-input">
                                <input placeholder="请输入原密码" id="old-pass" name="oldPass" type="password" />
                            </div>
                        </div>


                        <div class="ftr">
                            <div class="f-name p-name">新密码</div>
                            <div class="f-input">
                                <input placeholder="请输入新密码" id="new-pass" name="newPass" type="password"/>
                            </div>
                        </div>

                        <div class="ftr">
                            <div class="f-name p-name">重复输入新密码</div>
                            <div class="f-input">
                                <input placeholder="重复输入新密码" id="repeat-pass" name="repeatPass" type="password"/>
                            </div>
                        </div>




                        <div class="ftr">
                            <div class="btn-submit p-submit">保存</div>
                        </div>
                    </form>

                </div>
            </div>
        </div>



    </div>




</div>

<script>
    $("#up-pass").addClass("active");
</script>
<script type="text/javascript" charset="UTF-8" src="/web/js/u-center/pass-up.js"></script>

</body>
</html>