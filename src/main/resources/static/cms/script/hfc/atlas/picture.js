function checkFiled(){
    var description=$("#description_input").val();
    if(description.trim()==""){
        $("#description_input_info").css("color","red");
        $("#description_input_info").html("* 描述必须填写");
        return false;
    } else {
        $("#description_input_info").css("color","auto");
         $("#description_input_info").html("* 描述");
    }
    return true;
}
$(document).ready(function () {
    $("#submit-btn").click(function() {
        var allCheck = checkFiled();
        if (allCheck) {
            $("#hfc-form").ajaxSubmit(function(data){
                layer.alert('保存成功!', {
                  closeBtn: 0
                }, function(){
                  window.location.reload();
                  //layer.prompt("dsfssadsd");
                });

            });
        }
    });

       $(".to_delete").click(function() {
            var objectId = $(this).parent().attr("objectId");

            layer.confirm('确定要删除吗？', {
              btn: ['取消','确定'] //按钮
            }, function(){
              layer.closeAll();
            }, function(){
              deletePictureSubmit(objectId);
            });
        });

         $(".to_update").click(function() {
            var objectId = $(this).parent().attr("objectId");
            var url = $("#update-url").val();
            url = url.replace("{id}",objectId);
            window.location.href = url;
        });
});





function deletePictureSubmit(objectId){
    var url = $("#delete-url").val();
    url = url.replace("{id}",objectId);
    var data_send = {};

    var delete_request =$.ajax({
       type: 'post',
       url: url,
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
