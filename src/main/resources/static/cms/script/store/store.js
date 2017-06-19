// 添加频道
function addChannel() {
	var c_id = $('#channelBox').combobox('getValue');
	var s_id = $('#store_id').val();
	var data_send = {};
	data_send.c_id = c_id;
	data_send.s_id = s_id;
	data_send.random = Math.random();

	var request =$.ajax({
        type: 'post',
        url: '/cms/store/channel_add.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	$.messager.alert('提示信息','添加失败','error');
    });

    request.done(function(data) {
         if(data.ok){
        	 window.location.reload();
         }else{
        	 $.messager.alert('提示信息','添加失败','error');
         }
    });
}

function del(s_id,c_id){
	if(!confirm("确认删除?")){
		return;
	}
	var data_send = {};
	data_send.c_id = c_id;
	data_send.s_id = s_id;
	data_send.random = Math.random();
	var request =$.ajax({
        type: 'post',
        url: '/cms/store/channel_del.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	$.messager.alert('提示信息','删除失败','error');
    });

    request.done(function(data) {
         if(data.ok){
        	 window.location.reload();
         }else{
        	 $.messager.alert('提示信息','删除失败','error');
         }
    });
}

