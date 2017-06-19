$(function() {
	$(window).scroll(function(){
        if ($(document).scrollTop() <= 80){
            //$("#header").css("background","none");
            $("#header").css("background-color","#333");
            //alert("滚动条已经到达顶部为 80");
        } else{
            $("#header").css("background-color","#333");
        }
	});
});

function toLogin(){
     layer.open({
      type: 2,
      area: ['455px', '470px'],
      fixed: false, //不固定
      maxmin: true,
      content: "/login",
      title: "会员登录"
    });
}

function toRegister(){
 layer.open({
      type: 2,
      area: ['455px', '470px'],
      fixed: false, //不固定
      maxmin: true,
      content: "/register",
      title: "会员注册"
    });
}

$(function() {
	var token = getCookie("token");
	if (isEmpty(token)) {
	    $(".login-nav").show();
	}
	 var data_send = {};
	 data_send.token = token;

	  var user_request =$.ajax({
        type: 'get',
        url: '/token-user',
        data: data_send,
        dataType: 'json'
     });

     user_request.fail(function( jqXHR, textStatus ) {
       if(jqXHR.status==401){
          //openWeiboLogin();

       }
     });

     user_request.done(function(data) {
         if (data.ok) {
            $(".user-nav").show();
            $("#avatar").attr("src",data.data.avatar);
            $("#nick-div").text(data.data.nickName);
            if ( $(".comment-box").length > 0 ) {
                 $("#c-nick-div").text(data.data.nickName);
                 $("#c-avatar").attr("src",data.data.avatar);
            }
            resetMessageUnreadCount();
             return;
         }else {
             $(".login-nav").show();
         }
     });

});

var user_nick_mouse_in = false;
var user_opt_mouse_in = false;

$(function() {

	$(".user-nav").mouseover(function () {
        user_nick_mouse_in = true;
        $(".user-option").show();
	});
	$(".user-option").mouseover(function () {
        user_opt_mouse_in = true;
        $(".user-option").show();
    });

    $(".user-nav").mouseout(function () {
            user_nick_mouse_in = false;
            setTimeout(hideUserOption,1000);
    });
    $(".user-option").mouseout(function () {
        user_opt_mouse_in = false;
        setTimeout(hideUserOption,1000);
    });
});

function hideUserOption(){
    if (user_nick_mouse_in) {
        return;
    }
    if (user_opt_mouse_in) {
        return;
    }
     $(".user-option").hide();
}

function logout() {
    delCookie("token");
    window.location.reload();
}

function resetMessageUnreadCount(){
    var data_send = {};

    var mc_request =$.ajax({
        type: 'get',
        url: '/u-center/message-count',
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
        if (data.data>0) {
            $("#message-status").show();
            $("#message-status").text(data.data);
        } else {
            $("#message-status").hide();
        }
        return;
     }
    });

}




var about_mouse_in = false;
var about_opt_mouse_in = false;

$(function() {

	$("#head-href-about").mouseover(function () {
        about_mouse_in = true;
        $(".about-option").show();
	});
	$(".about-option").mouseover(function () {
        about_opt_mouse_in = true;
        $(".about-option").show();
    });

    $("#head-href-about").mouseout(function () {
            about_mouse_in = false;
            setTimeout(hideAboutOption,1000);
    });
    $(".about-option").mouseout(function () {
        about_opt_mouse_in = false;
        setTimeout(hideAboutOption,1000);
    });
});

function hideAboutOption(){
    if (about_mouse_in) {
        return;
    }
    if (about_opt_mouse_in) {
        return;
    }
     $(".about-option").hide();
}