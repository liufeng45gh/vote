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
                			<div class="position"><span>内容管理</span><span>&gt;</span><span>资讯管理</span><span>&gt;</span><span>资讯分类</span></div>

                        <div class="content" style="min-height: 200px;">
                            <table class="list_table" style="font-size:13px;">
                                <thead>
                                    <tr style="height:30px;">
                                        <th width="140px">id</th>
                                        <th width="340px">分类名称</th>
                                        <th width="150px">排序</th>


                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <#list newsCategoryList as category>
                                    <tr>
                                        <td>${category.id?default("")}</td>

                                        <td>${category.name}</td>

                                        <td>${category.top}</td>


                                        <td categoryId="${category.id}">
                                            <a href="#" class="category-update" onclick="">修改</a>
                                            <span>|</span>
                                            <a href="#" class="category-delete">删除</a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>

                        </div>

                    <div class="content form_content" >

                        <div class="position"><span>添加新分类</span></div>
                        <form action="/cms/news/category/add" method="post">
                            <table class="table_new" style="width:50%">
                                <tbody>
                                <tr><th width="20%"></th><td><span style="color:${KEY_RESULT_MESSAGE_COLOR?default("")};">${KEY_RESULT_MESSAGE?default("")}</span></td></tr>
                                <tr>
                                    <th width="20%" style="text-align:right;">分类名称:</th>
                                    <td><input id="name_input"  class="form-control" name="name" style="display:inline-block;" /><label id="name_input_info" style="display:inline-block;">* 分类名称</label></td>
                                </tr>
                                <tr>
                                    <th width="20%" style="text-align:right;">排序:</th>
                                    <td><input id="top_input"  class="form-control" name="top" style="display:inline-block;" value="0"/><label id="top_input_info" style="display:inline-block;">* 排序</label></td>
                                </tr>


                                <tr>
                                    <th></th>
                                    <td>
                                        <button class="btn btn-primary" type="submit" onclick="return checkFiled();">保存</button>
                                        <input type="hidden" id="update-url" value="/cms/news/category/{id}/update"/>
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

	</div>

	<script type="text/javascript">
		//DOM加载完毕执行
		$(document).ready(function(){
			$("#left_menu_news_category").addClass("selected");


		});
	</script>
<script type="text/javascript" charset="UTF-8" src="/cms/script/hfc/news/category.js"></script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div></body></html>