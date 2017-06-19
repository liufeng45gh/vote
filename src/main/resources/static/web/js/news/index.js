var isLoading = false;
var page = 1;


$(function() {
    $("#load-more").click(function () {
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
        data_send.categoryId = categoryId;
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
                $("#news-list").append(data);
                clearLoading();
        });

    });
});

function clearLoading(){
   isLoading = false;
   $("#load-more").show();
}