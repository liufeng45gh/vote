$(document).ready(function () {
    $("#btn-news-re-import").click(function () {
        layer.confirm('确定要重新导入吗？', {
          btn: ['取消','确定'] //按钮
        }, function(){
          layer.closeAll();
        }, function(){
           var url = $("#news-url").val();
           searchReImport(url);
        });

    });

    $("#btn-artist-re-import").click(function () {
        layer.confirm('确定要重新导入吗？', {
          btn: ['取消','确定'] //按钮
        }, function(){
          layer.closeAll();
        }, function(){
           var url = $("#artist-url").val();
           searchReImport(url);
        });

    });

     $("#btn-appreciate-re-import").click(function () {
        layer.confirm('确定要重新导入吗？', {
          btn: ['取消','确定'] //按钮
        }, function(){
          layer.closeAll();
        }, function(){
           var url = $("#appreciate-url").val();
           searchReImport(url);
        });

    });
});

function searchReImport(url){
    var data_send = {};

    var import_request =$.ajax({
       type: 'post',
       url: url,
       data: data_send,
       dataType: 'json'
    });

    import_request.fail(function( jqXHR, textStatus ) {
      if(jqXHR.status==401){
         //openWeiboLogin();

      }
    });

    import_request.done(function(data) {
            layer.alert('执行成功!', {
              closeBtn: 0,
              offset: [$(window).height()/2-100+'px', $(window).width()/2-100+'px']
            }, function(){
              //window.location.reload();
              //layer.prompt("dsfssadsd");
              layer.closeAll();
            });
    });
}