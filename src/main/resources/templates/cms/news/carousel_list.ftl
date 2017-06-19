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
                    <div class="position"><span>首页管理</span><span>&gt;</span><span>轮播图</span><span>&gt;</span><span>列表</span></div>

                    <div class="content" style="min-height: 200px;">
                        <table class="list_table" style="font-size:13px;">
                            <thead>
                            <tr style="height:30px;">
                                <th width="140px">id</th>
                                <th width="400px">图片</th>
                                <th width="150px">排序</th>
                                <th width="150px">标题</th>
                                <th width="150px">link</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list carouselList as carousel>
                                <tr>
                                    <td>${carousel.id?default("")}</td>

                                    <td>
                                        <img src="${carousel.logo?default("")}" style="width:400px;height:189px;"/>
                                    </td>

                                    <td>${carousel.top?default("")}</td>
                                    <td>${carousel.title?default("")}</td>
                                    <td>${carousel.link?default("")}</td>


                                    <td objectId="${carousel.id}">
                                        <a href="#" class="to-update" onclick="">修改</a>
                                        <span>|</span>
                                        <a href="#" class="to-delete">删除</a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>

                    </div>

                    <div class="content form_content" >

                        <div class="position"><span>添加新轮播图</span></div>
                        <form action="/cms/news/carousel/add" method="post"  id="hfc-form">
                            <table class="table_new" >
                                <tbody>
                                <tr><th width="20%"></th><td><span style="color:${KEY_RESULT_MESSAGE_COLOR?default("")};">${KEY_RESULT_MESSAGE?default("")}</span></td></tr>

                                <tr>
                                    <th width="20%" style="text-align:right;">logo:</th>
                                    <td>
                                        <div class="logo_outer" style="width:400px;height:189px;">
                                            <input type="file" class="addLogoInput" id="up_file" style="width:400px;"/>
                                            <img width="100%" height="100%" src="${entity.logo?default("")}" id="logo_cover"/>
                                            <input type="hidden" id="logo_hidden" name="logo" value="${entity.logo?default("")}"/>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th width="20%" style="text-align:right;">标题:</th>
                                    <td><input id="title_input"  class="form-control" name="title" style="display:inline-block;" /><label id="title_input_info" style="display:inline-block;">* 标题</label></td>
                                </tr>
                                <tr>
                                    <th width="20%" style="text-align:right;">link:</th>
                                    <td><input id="link_input"  class="form-control" name="link" style="display:inline-block;" /><label id="link_input_info" style="display:inline-block;">* link</label></td>
                                </tr>
                                <tr>
                                    <th width="20%" style="text-align:right;">排序:</th>
                                    <td><input id="top_input"  class="form-control" name="top" style="display:inline-block;" value="0"/><label id="top_input_info" style="display:inline-block;">* 排序</label></td>
                                </tr>
                                <tr>
                                    <th width="20%" style="text-align:right;">摘要:</th>
                                    <td>
                                        <textarea id="summary_area" cols="80" rows="8" name="summary" >${entity.summary?default("")?html}</textarea>
                                    </td>
                                </tr>


                                <tr>
                                    <th></th>
                                    <td>
                                        <button class="btn btn-primary" type="submit" onclick="return checkFiled();">保存</button>
                                        <input type="hidden" id="update-url" value="/cms/news/carousel/{id}/update"/>
                                        <input type="hidden" id="delete-url" value="/cms/news/carousel/delete"/>
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
			$("#left_menu_carousel").addClass("selected");
		});
	</script>
<script type="text/javascript" charset="UTF-8" src="/cms/script/hfc/index/carousel.js"></script>
<script type="text/javascript" charset="UTF-8" src="/cms/script/hfc/news/logo_select.js"></script>


<div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div></body></html>