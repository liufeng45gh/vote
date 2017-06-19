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
        if (typeof(title) != "undefined") {
            data_send.title = title;
        }

        var more_request =$.ajax({
           type: 'get',
           url: url,
           data: data_send,
           dataType: 'json'
        });

        more_request.fail(function( jqXHR, textStatus ) {
          if(jqXHR.status==401){
             //openWeiboLogin();

          }
        });

        more_request.done(function(data) {
                if (data.matchList.length ==0) {
                    return;
                }
                 $("#appreciate-desc").text("鉴赏对应匹配"+data.numberFound+"条");
                for (var i = 0;i<data.matchList.length;i++) {
                 //$("#entity-list").append(data[i].pinHtml);
                 addNewPin(data.matchList[i].id,data.matchList[i].pinHtml);
                }
                var maxHeight = getMaxheight();
                $("#entity-list").css("height",maxHeight);
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

var colLeftArray = new Array(0,245,490,735,980);
var colIdPanList = new Array();
for (var i = 0 ;i<5;i++) {
    colIdPanList[i] = new Array();
}

function getMinHeightIndex() {
    var index = 0;
    var minHeight = Number.MAX_VALUE;
    for (var i = 0; i<5; i++) {
        height = getHeight(i);
        if (height<minHeight) {
            minHeight = height;
            index = i;
        }
    }
    return index;
}

function getHeight(index) {
    if (colIdPanList[index].length == 0) {
        return 0;
    }
    var id = colIdPanList[index][colIdPanList[index].length-1];
    var top = $("#pin_"+id).css("top");
     //top = $("#"+id).position().top;
    top = parseInt(top);
    var height = $("#pin_"+id).outerHeight();
    return top + height;
}

function addNewPin(id,pinHtml){
    var minHeightIndex = getMinHeightIndex();
    var left = colLeftArray[minHeightIndex];
    var top = getHeight(minHeightIndex) + 20;
    colIdPanList[minHeightIndex].push(id);
    $("#entity-list").append(pinHtml);
    $("#pin_"+id).css("left",left);
    $("#pin_"+id).css("top",top);
}

function getMaxheight() {
     var maxHeight = 0;
        for (var i = 0; i<5; i++) {
            height = getHeight(i);
            if (height>maxHeight) {
                maxHeight = height;
            }
        }
     return maxHeight;
}

$(window).scroll(function(){
　　var scrollTop = $(this).scrollTop();
　　var scrollHeight = $(document).height();
　　var windowHeight = $(this).height();
　　if(scrollTop + windowHeight == scrollHeight){
　　　　nextPage ();
　　}
});