var isLoading = false;
var page = 0;


function nextPage () {
        if (isLoading) {
           return;
        }
        isLoading = true;
        $("#load-more").hide();
        var url = $("#load-more-url").val();
        //url = url.replace("{id}",objectId);
        var data_send = {};
        page++;
        data_send.page = page;


        var more_request =$.ajax({
           type: 'get',
           url: url,
           data: data_send,
           dataType: 'html'
        });

        more_request.fail(function( jqXHR, textStatus ) {
          if(jqXHR.status==401){
             //openWeiboLogin();

          }
        });

        more_request.done(function(data) {
                 if (isEmpty(data)) {
                    return;
                }
                $("#comment-list").append(data);
                clearLoading();
        });

}

function clearLoading(){
   isLoading = false;
   $("#load-more").show();
}

$(document).ready(function () {
    nextPage ();
});


$(function() {
    $("#load-more").click(function () {
       nextPage();
    });

});

function toReplyBak(btn) {
    var offset = $(btn).offset();

    var url = $("#reply-url").val();
     layer.open({
       type: 2,
       area: ['400px', '230px'],
       title: '回复评论' ,
       fixed: false, //不固定
       maxmin: true,
       content: url,
       tips: [1, '#c00'],
       shade: 0
       //scrollbar: false
       //为了演示，取按钮坐标
       //, offset: [ offset.top,offset.left ]
     });
}
var parentId = null;

function toReply(btn){
    parentId = $(btn).attr("parentId");
    var d = dialog({
        title: '回复评论',
        content: '<textarea id="reply-content"></textarea>',
        okValue: '确定',
        ok: function () {
            this.title('提交中…');
            replySubmit();
            return false;
        },
        cancelValue: '取消',
        cancel: function () {}
    });
    d.show(btn);
}

function replySubmit() {
    var appreciateId = $("#appreciateId").val();
    var content = $("#reply-content").val();
    var data_send = {};
    data_send.appreciateId = appreciateId;
    data_send.parentId = parentId;
    data_send.content = content;
    var url = $("#post-comment-url").val();
    var post_request =$.ajax({
     type: 'post',
     url: url,
     data: data_send,
     dataType: 'json'
    });

    post_request.fail(function( jqXHR, textStatus ) {
    if(jqXHR.status==401){
       //openWeiboLogin();

    }
    });

    post_request.done(function(data) {
         if (data.ok) {
             layer.msg("评论已提交");
             window.location.reload();
             return;
          }else {
              toLogin();
          }
    });

}

function toDelete(btn){
    parentId = $(btn).attr("parentId");
    layer.confirm('确定推荐？', {
     btn: ['取消','确定'] //按钮
   }, function(){
     layer.closeAll();
   }, function(){
     deleteComment(parentId);
   });
}

function deleteComment(id){
    var url = $("#delete-url").val();
    url = url.replace("{id}",id);
    var data_send = {};

    var delete_request =$.ajax({
       type: 'post',
       url: url,
       data: data_send,
       dataType: 'json'
    });

    delete_request.fail(function( jqXHR, textStatus ) {
      if(jqXHR.status==401){
         //openWeiboLogin();

      }
    });

    delete_request.done(function(data) {
            window.location.reload();
    });
}