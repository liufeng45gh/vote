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
                    <div class="position"><span>系统</span><span>|</span><span>个人资料</span><span>|</span><span>修改昵称</span></div>
                   <div class="content form_content">
                    <form action="/cms/self/upnick" method="post">
                     <table class="table_new">
                      <tbody>
                       <tr>
                        <th width="20%"></th>
                        <td><span style="color:green;">
                          <c:out value="${KEY_RESULT_MESSAGE?default(" ")}"="" /></span></td>
                       </tr>
                       <tr>
                        <th width="20%" style="text-align:right;">您的昵称:</th>
                        <td><input id="nick_input" style="display:inline-block;" class="form-control" name="nick" alt="昵称必须填写" value="${nick}" /><label id="nick_input_info" style="display:inline-block;" >* 显示名称</label></td>
                       </tr>
                       <tr>
                        <th></th>
                        <td> <button class="btn btn-primary" type="submit" onclick="return checkFiled();">保存设置</button> </td>
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
			$("#left_menu_upnick").addClass("selected");
		});
		
		function checkFiled(){
			var nick=$("#nick_input").val();
			if(nick.trim()==""){
				$("#nick_input_info").css("color","red");
				$("#nick_input_info").html("* 昵称必须填写");
				return false;
			}
			return true;
		}
	</script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div></body></html>