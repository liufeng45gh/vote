
var sloganArray = new Array("以艺术品流通为使命","资源整合平台","艺术家孵化平台","鉴定估值平台","大数据认证平台","媒体推广平台","展览展示平台","拍卖交易平台","金融服务平台");

var sloganCurrentIndex = 0;

$(document).ready(function(){
        setInterval(nextSlogan,3000);
});

function nextSlogan(){
    $("#slogan").css("display","none");
    $("#slogan").text(sloganArray[sloganCurrentIndex]);
    //$("#slogan").animate({display: "block"},"slow");
    $("#slogan").fadeIn(1500);
    sloganCurrentIndex = sloganCurrentIndex + 1;
    if (sloganCurrentIndex==sloganArray.length) {
        sloganCurrentIndex = 0;
    }
}