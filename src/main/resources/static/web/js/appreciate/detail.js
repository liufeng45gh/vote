$(document).ready(function () {
    $("#comment-area").blur(function () {
        if ($("#comment-area").text()=="") {
            $("#comment-area").text("写下您的评论");
        }
    });

    $("#comment-area").focus(function(){
       if ($("#comment-area").text()=="写下您的评论") {
            $("#comment-area").text("");
        }
    });
    $("#c-submit").click(function () {
        var appreciateId = $("#appreciateId").val();
        var content = $("#comment-area").text();
        if (isEmpty(content) || content == "写下您的评论") {
            layer.msg("评论内容不能为空");
            return;
        }
         var data_send = {};
         data_send.appreciateId = appreciateId;
         data_send.content = content;
         var url = $("#post-comment-url").val();

         var comment_request =$.ajax({
            type: 'post',
            url: url,
            data: data_send,
            dataType: 'json'
         });

         comment_request.fail(function( jqXHR, textStatus ) {
           if(jqXHR.status==401){
              //openWeiboLogin();

           }
         });

         comment_request.done(function(data) {
             if (data.ok) {
                layer.msg("评论已提交");
                window.location.reload();
                return;
             }else {
                 toLogin();
             }
         });
    });
});

