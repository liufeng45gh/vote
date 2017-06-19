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
                			<div class="content_box" style="border:none">
                			<div class="position"><span>管理员</span><span>&gt;</span><span>管理员列表</span></div>
                			<div class="operating">
                				<div class="search f_l">
                					<form  action="" method="get">
                						账号
                						<input class="small" name="account" type="text" value="${param.account?default("")}">
                						昵称
                						<input class="small" name="nickName" type="text" value="${param.nickName?default("")}">
                						状态
                						<select class="auto" name="status" value="${param.status?default("")}" id="status_select">
                						    <option value="">全部</option>
                							<option value="normal">正常</option>
                							<option value="block">禁用</option>
                						</select>
                						角色
                						<select class="auto" name="roleId" value="${param.roleId?default("")}" id ="role_select">
                						    <option value="">全部</option>
                							<option value="admin">管理员</option>
                							<option value="user">普通账号</option>
                						</select>
                						<button class="btn" type="submit"><span class="sch">搜 索</span></button>
                					</form>
                				</div>
                			</div>
                        <div class="content" style="min-height: 200px;">
                            <table class="list_table" style="font-size:13px;">
                                <thead>
                                    <tr style="height:30px;">
                                        <th width="140px">id</th>
                                        <th width="340px">账号</th>
                                        <th width="150px">昵称</th>
                                        <th width="180px">角色</th>
                                        <th width="180px">状态</th>

                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <#list userList as user>
                                    <tr>
                                        <td>${user.id?c}</td>

                                        <td>${user.account}</td>

                                        <td>${user.nickName}</td>
                                        <td>${user.role_id?default("管理员")}</td>
                                        <td>${user.status?default("")}<#if user.status?default("") = "block">  已禁用 <#else> 正常  </#if>  </td>

                                        <td>
                                            <a href="#" onclick="resetPasswordInput(${user.id?c})">重置密码</a><span>|</span>
                                            <#if user.status?default("") = "block">
                                                <a href="javascript:void(0)" onclick="activation(${user.id?c})">恢复用户</a>
                                            <#else>
                                                <a href="javascript:void(0)" onclick="setUserBlock(${user.id?c})">禁用用户</a>
                                            </#if>

                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>

                        </div>


                	${pageDiv}
                </div>
            </div>
        </div>

		


		</div>

	</div>

	<script type="text/javascript">
		//DOM加载完毕执行
		$(document).ready(function(){
			$("#left_menu_welcome").addClass("selected");
			$("#status_select").val("${param.status?default("")}");
			$("#role_select").val("${param.roleId?default("")}");

		});
	</script>
<script type="text/javascript" charset="UTF-8" src="/cms/script/user.js"></script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div></body></html>