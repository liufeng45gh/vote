<html>
<head>
    <title>后台管理</title>
    <#include "../common_header.ftl"/>
</head>
<body>

<div class="content form_content" >

    <div class="position"><span>修改分类</span></div>

        <table class="table_new">
            <tbody>
            <tr><th width="20%"></th><td><span style="color:${KEY_RESULT_MESSAGE_COLOR?default("")};">${KEY_RESULT_MESSAGE?default("")}</span></td></tr>
            <tr>
                <th width="20%" style="text-align:right;">分类id:</th>

                <td>${entity.id} <input type="hidden" name="id" value="${entity.id}" id="category-id"/></td>

            </tr>
            <tr>
                <th width="20%" style="text-align:right;">分类名称:</th>
                <td><input id="name_input"  class="form-control" name="name" style="display:inline-block;" value="${entity.name}" /><label id="name_input_info" style="display:inline-block;">* 分类名称</label></td>
            </tr>
            <tr>
                <th width="20%" style="text-align:right;">图标:</th>
                <td><input id="icon_input"  class="form-control" name="icon" style="display:inline-block;" value="${entity.icon}" /><label id="icon_input_info" style="display:inline-block;">* 图标</label></td>
            </tr>
            <tr>
                <th width="20%" style="text-align:right;">排序:</th>
                <td><input id="top_input"  class="form-control" name="top" style="display:inline-block;" value="${entity.top}"/><label id="top_input_info" style="display:inline-block;">* 排序</label></td>
            </tr>


            <tr>
                <th></th>
                <td>
                    <button class="btn btn-primary" type="button" id ="update-submit" >保存</button>
                    <input type="hidden" id="update-submit-url" value="/cms/appreciate/category/update"/>
                </td>
            </tr>
        </tbody>
    </table>
</div>


</body>
<script type="text/javascript" charset="UTF-8" src="/cms/script/hfc/appreciate/category.js"></script>
</html>