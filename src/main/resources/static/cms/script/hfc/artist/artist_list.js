$(document).ready(function() {
    $(".to_update").click(function() {
        var objectId = $(this).parent().attr("objectId");
        var url = $("#update-url").val();
        url = url.replace("{id}",objectId);
        layer.open({
          type: 2,
          area: ['80%', '80%'],
          fixed: false, //不固定
          maxmin: true,
          content: url
        });
    });

    $(".to_delete").click(function() {
        var objectId = $(this).parent().attr("objectId");

        layer.confirm('确定要删除吗？', {
          btn: ['取消','确定'] //按钮
        }, function(){
          layer.closeAll();
        }, function(){
          deleteArtistSubmit(objectId);
        });
    });

    $(".to_recommend").click(function() {
        var objectId = $(this).parent().attr("objectId");

        layer.confirm('确定推荐？', {
          btn: ['取消','确定'] //按钮
        }, function(){
          layer.closeAll();
        }, function(){
          recommendArtistSubmit(objectId);
        });
    });

    $(".to_index").click(function() {
        var objectId = $(this).parent().attr("objectId");

        layer.confirm('确定推荐？', {
          btn: ['取消','确定'] //按钮
        }, function(){
          layer.closeAll();
        }, function(){
          indexObjectSubmit(objectId);
        });
    });
});

function deleteArtistSubmit(objectId){
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

function recommendArtistSubmit(objectId) {
    var url = $("#recommend-url").val();
    //url = url.replace("{id}",newsId);
    var data_send = {};
    data_send.artistId = objectId;
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
           layer.alert('推荐成功!', {
             closeBtn: 0
           }, function(){
             window.location.reload();
             //layer.prompt("dsfssadsd");
           });
    });

}

function indexObjectSubmit(objectId){

 var url = $("#index-url").val();
    //url = url.replace("{id}",newsId);
    var data_send = {};
    data_send.targetId = objectId;
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
           layer.alert('推荐成功!', {
             closeBtn: 0
           }, function(){
             window.location.reload();
             //layer.prompt("dsfssadsd");
           });
    });
}