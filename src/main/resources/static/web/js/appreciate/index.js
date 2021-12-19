$(document).ready(function(){
    $(".vote-btn").click(function () {
//        layer.msg('投票已结束!', {icon: 5});
//        return;
        var appreciateId = $(this).parent().attr("objectId");
        var url = "/vote/submit";
        var data_send = {};
        data_send.appreciateId = appreciateId;
        data_send.random = Math.random();
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
              reloadVoteCount();
           },5);
        });
    });

});

function openWxLogin(){
    //alert(1);
  var lineLink = window.location.href;
  if(lineLink.indexOf("?") != -1)
  {
      lineLink = lineLink.split("?")[0];
      console.log(lineLink);
  }
    setSessionCookie("login_redirect_url",lineLink);
    window.location.href = "/wx/login?random="+Math.random();
}

function reloadVoteCount(){
    var lineLink = window.location.href;
     if (lineLinkindexOf("/appreciate/by-category/")>0) {
        $("#all-vote-count").text($("#all-vote-count").text() + 1);
     }else{
           if(lineLink.indexOf("?") != -1)
           {
               lineLink = lineLink.split("?")[0];
               console.log(lineLink);
           }
         window.location.href = lineLink+"?random=" + Math.random();
     }

}