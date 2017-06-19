function checkFiled(){
    var oldPass=$("#old-pass").val();
    if(oldPass.trim()==""){
       layer.msg("原密码不能为空");
        return false;
    }
    if(oldPass.trim().length < 6){
       layer.msg("原密码长度不能小于6位");
        return false;
    }

    var newPass=$("#new-pass").val();
    if(newPass.trim()==""){
       layer.msg("新密码不能为空");
        return false;
    }
    if(newPass.trim().length < 6){
       layer.msg("新密码长度不能小于6位");
       return false;
    }

    var repeatPass=$("#repeat-pass").val();
    if(repeatPass.trim()==""){
       layer.msg("重复密码不能为空");
        return false;
    }
    if(repeatPass.trim().length < 6){
       layer.msg("重复密码长度不能小于6位");
       return false;
    }
    if(newPass != repeatPass){
       layer.msg("两次密码输入不一致");
       return false;
    }

    return true;
}


$(document).ready(function () {
    $(".btn-submit").click(function() {
        var check = checkFiled();
        if (!check) {
            return;
        }
         $("#hfc-form").ajaxSubmit(function(data){
            if (data.ok) {
                 layer.alert('修改成功!', {
                      closeBtn: 0
                    }, function(){
                      window.location.reload();
                      //layer.prompt("dsfssadsd");
                    });
            } else {
                layer.msg(data.message);
            }
        });
    });
});