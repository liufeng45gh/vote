function changeCaptcha(){
	document.getElementById("captchaImg").src="/captcha-image?"+Math.random();
}
function toLogin(){
	window.location.href="/account/login";
}
function checkTelephone(telephone){
	if(telephone.trim()==""){
		$("#check_message").css("color","red");
		$("#check_message").html("手机不能为空");
		return false;
	}
	var filter =  /1[3-8]+\d{9}/; 
	if(!filter.test(telephone)){
		$("#check_message").css("color","red");
		$("#check_message").html("手机号码填写不正确 ");
		return false;
	}
	var data_send = {};
	data_send.telephone = telephone;
	data_send.random = Math.random();
	
	var check_result = false;
	var request =$.ajax({
        type: 'post',
        url: '/account/check_have_telephone.json',
        data: data_send,
        dataType: 'json',
        async:false
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
       check_result = false;
    });

    request.done(function(data) {
         //check_result = true;
         if(data.ok){
        	 check_result = true;
         }else{
        	 check_result = false;
        	 $("#check_message").css("color","red");
     		$("#check_message").html('你的手机尚未注册,请检查是否拼写错误,如需注册请点击 &nbsp;<a href="/account/register">注册</a>');
         }
    });
    
    return check_result;
	
}
$("#telephone_input").blur(function(){
	checkTelephone(this.value);
});

function checkActiveCode(code){
	if(code.trim()==""){
		$("#check_message").css("color","red");
		$("#check_message").html("验证码不能为空");
		return false;
	}
	return true;
}
$("#send_message_button").click(function (){
	if(!checkTelephone($("#telephone_input").val())){
		return;
	}
	if(!checkActiveCode($("#check_input").val())){
		return;
	}
	var data_send = {};
	data_send.telephone = $("#telephone_input").val();
	data_send.random = Math.random();
	data_send.check_code = $("#check_input").val();
	var request =$.ajax({
        type: 'post',
        url: '/account/send_password.json',
        data: data_send,
        dataType: 'json',
        async:false
    });

    request.fail(function( jqXHR, textStatus ) {
      
    });

    request.done(function(data) {
    	if(data.ok){
    		alert("登录密码已发送到手机 请注意查收");
    	}else{
    		$("#check_message").css("color","red");
    		$("#check_message").html(data.message);
    	}
    	
    });
});