$(document).ready(function() {
    $(".to_update").click(function() {
        var recommendId = $(this).parent().attr("recommendId");

        layer.prompt({title: '输入新的置顶值，并确认', formType: 1}, function(top, index){
            layer.close(index);
            updateRecommendSubmit(recommendId,top);
        });
    });

    $(".to_delete").click(function() {
        var recommendId = $(this).parent().attr("recommendId");

        layer.confirm('确定要删除吗？', {
          btn: ['取消','确定'] //按钮
        }, function(){
          layer.closeAll();
        }, function(){
          deleteRecommendSubmit(recommendId);
        });
    });


});

function deleteRecommendSubmit(recommendId){
    var url = $("#delete-url").val();
    url = url.replace("{id}",recommendId);
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

function updateRecommendSubmit(recommendId,top){
        var url = $("#update-url").val();

        var data_send = {};
        data_send.top = top;
        data_send.id = recommendId;
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

