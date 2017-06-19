function resetLogoPix(){
    //alert("resetLogoPix");
    var url = $("#logo_hidden").val();
    var img = new Image();
    img.onload=function(){
        $("#l_width_input").val(this.width);
        $("#l_height_input").val(this.height);
    };
    img.src = url;
}
$(document).ready(function() {
    resetLogoPix();
    $("#logo_cover").load (function() {
        resetLogoPix();
    });
});