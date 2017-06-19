$(document).ready(function () {
     reloadCounts();
     isLiked();
     submitRead();
});

function reloadCounts(){
  var url = $("#counts-url").val();
  var data_send = {};
  var count_request =$.ajax({
     type: 'get',
     url: url,
     data: data_send,
     dataType: 'json'
  });

  count_request.fail(function( jqXHR, textStatus ) {
    if(jqXHR.status==401){
       //openWeiboLogin();

    }
  });

  count_request.done(function(data) {
      $("#click-count").text(data.clickCount);
      $("#like-count").text(data.likeCount);
      $("#comment-count").text(data.commentCount);
  });
}

function isLiked() {
    var url = $("#like-url").val();
    var data_send = {};
    var like_request =$.ajax({
     type: 'get',
     url: url,
     data: data_send,
     dataType: 'json'
    });

    like_request.fail(function( jqXHR, textStatus ) {
    if(jqXHR.status==401){
       //openWeiboLogin();

    }
    });

    like_request.done(function(data) {
      if (data.ok) {
         $("#like-img-btn").attr("src","/web/images/zan_icon1.png");
         $("#like-img-btn").removeClass("pointer");
      }
    });
}

$(document).ready(function () {
    $("#like-img-btn").click(function (){
        if ($(this).hasClass("pointer")) {
            submitLike();
        }
    });
});

function submitLike(){

     var url = $("#like-url").val();
     var data_send = {};
     var like_request =$.ajax({
      type: 'post',
      url: url,
      data: data_send,
      dataType: 'json'
     });

     like_request.fail(function( jqXHR, textStatus ) {
     if(jqXHR.status==401){
        //openWeiboLogin();

     }
     });

     like_request.done(function(data) {
       if (data.ok) {
          $("#like-img-btn").attr("src","/web/images/zan_icon1.png");
          $("#like-img-btn").removeClass("pointer");
          $("#like-count").text(parseInt($("#like-count").text()) + 1);
       } else {
           toLogin();

       }
     });
}

function submitRead(){
    var url = $("#read-url").val();
    var data_send = {};
    var read_request =$.ajax({
        type: 'post',
        url: url,
        data: data_send,
        dataType: 'json'
    });

    read_request.fail(function( jqXHR, textStatus ) {
        if(jqXHR.status==401){
        //openWeiboLogin();

        }
    });

    read_request.done(function(data) {
        //do nothing
    });
}