function checkFiled(){
    var name=$("#name").val();
    if(name.trim()==""){
        $("#name_input_info").css("color","red");
        $("#name_input_info").html("* 分类名称必须填写");
        return false;
    }else{
        $("#name_input_info").css("color","auto");
        $("#name_input_info").html("* 分类名称");
    }
    var top=$("#top").val();
    if(top.trim()==""){
        $("#top_input_info").css("color","red");
        $("#top_input_info").html("* 排序必须填写");
        return false;
    }else{
         $("#top_input_info").css("color","auto");
         $("#top_input_info").html("* 排序");
    }

    return true;
}

$(document).ready(function () {
    $(".category-delete").click(function () {
        var categoryId = $(this).parent().attr("categoryId");
        layer.confirm('确认删除？', {
          btn: ['取消','确认'] //按钮
        }, function(index){
          layer.close(index);
        }, function(){
            deleteCategory(categoryId);
        });
    });
});

function deleteCategory(categoryId) {
     var data_send = {};
     data_send.id = categoryId;
     var delete_request =$.ajax({
           type: 'post',
           url: '/cms/summit/category/delete',
           data: data_send,
           dataType: 'json'
        });

     delete_request.fail(function( jqXHR, textStatus ) {
          if(jqXHR.status==401){
             //openWeiboLogin();

          }
        });

     delete_request.done(function(data) {
                window.location.reload();
        });
}

$(document).ready(function () {
    $(".category-update").click(function () {
        var categoryId = $(this).parent().attr("categoryId");
        var url = $("#update-url").val();
        url = url.replace("{id}",categoryId);
        layer.open({
          type: 2,
          area: ['700px', '530px'],
          fixed: false, //不固定
          maxmin: true,
          content: url
        });
    });
});


$(document).ready(function () {
    $("#update-submit").click(function () {
        var categoryId = $("#category-id").val();
        var url = $("#update-submit-url").val();
        var data_send = {};
        data_send.id = categoryId;
        data_send.name = $("#name_input").val();
        data_send.top = $("#top_input").val();
        var update_request =$.ajax({
           type: 'post',
           url: url,
           data: data_send,
           dataType: 'json'
        });

        update_request.fail(function( jqXHR, textStatus ) {
          if(jqXHR.status==401){
             //openWeiboLogin();

          }
        });

        update_request.done(function(data) {
                window.parent.location.reload();
        });
    });
});