<!DOCTYPE html>
<html>
<head>
	<title>后台管理</title>
    <#include "../common_header.ftl"/>

</head>
<body style="zoom: 1;">
	<div class="b-container">
		<#include "../top_menu.ftl"/>
        <#include "../quick_menu.ftl"/>
        <div id="wrap">
             <div class="outer with-side with-transition" style="min-height: 600px;">
                    <#include "left_menu.ftl"/>

                    <div id="admin_right">
                    			<div class="position"><span>系统</span><span>|</span><span>个人资料</span><span>|</span><span>修改密码</span></div>
                    			<div class="content form_content" >


                                        <form action="/cms/self/uppassword" method="post">
                                        <table class="table_new">
                                            <tbody>
                                                <tr><th width="20%"></th><td><span style="color:${KEY_RESULT_MESSAGE_COLOR?default("")};">${KEY_RESULT_MESSAGE?default("")}</span></td></tr>
                                                <tr>
                                                    <th width="20%" style="text-align:right;">原密码:</th>
                                                    <td><input id="oldpass_input" type="password" class="form-control" name="oldpass" style="display:inline-block;" /><label id="oldpass_input_info" style="display:inline-block;">* 原密码</label></td>
                                                </tr>
                                                <tr>
                                                    <th width="20%" style="text-align:right;">新密码:</th>
                                                    <td><input id="newpass_input" type="password" class="form-control" name="newpass" style="display:inline-block;"/><label id="newpass_input_info" style="display:inline-block;">* 新密码</label></td>
                                                </tr>
                                                <tr>
                                                    <th width="20%" style="text-align:right;">重复输入新密码:</th>
                                                    <td><input id="repeat_newpass_input" type="password" class="form-control" style="display:inline-block;"/><label id="repeat_newpass_input_info" style="display:inline-block;">* 重复输入新密码</label></td>
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
			$("#left_menu_uppass").addClass("selected");
		});
		
		function checkFiled(){
			var oldpass=$("#oldpass_input").val();
			if(oldpass.trim()==""){
				$("#oldpass_input_info").css("color","red");
				$("#oldpass_input_info").html("* 原密码必须填写");
				return false;
			}
			var newpass=$("#newpass_input").val();
			if(newpass.trim()==""){
				$("#newpass_input_info").css("color","red");
				$("#newpass_input_info").html("* 新密码必须填写");
				return false;
			}
			
			var repeat_newpass=$("#repeat_newpass_input").val();
			if(repeat_newpass!=newpass){
				$("#repeat_newpass_input_info").css("color","red");
				$("#repeat_newpass_input_info").html("* 重复密码与新密码不一致");
				return false;
			}
			return true;
		}
	</script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div></body></html>