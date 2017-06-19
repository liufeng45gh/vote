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
                			<div class="position"><span>内容管理</span><span>&gt;</span><span>资讯管理</span><span>&gt;</span><span>资讯列表</span></div>
                			<div class="operating">
                				<div class="search f_l">
                					<form  action="" method="get">
                						标题
                						<input class="easy" name="title" type="text" size="50" value="${title?default("")}">

                						<button class="btn" type="submit"><span class="sch">搜 索</span></button>
                					</form>
                				</div>
                			</div>
                        <div class="content" style="min-height: 200px;">
                            <table class="list_table" style="font-size:13px;">
                                <thead>
                                    <tr style="height:30px;">
                                        <th width="140px" class="t_c">id</th>
                                        <th width="80px">logo</th>
                                        <th width="440px">标题</th>

                                        <th width="80px" class="t_c">分类</th>
                                        <th width="80px" class="t_c">点击量</th>

                                        <th>
                                            操作

                                        </th>

                                    </tr>
                                </thead>
                                <tbody>
                                <#list newsList as news>
                                    <tr >
                                        <td class="t_c">${news.id?default("")}</td>

                                        <td>
                                            <img src="${news.logo?default("")}" style="width:37px;height:37px;"/>
                                        </td>

                                        <td>${news.title?default("")}</td>


                                        <td class="t_c">${news.categoryName?default("")}</td>
                                        <td class="t_c">${news.clickCount?default("")} </td>

                                        <td newsId="${news.id?default("")}">
                                            <a href="#" onclick="return false;" class="to_update">修改</a>
                                            <span>|</span>
                                            <a href="#" onclick="return false;" class="to_delete">删除</a>
                                            <span>|</span>
                                            <a href="/news/${news.id?default("")}/detail" onclick="" target="_blank">查看</a>
                                            <span>|</span>
                                            <a href="#" onclick="return false;" class="to_recommend">推荐到右侧</a>
                                            <span>|</span>
                                            <a href="#" onclick="return false;" class="to_index">推荐到首页</a>


                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>

                        </div>
                        <input type="hidden" id="update-url" value="/cms/news/{id}/update"/>
                        <input type="hidden" id="delete-url" value="/cms/news/{id}/delete"/>
                        <input type="hidden" id="recommend-url" value="/cms/news/recommend/add"/>
                        <input type="hidden" id="index-url" value="/cms/index/recommend/news-add"/>

                	${pageDiv}
                </div>
            </div>
        </div>

		


		</div>

	</div>

	<script type="text/javascript">
		//DOM加载完毕执行
		$(document).ready(function(){
			$("#left_menu_news_list").addClass("selected");
		});
	</script>
<script type="text/javascript" charset="UTF-8" src="/cms/script/hfc/news/news_list.js"></script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div></body></html>