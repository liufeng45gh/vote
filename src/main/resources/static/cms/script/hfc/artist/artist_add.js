function checkFiled(){
    var name=$("#name_input").val();
    if(name.trim()==""){
        $("#name_input_info").css("color","red");
        $("#name_input_info").html("* 名字必须填写");
        return false;
    } else {
        $("#name_input_info").css("color","auto");
         $("#name_input_info").html("* 名字");
    }




    return true;
}
$(document).ready(function () {
    $("#submit-btn").click(function() {
        var allCheck = checkFiled();
        if (allCheck) {
            $("#hfc-form").ajaxSubmit(function(data){
                layer.alert('添加成功!', {
                  closeBtn: 0
                }, function(){
                  window.location.reload();
                  //layer.prompt("dsfssadsd");
                });

            });
        }
    });
});

