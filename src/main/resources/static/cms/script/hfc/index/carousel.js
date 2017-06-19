function checkFiled(){
    var title=$("#title_input").val();
    if(title.trim()==""){
        $("#title_input_info").css("color","red");
        $("#title_input_info").html("* 标题必须填写");
        return false;
    }else{
        $("#title_input_info").css("color","auto");
        $("#title_input_info").html("* 标题");
    }
    var top=$("#top_input").val();
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
    $(".to-delete").click(function () {
        var objectId = $(this).parent().attr("objectId");
        layer.confirm('确认删除？', {
          btn: ['取消','确认'] //按钮
        }, function(index){
          layer.close(index);
        }, function(){
            deleteObject(objectId);
        });
    });
});

function deleteObject(objectId) {
     var data_send = {};
     data_send.id = objectId;
     var delete_url = $("#delete-url").val();
     var delete_request =$.ajax({
           type: 'post',
           url: delete_url,
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
    $(".to-update").click(function () {
        var objectId = $(this).parent().attr("objectId");
        var url = $("#update-url").val();
        url = url.replace("{id}",objectId);
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
    $("#submit-btn").click(function () {
        var allCheck = checkFiled();
       if (allCheck) {
           $("#hfc-form").ajaxSubmit(function(data){
               layer.alert('修改成功!', {
                 closeBtn: 0
               }, function(){
                 window.parent.location.reload();
                 //layer.prompt("dsfssadsd");
               });

           });
       }
    });
});