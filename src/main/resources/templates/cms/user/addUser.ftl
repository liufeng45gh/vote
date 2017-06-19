<!DOCTYPE html>
<html>
<head>
	<title>后台管理</title>
    <#include "../common_header.ftl"/>

</head>
<body style="zoom: 1;">
	<div class="b-container">
		<#include "../top_menu.ftl"/>
		 <div id="modulemenu" >
           <ul class="nav">
           <li data-id="list"><a id="currentItem" href="#">快速导航 <span class="icon-caret-right"></span></a></li>

           <li  data-id="task"><a href="/cms/user/list">管理员</a>
           </li>
           <li  data-id="story"><a href="/cms/user/add">新建管理员</a>
           </li>

           </ul>
        </div>
        <div id="wrap">
             <div class="outer with-side with-transition" style="min-height: 600px;">
                    <#include "left_menu.ftl"/>

                    <div id="admin_right">
                    			<div class="position"><span>管理员</span><span>|</span><span>新建管理员</span></div>
                    			<div class="content form_content" >


                                        <form action="/cms/user/add" method="post">
                                        <table class="table_new">
                                            <tbody>
                                                <tr><th width="20%"></th><td><span style="color:${KEY_RESULT_MESSAGE_COLOR?default("")};">${KEY_RESULT_MESSAGE?default("")}</span></td></tr>
                                                <tr>
                                                    <th width="20%" style="text-align:right;">管理员账号:</th>
                                                    <td><input id="account_input"  class="form-control" name="account" style="display:inline-block;" /><label id="account_input_info" style="display:inline-block;">* 用户账号</label></td>
                                                </tr>
                                                <tr>
                                                    <th width="20%" style="text-align:right;">昵称:</th>
                                                    <td><input id="nick_name_input"  class="form-control" name="nickName" style="display:inline-block;"/><label id="nick_name_input_info" style="display:inline-block;">* 昵称</label></td>
                                                </tr>
                                                <tr>
                                                    <th width="20%" style="text-align:right;">密码:</th>
                                                    <td><input id="password_input"  class="form-control" name="password" style="display:inline-block;"/><label id="password_input_info" style="display:inline-block;">* 密码</label></td>
                                                </tr>

                                                <tr>
                                                    <th></th>
                                                    <td>
                                                        <button class="btn btn-primary" type="submit" onclick="return checkFiled();">保存设置</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                    </div>
             </div>
        </div>
	</div>

	<script type="text/javascript">
		//DOM加载完毕执行
		$(document).ready(function(){
			$("#left_menu_add").addClass("selected");
		});
		
		function checkFiled(){
			var account=$("#account_input").val();
			if(account.trim()==""){
				$("#account_input_info").css("color","red");
				$("#account_input_info").html("* 账号必须填写");
				return false;
			}
			var nick_name=$("#nick_name_input").val();
			if(nick_name.trim()==""){
				$("#nick_name_input_info").css("color","red");
				$("#nick_name_input_info").html("* 昵称必须填写");
				return false;
			}
			
			var password=$("#password_input").val();
			if(password.trim()==""){
				$("#password_input_info").css("color","red");
				$("#password_input_info").html("* 密码必须填写");
				return false;
			}
			return true;
		}
	</script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div></body></html>