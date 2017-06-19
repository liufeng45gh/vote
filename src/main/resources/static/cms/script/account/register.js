


function checkNick(nick){
	if(nick.trim()==""){
		$("#check_message").css("color","red");
		$("#check_message").html("昵称不能为空");
		return false;
	}
	//var filter = new RegExp("[A-Za-z0-9\u4E00-\u9FA5]");
	var filter =  /^[\u4E00-\u9FA5a-zA-Z0-9]{1,20}$/; 
	if(!filter.test(nick)){
		$("#check_message").css("color","red");
		$("#check_message").html("昵称只能是[1-20]汉子 英文 数字 ");
		return false;
	}
	var data_send = {};
	data_send.nick = nick;
	data_send.random = Math.random();
	
	var check_result = true;
	var request =$.ajax({
        type: 'post',
        url: '/account/check_nick.json',
        data: data_send,
        dataType: 'json',
        
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
     		$("#check_message").html("昵称已被占用 ");
         }
    });
    
    return check_result;
}

$("#account_input").blur(function(){
	if(checkNick($(this).val())){
		$("#check_message").css("color","green");
		$("#check_message").html("昵称可用");
	}
	
});

function checkPassword(password){
	if(password.trim()==""){
		$("#check_message").css("color","red");
		$("#check_message").html("密码不能为空");
		return false;
	}
	var filter =  /^[a-zA-Z0-9]{6,10}$/; 
	if(!filter.test(password)){
		$("#check_message").css("color","red");
		$("#check_message").html("密码只能是[6-10]英文 数字 ");
		return false;
	}
	return true;
}


function checkActiveCode(code){
	if(code.trim()==""){
		$("#check_message").css("color","red");
		$("#check_message").html("激活码不能为空");
		return false;
	}
	return true;
}




$("#regist_button").click(function(){
	if(!checkNick($("#account_input").val())){
		return;
	}
	if(!checkPassword($("#password_input").val())){
		return;
	}
	
	if(!checkActiveCode($("#code_input").val())){
		return;
	}
	var data_send = {};
	data_send.account = $("#account_input").val();
	data_send.nick = data_send.account;
	data_send.password = $("#password_input").val();
	
	data_send.check_code = $("#code_input").val();
	//data_send.type
	data_send.random = Math.random();
	
	var request =$.ajax({
        type: 'post',
        url: '/account/register.json',
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
        	 alert("注册成功");
        	 window.location.href="/";
         }else{
        	 
        	 $("#check_message").css("color","red");
     		$("#check_message").html(data.message);
         }
    });
});


