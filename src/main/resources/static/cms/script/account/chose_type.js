$(".student_teacher").click(function (){
	$(".student_teacher").removeClass("current_select");
	$(this).addClass("current_select");
	if($(this).html().indexOf("student")>0){
		$("#myteacher_left").show();
		$("#myteacher_input").show();
	}else{
		$("#myteacher_left").hide();
		$("#myteacher_input").hide();
	}
});

$("#next_button").click(function(){
	var data_send = {};
	if(!$("#student").hasClass("current_select")&&!$("#teacher").hasClass("current_select")){
		alert("请选择用户类型");
	}
	var is_student = $("#student").hasClass("current_select");
	
	if(is_student){
		data_send.type = "student";
	}else{
		data_send.type = "teacher";
	}
	data_send.random = Math.random();
	var request =$.ajax({
        type: 'post',
        url: '/account/chose_type.json',
        data: data_send,
        dataType: 'json',
        async:false
    });

    request.fail(function( jqXHR, textStatus ) {
     
    });

    request.done(function(data) {
         //check_result = true;
         if(data.ok){
        	 alert("设置成功");
        	 window.location.href="/";
         }else{        	 
        	$("#check_message").css("color","red");
     		$("#check_message").html(data.message);
         }
    });
});