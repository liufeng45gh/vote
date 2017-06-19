$(document).ready(function () {
    $("#btn-submit").click(function () {
        var phone = $("#phone-input").val();
        if (isEmpty(phone)) {
            layer.msg("手机号码不能为空", {icon: 5});
            return;
        }
        if (!validMobileFormat(phone)) {
            layer.msg("手机号码校验错误", {icon: 5});
            return;
        }

        var password = $("#pass-input").val();
        if (isEmpty(password)||password.length < 6) {
            layer.msg("密码长度不能小于6位", {icon: 5});
            return;
        }
        var data_send = {};
        data_send.phone = phone;
        data_send.password = password;
        data_send.random = Math.random();


        var request =$.ajax({
            type: 'post',
            url: '/login',
            data: data_send,
            dataType: 'json'
        });

        request.fail(function( jqXHR, textStatus ) {
           //alert("fail");
           //alert(jqXHR.responseText);
           //var result_json = JSON.parse(jqXHR.responseText);
           //alert(result_json.message);
           //$(".tips_for_submit").parent().addClass("check_result_wrong");
           //$(".tips_for_submit").parent().show();
           //$(".tips_for_submit").html(result_json.message);
           //$(".tips_for_submit").show();
            //$("#check_message").css("color","red");
            //$("#check_message").html("昵称已被占用 ");
             layer.msg("系统错误", {icon: 5});
        });

        request.done(function(data) {
             //check_result = true;
             //alert(data);
             if(data.ok){
                 //check_result = true;
                 //window.location.href = "/account/chose_type";
                 delCookie("token");
                  setSessionCookie("token",data.data.token);
                  layer.msg("登录成功!");
                  if (window.top != window.self) {
                    window.parent.location.reload();
                  } else {
                    window.location.href = "/";
                  }

             }else{
                 //check_result = false;
                layer.msg(data.message);
             }
        });
    });
});