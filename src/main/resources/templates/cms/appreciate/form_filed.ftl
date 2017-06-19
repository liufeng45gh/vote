<table class="table_new" style="width:100%">
    <tbody>
    <tr><th width="20%"></th><td><span style="color:${KEY_RESULT_MESSAGE_COLOR?default("")};">${KEY_RESULT_MESSAGE?default("")}</span></td></tr>
    <tr>
        <th width="20%" style="text-align:right;">标题:</th>
        <td><input id="title_input" class="form-control" name="title" style="display:inline-block;" value="${entity.title?default("")}" /><label id="title_input_info" style="display:inline-block;">* 标题</label></td>
    </tr>
    <tr>
        <th width="20%" style="text-align:right;">logo:</th>
        <td>
            <div class="logo_outer">
                <input type="file" class="addLogoInput" id="up_file" style="width:158px;"/>
                <img width="100%" height="100%" src="${entity.logo?default("")}" id="logo_cover"/>
                <input type="hidden" id="logo_hidden" name="logo" value="${entity.logo?default("")}"/>
            </div>
        </td>
    </tr>
    <tr>
        <th width="20%" style="text-align:right;">logo宽:</th>
        <td>
            <input id="l_width_input" class="form-control" name="lWidth" style="display:inline-block;" value="${entity.lWidth?default("")}" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <th width="20%" style="text-align:right;">logo高:</th>
        <td>
            <input id="l_height_input" class="form-control" name="lHeight" style="display:inline-block;" value="${entity.lHeight?default("")}" readonly="readonly"/>
        </td>
    </tr>
    <tr>
        <th width="20%" style="text-align:right;">置顶:</th>
        <td>
            <input id="top_input" class="form-control" name="top" style="display:inline-block;" value="${entity.top?default("0")}" />
        </td>
    </tr>
    <tr>
        <th width="20%" style="text-align:right;">分类:</th>
        <td>
            <select id="category_input"  class="form-control" style="display:inline-block;width:280px;" name="categoryId" >
                <option value="">请选择</option>
                <#list appreciateCategoryList as category>
                <option value="${category.id}">${category.name}</option>
                </#list>
            </select>
            <label id="category_input_info" style="display:inline-block;">* 分类</label>
        </td>
    </tr>

    <tr>
        <th width="20%" style="text-align:right;">作者:</th>
        <td>
            <input id="author_input" class="form-control" name="author" style="display:inline-block;" value="${entity.author?default("")}" />
        </td>
    </tr>


    <tr>
    <th width="20%" style="text-align:right;">发布时间:</th>
    <td><input id="publish_at_input"  class="form-control" name="publishAt" style="display:inline-block;" value="${(entity.publishAt?string("yyyy-MM-dd HH:mm:ss"))!}"/></td>
    </tr>

    <tr>
        <th width="20%" style="text-align:right;">摘要:</th>
        <td>
            <textarea id="summary_area" cols="130" rows="8" name="summary" >${entity.summary?default("")?html}</textarea>
        </td>
    </tr>

    <tr>
        <th width="20%" style="text-align:right;">详情:</th>
        <td>


            <textarea id="editor" style="width:1024px;height:500px;" name="content">${entity.content?default("")?html}</textarea>

        </td>
    </tr>

    <tr>
        <th></th>
        <td>
            <div class="btn btn-primary" id="submit-btn" >保存</div>
            <input type="hidden" name="id" value="${entity.id?default("")}"/>
        </td>
    </tr>
</tbody>
</table>

<script>
$(document).ready(function () {
    $('#publish_at_input').datetimepicker({
         showSecond: true,
         timeFormat: 'hh:mm:ss'
    });
});

</script>
