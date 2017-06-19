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
        if (typeof(categoryId) != "undefined") {
           data_send.categoryId = categoryId;
        }
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
                if (data.length ==0) {
                    return;
                }
                for (var i = 0;i<data.length;i++) {
                 //$("#entity-list").append(data[i].pinHtml);
                 addNewPin(data[i].id,data[i].pinHtml);
                }
                var maxHeight = getMaxheight();
                $("#entity-list").css("height",maxHeight);
                $("#appreciate-block").css("height",maxHeight+300);
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

//$(window).scroll(function(){
//　　var scrollTop = $(window).scrollTop();
//　　var scrollHeight = $(document).height();
//　　var windowHeight = $(window).height();
//    var wInHeight = $(window).innerHeight();
//　　if(scrollTop + windowHeight == scrollHeight){
//        alert("---");
//　　　　nextPage ();
//　　}
//
//
////    var $this =$(this),
////     viewH =$(this).height(),//可见高度
////     contentH =$(this).get(0).scrollHeight,//内容高度
////     scrollTop =$(this).scrollTop();//滚动高度
////    if(contentH - viewH - scrollTop <= 100) { //到达底部100px时,加载新内容
////    //if(scrollTop/(contentH -viewH)>=0.95){ //到达底部100px时,加载新内容
////    // 这里加载数据..
////     alert("---");
////    }
//});

//代码如下（兼容不同的浏览器）。


//滚动条在Y轴上的滚动距离

function getScrollTop(){
　　var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
　　if(document.body){
　　　　bodyScrollTop = document.body.scrollTop;
　　}
　　if(document.documentElement){
　　　　documentScrollTop = document.documentElement.scrollTop;
　　}
　　scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
　　return scrollTop;
}

//文档的总高度

function getScrollHeight(){
　　var scrollHeight = 0, bodyScrollHeight = 0, documentScrollHeight = 0;
　　if(document.body){
　　　　bodyScrollHeight = document.body.scrollHeight;
　　}
　　if(document.documentElement){
　　　　documentScrollHeight = document.documentElement.scrollHeight;
　　}
　　scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight;
　　return scrollHeight;
}

//浏览器视口的高度

function getWindowHeight(){
　　var windowHeight = 0;
　　if(document.compatMode == "CSS1Compat"){
　　　　windowHeight = document.documentElement.clientHeight;
　　}else{
　　　　windowHeight = document.body.clientHeight;
　　}
　　return windowHeight;
}
$(window).scroll(function(){
    var scrollTop = getScrollTop();
        var winHeight = getWindowHeight();
        var scrollHeight = getScrollHeight();
    　　if(getScrollTop() + getWindowHeight() == getScrollHeight()){
    　　　　//alert("已经到最底部了！!");
            nextPage ();
    　　}
});
