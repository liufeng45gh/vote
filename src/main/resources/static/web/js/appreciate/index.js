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
        });

        count_request.done(function(data) {
      
            layer.msg('投票成功!', {icon: 1});
           setTimeout(function(){
             window.location.reload();
           },5);
        });
    });

});

function openWxLogin(){
    //alert(1);
    window.location.href = "/wx/login?random="+Math.random();
}