<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="/cms/css/admin.css">
	<link rel="shortcut icon" href="/cms/images/favicon.ico">
	<script type="text/javascript" charset="UTF-8" src="/cms/script/jquery-1.9.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/cms/script/jquery/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/cms/script/jquery/themes/icon.css">
	<script type="text/javascript" src="/cms/script/jquery/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/cms/script/jquery/demo/demo.css">
</head>
<body style="zoom: 1;"><div class="" style="display: none; position: absolute;"><div class="aui_outer"><table class="aui_border"><tbody><tr><td class="aui_nw"></td><td class="aui_n"></td><td class="aui_ne"></td></tr><tr><td class="aui_w"></td><td class="aui_c"><div class="aui_inner"><table class="aui_dialog"><tbody><tr><td colspan="2" class="aui_header"><div class="aui_titleBar"><div class="aui_title" style="cursor: move; display: block;"></div><a class="aui_close" href="javascript:/*artDialog*/;" style="display: block;">×</a></div></td></tr><tr><td class="aui_icon" style="display: none;"><div class="aui_iconBg" style="background: none;"></div></td><td class="aui_main" style="width: auto; height: auto;"><div class="aui_content" style="padding: 20px 25px;"></div></td></tr><tr><td colspan="2" class="aui_footer"><div class="aui_buttons" style="display: none;"></div></td></tr></tbody></table></div></td><td class="aui_e"></td></tr><tr><td class="aui_sw"></td><td class="aui_s"></td><td class="aui_se" style="cursor: se-resize;"></td></tr></tbody></table></div></div>
	<div class="container">
		<jsp:include page="../top_menu.jsp"></jsp:include>
		<div id="info_bar" >
			<label class="navindex" style="display:none;"><a href="#">快速导航管理</a></label>
			<span class="nav_sec"></span>
		</div>
		<jsp:include page="left_menu.jsp"></jsp:include>
		

		<div id="admin_right">
			<div class="position"><span>系统</span><span>|</span><span>个人资料</span><span>|</span><span>修改昵称</span></div>
			<div class="content form_content" >
			
			
		<form action="/cms/self/upnick" method="post" >
		<table class="table_new">
				<tbody>
				<tr><th width="20%"></th><td><span style="color:green;"><c:out value="${KEY_RESULT_MESSAGE}"  /></span></td></tr>
				<tr>
					<th width="20%" style="text-align:right;">您的昵称:</th>
					<td><input id="nick_input" type="text" class="easyui-textbox" name="nick"  alt="昵称必须填写" value="<c:out value="${nick}"/>" /><label id="nick_input_info">* 显示名称</label></td>
				</tr>
				
				<tr>
					<th></th>
					<td>
						<button class="easyui-linkbutton" type="submit" onclick="return checkFiled();"><span>保存设置</span></button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
		</div>
		<div id="separator"></div>
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