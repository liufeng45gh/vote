$(document).ready(function(){
    $(".thumb-li").click(function(){
        var index = $(this).attr("index");
        index = parseInt(index);
        clickThumb(index);
    });
    $("#imgPrevBtn").click(function(){
        var s1 = $(".s1").text();
        s1 = parseInt(s1);
        if (s1 <= 1) {
            return;
        }
        clickThumb(s1 -1);
    });

    $("#imgNextBtn").click(function(){
            var s1 = $(".s1").text();
            s1 = parseInt(s1);
            if (s1 >= getPictureCount()) {
                return;
            }
            clickThumb(s1 +1);
      });
});



function getPictureCount() {
    return $(".thumb-li").length;
}

function getMinLeft(){
    return -(this.getPictureCount() - 9) * 130;
}

function  getLeft(index){
    var left = -(index - 5) *130;
    var minLeft = getMinLeft();
    if (left>=0) {
        return 0;
    }
    if (left<minLeft) {
        return minLeft;
    }
    return left;
}

function clickThumb(index){
    var jObject = $("#thumb-"+index);
    $(".thumb-li").removeClass("active");
    jObject.addClass("active");

    var _left = getLeft(index);
    $("#ablumList").css("left",_left);
    var src = jObject.find("img").attr("src");
    $("#newsBigPic").attr("src",src);
    $(".s1").text(jObject.attr("index"));
    var description = jObject.find(".description").text();
    $("#rnImgDes").text(description);
}