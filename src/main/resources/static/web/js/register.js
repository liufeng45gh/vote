$(document).ready(function () {
    $("#send-code-btn").click(function () {
        var phone = $("#phone-input").val();
        if (isEmpty(phone)) {
            layer.msg("手机号码不能为空", {icon: 5});
            return;
        }
        if (!validMobileFormat(phone)) {
            layer.msg("手机号码校验错误", {icon: 5});
            return;
        }
        var imgCode = $("#img-check-input").val();
        if (isEmpty(imgCode)||imgCode.length != 4) {
            layer.msg("图片验证码输入有误", {icon: 5});
            return;
        }
        var data_send = {};
        data_send.phone = phone;
        data_send.imgCode = imgCode;
        data_send.random = Math.random();


        var request =$.ajax({
            type: 'post',
            url: '/account/send-check-code.json',
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
                  layer.msg("已发送");
                  startLoopTimer();
             }else{
                 //check_result = false;
                layer.msg(data.message);
             }
        });
    });
});
var timeWaite = 120;
var loopPointer;
function startLoopTimer(){
    var timeWaite = 120;
    $("#btn-message").show();
    $("#send-code-btn").hide();
    loopPointer = setInterval(loopTimer,1000);
}

function loopTimer() {
    timeWaite--;
    var message = timeWaite + "秒可重发";
    $("#btn-message").text(message);
    if (timeWaite <= 0) {
         $("#btn-message").hide();
         $("#send-code-btn").show();
        clearInterval(loopPointer);
    }
}

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
        var phoneCode = $("#phone-check-input").val();
        if (isEmpty(phoneCode)||phoneCode.length != 4) {
            layer.msg("手机验证码输入有误", {icon: 5});
            return;
        }
        var password = $("#pass-input").val();
        if (isEmpty(password)||password.length < 6) {
            layer.msg("密码长度不能小于6位", {icon: 5});
            return;
        }
        var data_send = {};
        data_send.phone = phone;
        data_send.phoneCode = phoneCode;
        data_send.password = password;
        data_send.random = Math.random();


        var request =$.ajax({
            type: 'post',
            url: '/register',
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
                 setSessionCookie("token",data.data.token);
                 layer.msg("注册成功!");
                  //setSessionCookie("token",data.data.token);
                 window.parent.location.reload();
             }else{
                 //check_result = false;
                layer.msg(data.message);
             }
        });
    });
});