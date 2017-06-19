<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="header">
	<div class="logo" >
		<a href="/iwebshop/index.php?controller=system&amp;action=default"><img src="" /></a>
	</div>
	<div id="menu">
	
		<ul>
		<!-- <li  id="top_munu_app"><a href="/cms/app/list" >应用</a></li> -->
		<li  id="top_menu_user"><a href="/cms/user/list?page=1" >会员</a></li>				
		<li  id="top_menu_self"><a href="/cms/self/welcome">系统</a></li>
		<li  id="top_menu_self"><a href="/cms/news/list">内容</a></li>
		</ul>
	 
	</div>
	<p><a href="/cms/logout">退出管理</a> <a href="/cms/self/welcome">后台首页</a> <a href="/" target="_blank">网站首页</a> <span>您好 <label class="bold"><c:out value="${KEY_CMS_USER.nick}"/></label>，当前身份 <label class="bold">超级管理员</label></span></p>
</div>