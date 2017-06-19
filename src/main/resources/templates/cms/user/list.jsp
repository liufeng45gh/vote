<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.lucifer.util.PageUtil" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="/cms/css/admin.css">
	<link rel="shortcut icon" href="/cms/images/favicon.ico">
	<script type="text/javascript" charset="UTF-8" src="/web/script/jquery-1.9.1.min.js"></script>
	
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
			<div class="position"><span>会员</span><span>&gt;</span><span>会员管理</span><span>&gt;</span><span>会员列表</span></div>
			<div class="operating">
				<div class="search f_l">
					
					<form  action="" method="get">
						学生/老师
						<select class="auto" name="search[name]">
							<option value="goodsName">商品名</option>
							<option value="goodsNo">商品货号</option>
						</select>
						试用/会员
						<select class="auto" name="search[name]">
							<option value="goodsName">商品名</option>
							<option value="goodsNo">商品货号</option>
						</select>
						男/女
						<select class="auto" name="search[name]">
							<option value="goodsName">商品名</option>
							<option value="goodsNo">商品货号</option>
						</select>
						城市
						<select class="auto" name="search[name]">
							<option value="goodsName">商品名</option>
							<option value="goodsNo">商品货号</option>
						</select>
						昵称
						<input class="small" name="search[keywords]" type="text" value="">
						<button class="btn" type="submit"><span class="sch">搜 索</span></button>
					</form>
				</div>				
			</div>
	<div class="content" style="min-height: 200px;">			
		<table class="list_table" style="font-size:14px;">		
			<thead>
				<tr style="height:30px;">
					<th width="140px">编号</th>
					<th width="340px">唯一id</th>
					<th width="150px">昵称</th>
					
					<th width="180px">token</th>
					
					<th>操作</th>
				</tr>
			</thead>			
			<tbody>
			<c:forEach var="user" items="${userList}" varStatus="status">
				<tr>
					<td>${user.id}</td>
					
					<td>${user.device_id}</td>
					
					<td>${user.nick}</td>
					
					<td>${user.token}</td>
					
					<td>
						<a href="#">修改</a>
						<a href="javascript:void(0)" onclick="delModel({link:'/iwebshop/index.php?controller=goods&amp;action=goods_del&amp;id=1'})">删除</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
	</div>

	<%PageUtil pageUtil = new PageUtil(request); %>
	<%= pageUtil.willPaginate((Integer)pageUtil.attr("totalPageCount"),  "pages_bar",new String []{"page","msg"}) %> 
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