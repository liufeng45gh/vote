var swiper = null;



var intervalId = null;
var processCurrent = 0;
var increaseQuantity = 10;
function increaseProcess(){
    processCurrent = processCurrent + increaseQuantity;
    if (processCurrent>91) {
        processCurrent = 91;
    }
    resetIncreaseQuantity();
    showProcess(processCurrent);
}
function resetIncreaseQuantity(){
    if (processCurrent < 20) {
        increaseQuantity = 4;
    }else if (processCurrent < 40) {
        increaseQuantity = 3;
        createSwiper();
    }else if (processCurrent < 60) {
         increaseQuantity = 2;

    }else if (processCurrent < 80) {
          increaseQuantity = 1;
    }
}

function showProcess(process){
    $(".process-front").css("width",process +  "%");
    $(".process-text").text(process +  "%");
}


var intervalId = null;
//页面 ready 完成开始显示进度条加载效果
$(document).ready(function(){
    intervalId = setInterval(increaseProcess,500);
});

function createSwiper(){
    if (swiper != null){
        return;
    }
    $(".swiper-slide").css("display","block");
    swiper = new Swiper('.swiper-container', {
      direction: 'vertical',
      noSwiping : true,
      autoHeight:true
    });
}

//页面 load 完成 显示 100% 并显示下一页
$(window).on("load",function(){
    if (processCurrent < 80 ){
        setTimeout(doLoadFinish,10000);
    }else {
        setTimeout(doLoadFinish,3000);
        //doLoadFinish();
    }
});

function doLoadFinish(){
    clearInterval(intervalId);
    processCurrent = 92;
    showProcess(processCurrent);
    setTimeout(toInitPage,1000);

}

function toInitPage(){
    swiper.slideTo(1);
}

$(document).ready(function(){
    //checkLogin();
    $(".rule-area").hide();
    $("#btn-rule-close").click(function(){
       $(".rule-area").hide();
    });
    $("#see-rule").click(function(){
         $(".rule-area").show();
    });


    $("#btn-start-vote").click(function () {
        window.location.href = "/appreciate/category";
    });

    $("#my-text").click(function () {
        openMy();
    });
});

function toPage(index){
    $(".swiper-slide").css("display","none");
    $("#swiper-slide-" + index).css("display","block");
}








