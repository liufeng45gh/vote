$(document).ready(function(){
    $(".vote-btn").click(function () {
        var appreciateId = $(this).parent().attr("objectId");
        var url = "/vote/submit";
        var data_send = {};
        data_send.appreciateId = appreciateId;

        var count_request =$.ajax({
         type: 'post',
         url: url,
         data: data_send,
         dataType: 'json'
        });

        count_request.fail(function( jqXHR, textStatus ) {
            if(jqXHR.status==401){
               openWxLogin();
            }

            if(jqXHR.status==410){
               layer.msg('重复投票!', {icon: 5});
            }
        });

        count_request.done(function(data) {
      
            layer.msg('投票成功!', {icon: 1});
           setTimeout(function(){
             window.location.href = "/appreciate/index?random=" + Math.random();
           },5);
        });
    });

});

function openWxLogin(){
    //alert(1);
    var webHref = window.location.href;
    var pos = webHref.indexOf('/');
    //location.href=webHref.substring(0,pos);
    //var lineLink = "http://vote.dbdbd.cn/appreciate/index";
    var login_redirect_url = webHref.substring(0,pos);
    setSessionCookie("login_redirect_url",login_redirect_url);
    window.location.href = "/wx/login?random="+Math.random();
}