function resetPasswordInput(id){
    layer.prompt({
      title: '给账号输入新密码，并确认',
      formType: 0 //prompt风格，支持0-2
    }, function(pass){
     resetPasswordSubmit(id,pass);
    });
}

function resetPasswordSubmit(id,pass){
    var data_send = {};
    data_send.id = id;
    data_send.password = pass;
    //alert(data_send.id);
    //alert(data_send.password);

     var pass_request =$.ajax({
           type: 'post',
           url: '/cms/user/up-user-pass',
           data: data_send,
           dataType: 'json'
        });

     pass_request.fail(function( jqXHR, textStatus ) {
          if(jqXHR.status==401){
             //openWeiboLogin();

          }
        });

     pass_request.done(function(data) {
         layer.closeAll('prompt');
         layer.alert("密码已从新设定",
           {
             skin: 'layui-layer-molv' //样式类名
             ,closeBtn: 0
           } ,
            function(){
                window.location.reload();
            }
          );

        });
}

function activation(id){
    setUserStatus(id,"normal");
}

function setUserBlock(id){
    setUserStatus(id,"block");
}

function setUserStatus(id,status){
   var data_send = {};
    data_send.id = id;
    data_send.status = status;
    //alert(data_send.id);
    //alert(data_send.password);

     var status_request =$.ajax({
           type: 'post',
           url: '/cms/user/set-status',
           data: data_send,
           dataType: 'json'
        });

     status_request.fail(function( jqXHR, textStatus ) {
          if(jqXHR.status==401){
             //openWeiboLogin();

          }
        });

     status_request.done(function(data) {
         layer.closeAll('prompt');
         layer.alert("状态已从新设定",
           {} ,
            function(){
                window.location.reload();
            }
          );

        });
}