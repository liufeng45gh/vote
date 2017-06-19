<%@ page language="java" pageEncoding="utf-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="/cms/css/admin.css">
	<link rel="shortcut icon" href="/cms/images/favicon.ico">
	<script type="text/javascript" charset="UTF-8" src="/cms/script/jquery-1.9.1.min.js"></script>
	
	
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
			<div class="content_box" style="border:none">
	<div class="content" style="height: 422px;">
						<ul class="red_box">
				
				</ul>
				<table width="31%" cellspacing="0" cellpadding="5" class="border_table_org" style="float:left">
			<thead>
				<tr><th>系统信息</th></tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<table class="list_table2" width="100%">
							<colgroup>
								<col width="80px">
								<col>
							</colgroup>
							<tbody>
								<tr><th>操作系统</th><td>linux</td></tr>
								<tr><th>web服务器</th><td>tomcat8</td></tr>
								<tr><th>数据库</th><td>mysql</td></tr>
								<tr><th>域名</th><td><a href="http://reading.dbdbd.cn" target="_blank"><b class="red3">reading.dbdbd.cn</b></a></td></tr>
								<tr><th>ip</th><td>42.96.192.4</td></tr>
								<tr><th>附件上传容量</th><td>2M</td></tr>
								<tr><th>授权信息</th><td><b class="red2">Copyright © 2012-2014 北京读书堂 All Rights Reserved</b></td></tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<table width="32%" cellspacing="0" cellpadding="5" class="border_table_org" style="float:left">
			<thead>
				<tr><th>网站概况</th></tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<table class="list_table2" width="100%">
							<colgroup>
								<col width="80px">
								<col>
							</colgroup>
							<tbody>
								<tr><th>游戏</th><td><b class="f14 red3">0</b> </td></tr>
								<tr><th>应用</th><td><b class="f14 red3">0</b> </td></tr>
								<tr><th>客户</th><td><b class="f14 red3">0</b>个</td></tr>
								<tr><th>产品</th><td><b class="f14 red3">0</b>个</td></tr>
								<tr><th>评论</th><td><a href="/iwebshop/index.php?controller=comment&amp;action=comment_list"><b class="red3 f14">0</b></a>个</td></tr>
								<tr><th>建议</th><td>总共：<b class="red3 f14">0</b>个 &nbsp;&nbsp; 未回复：<a href="/iwebshop/index.php?controller=comment&amp;action=suggestion_list"><b class="red3 f14">0</b></a>个</td></tr>
								<tr><th>咨询</th><td>总共：<b class="f14 red3">0</b>个 &nbsp;&nbsp; 未处理：<a href="/iwebshop/index.php?controller=comment&amp;action=refer_list&amp;status=0"><b class="red3 f14">0</b></a>个</td></tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<table width="33%" cellspacing="0" cellpadding="5" class="border_table_org" style="float:left">
			<thead>
				<tr><th>未处理事件</th></tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<table class="list_table2" width="100%">
							<colgroup>
								<col width="80px">
								<col>
							</colgroup>

							<tbody>
								<tr><th>事件1</th><td colspan="2"><b class="f14 red3">0</b>个</td></tr>
								<tr><th>事件2</th><td><b class="f14 red3">0</b>个</td></tr>
								<tr><th>事件3</th><td><a href="/iwebshop/index.php?controller=order&amp;action=order_list&amp;pay_status=0"><b class="f14 red3">0</b></a>个</td></tr>
								<tr><th>事件4</th><td><a href="/iwebshop/index.php?controller=order&amp;action=order_list&amp;distribution_status=0"><b class="f14 red3">0</b></a>个</td></tr>
								<tr><th>事件5</th><td><b class="f14 red3">0</b>个</td></tr>
								<tr><th>事件6</th><td colspan="2"><a href="/iwebshop/index.php?controller=order&amp;action=refundment_list"><b class="red3 f14">0</b></a>个</td></tr>
								<tr><th>事件7</th><td><a href="/iwebshop/index.php?controller=order&amp;action=order_list&amp;status=5"><b class="f14 red3">0</b></a>个</td></tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<table width="98%" cellspacing="0" cellpadding="0" class="border_table_org" style="float:left">
			<thead>
				<tr><th></th></tr>
			</thead>
			<tbody>
				<tr>
					<td style="padding:5px 0">
						
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
		</div>
		<div id="separator"></div>
	</div>

	<script type="text/javascript">
		//DOM加载完毕执行
		$(document).ready(function(){
			$("#left_menu_welcome").addClass("selected");
		});
	</script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div></body></html>