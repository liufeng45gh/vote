$(document).ready(function (){
     clearMessageCount();
});

function clearMessageCount() {
     var data_send = {};

     var mc_request =$.ajax({
         type: 'post',
         url: '/u-center/clear-message-count',
         data: data_send,
         dataType: 'json'
     });

     mc_request.fail(function( jqXHR, textStatus ) {
         if(jqXHR.status==401){
           //openWeiboLogin();

         }
     });

     mc_request.done(function(data) {
      if (data.ok) {
         $("#message-status").hide();
         return;
      }
     });
}