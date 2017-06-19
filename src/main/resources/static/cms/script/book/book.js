function startUpload() {
	var form = $("#book_form");
	var input = $("#up_file");
	var target_img = $("#book_cover")
	var oldName = input.attr("name");
	if (input.val().indexOf('%') >= 0) {
		alert("图片文件名不正确");
		return;
	}
	input.attr("name", "upload_image");
	if (!check_extension(input.val(), {
		"png" : 1,
		"jpg" : 1,
		"jpeg" : 1,
		"gif" : 1
	})) {
		alert("文件格式不正确，只支持png,jpg,jpeg,gif文件");
		return;
	}

	if (input.val() == "") {
		return;
	}

	var options = {
		url : '/cms/image/upload.json',
		dataType : 'json',
		success : function(responseText, statusText, xhr, $form) {
			if (statusText == "success") {
				// console.log("upload file success!");
				target_img.attr("src", responseText.upload_image);
				$("#book_cover_hidden").val(responseText.upload_image);
			}
		}
	};

	form.ajaxSubmit(options);

}
function uploadChapter() {

	var form = $("#chapterForm");
	var chapter_file = $("#chapter_file").filebox("getValue");
	if(chapter_file.trim()==""){
		alert('请选择上传文件');
		return false;
	}
	
	if (!check_extension(chapter_file, {
		"txt":1,
		"doc":1,
		"docx":1
	})) {
		alert('文件格式不正确，只支持txt、word、pdf文件');
		return false;
	}

	progress('正在解析文件，请稍候...');
	var options = {
		url : '/cms/book/uploadChapterFile.json',
		dataType : 'json',
		success : function(responseText, statusText, xhr, $form) {
			if (responseText.ok) {
				window.location.reload();
			}else{
				$.messager.progress('close');
				alert('上传失败！');
			}
		},
		error: function () {
			$.messager.progress('close');
			alert('上传失败！');
        }
	};
	form.ajaxSubmit(options);
	return false;
}

function uploadBookFile() {

	var form = $("#file_form");
	var book_file = $("#book_file").filebox("getValue");
	if(book_file.trim()==""){
		alert('请选择上传文件');
		return false;
	}
	
	if (!check_extension(book_file, {
		"pdf":1,
		"epub":1
	})) {
		alert('文件格式不正确，只支持pdf、epub文件');
		return false;
	}

	progress('正在上传，请稍候...');
	var options = {
		url : '/cms/book/uploadBookFile.json',
		dataType : 'json',
		success : function(responseText, statusText, xhr, $form) {
			if (responseText.ok) {
				window.location.reload();
			}else{
				$.messager.progress('close');
				alert('上传失败！');
			}
		},
		error: function () {
			$.messager.progress('close');
			alert('上传失败！');
        }
	};
	form.ajaxSubmit(options);
	return false;
}

function progress(tip){
	var win = $.messager.progress({
		title:tip,
		msg:'上传文件'
	});
}

function check_extension(filename, hash) {
	if (filename == null || filename.length == 0)
		return true;

	var ext = filename.substring(filename.lastIndexOf('.') + 1);
	ext = ext.toLowerCase();
	if (hash[ext]) {
		return true;
	}

	return false;
}

function showAdd() {
	$('#wds').dialog('open');
}

function closeAdd() {
	$('#wds').dialog('close');
}

function showEditor() {
	$("#wds_editor").dialog('open');
}

function closeEditor() {
	$("#wds_editor").dialog('close');
}

// 添加新章节
function addChapter() {
	
	var title = $("#title").val();
	if (title.trim() == "") {
		$("#title_info").css("color", "red");
		$("#title_info").html("* 章节标题必须填写");
		return false;
	}
	
	var content = $("#content").val();
	if (content.trim() == "") {
		$("#content_info").css("color", "red");
		$("#content_info").html("* 章节内容必须填写");
		return false;
	}
	
	var book_id = $("#book_id").val();
	if (book_id.trim() == "") {
		return false;
	}
	
	var data_send = {};
	data_send.title = title;
	data_send.content = content;
	data_send.book_id = book_id;
	data_send.random = Math.random();

	var request =$.ajax({
        type: 'post',
        url: '/cms/book/chapter_add.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('添加章节失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 window.location.reload();
         }else{
        	 alert('添加章节失败');
         }
    });
}

function findChapter(id){
	var data_send = {};
	data_send.id = id;
	data_send.random = Math.random();

	var request =$.ajax({
        type: 'post',
        url: '/cms/book/chapter_find.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('查询章节失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 var chapter = data.data;
        	 $("#id_edit").val(chapter.id);
        	 $("#title_edit").textbox('setValue',chapter.title);
        	 $("#content_edit").val(chapter.content);
        	 showEditor();
         }else{
        	 alert('查询章节失败');
         }
    });
}

function editChapter(){
	var title = $("#title_edit").val();
	if (title.trim() == "") {
		$("#title_edit_info").css("color", "red");
		$("#title_edit_info").html("* 章节标题必须填写");
		return false;
	}
	
	var content = $("#content_edit").val();
	if (content.trim() == "") {
		$("#content_edit_info").css("color", "red");
		$("#content_edit_info").html("* 章节内容必须填写");
		return false;
	}
	
	var data_send = {};
	data_send.title = title;
	data_send.content = content;
	data_send.id = $("#id_edit").val();
	data_send.random = Math.random();
	
	var request =$.ajax({
        type: 'post',
        url: '/cms/book/chapter_edit.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('修改章节失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 window.location.reload();
         }else{
        	 alert('修改章节失败');
         }
    });
}
//删除章节
function del(ids){
	if(!confirm("确认删除?")){
		return;
	}
	var data_send = {};
	data_send.ids = ids;
	data_send.random = Math.random();

	var request =$.ajax({
        type: 'post',
        url: '/cms/book/chapter_del.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('删除章节失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 window.location.reload();
         }else{
        	 alert('删除章节失败');
         }
    });
}

$(document).ready(function() {
	$(document).on("change", "#up_file", function() {
		startUpload();
	});
});

//添加频道
function addChannel() {
	var c_id = $('#channelBox').combobox('getValue');
	var b_id = $('#book_id').val();
	var data_send = {};
	data_send.c_id = c_id;
	data_send.b_id = b_id;
	data_send.random = Math.random();

	var request =$.ajax({
        type: 'post',
        url: '/cms/book/channel_add.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('添加失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 window.location.reload();
         }else{
        	 alert('添加失败');
         }
    });
}

function delBookChannel(b_id,c_id){
	if(!confirm("确认删除?")){
		return;
	}
	var data_send = {};
	data_send.c_id = c_id;
	data_send.b_id = b_id;
	data_send.random = Math.random();
	var request =$.ajax({
        type: 'post',
        url: '/cms/book/channel_del.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('删除失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 window.location.reload();
         }else{
        	 alert('删除失败');
         }
    });
}

//保存章节排序
function savePosition(){
	if(!confirm("确认重新排序?")){
		return;
	}
	var rows = $("#dg").datagrid("getRows");
	var chapter_positions = "";
	var chapter_ids = "";
	for(var i=0;i<rows.length;i++){
		chapter_positions += rows[i].position+"|";
        chapter_ids += rows[i].id+"|";
     }
	
	var data_send = {};
	data_send.chapter_positions = chapter_positions;
	data_send.chapter_ids = chapter_ids;
	data_send.random = Math.random();
	var request =$.ajax({
        type: 'post',
        url: '/cms/book/chapter_position.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('排序失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 window.location.reload();
         }else{
        	 alert('排序失败');
         }
    });
   
}
//重置页面章节排序
function resetPosition(){
	var rows = $("#dg").datagrid("getRows");
	for(var i=0;i<rows.length;i++){
        //从新设置排序的值
		$('#dg').datagrid('updateRow',{
			index: i,
			row: {
				position: rows.length-i
			}
		}); 
      }
}

function createDownFile(id){
	
	var data_send = {};
	data_send.id = id;
	
	data_send.random = Math.random();
	var request =$.ajax({
        type: 'post',
        url: '/cms/book/create_down_file.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	$.messager.alert('提示信息','生成失败','error');
    });

    request.done(function(data) {
         if(data.ok){
        	 alert("生成成功");
         }else{
        	 $.messager.alert('提示信息','生成失败','error');
         }
    });
}

//添加分类
function addClass() {
	var c_id = $('#cc').combo('getValue');
	
	if (c_id==null || c_id.trim() == "") {
		alert("请选择分类");
		return false;
	}
	var b_id = $('#book_id').val();
	var data_send = {};
	data_send.c_id = c_id;
	data_send.b_id = b_id;
	data_send.random = Math.random();

	var request =$.ajax({
        type: 'post',
        url: '/cms/book/class_add.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('添加失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 alert("添加成功");
        	 window.location.reload();
         }else{
        	 alert('添加失败');
         }
    });
}
//删除分类
function delBookClass(b_id,c_id){
	if(!confirm("确认删除?")){
		return;
	}
	var data_send = {};
	data_send.c_id = c_id;
	data_send.b_id = b_id;
	data_send.random = Math.random();
	var request =$.ajax({
        type: 'post',
        url: '/cms/book/class_del.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('删除失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 alert('删除成功');
        	 window.location.reload();
         }else{
        	 alert('删除失败');
         }
    });
}

function createEpubFile(book_id){
	if(!confirm("确认成成epub?")){
		return;
	}
	var data_send = {};
	data_send.id = book_id;
	data_send.random = Math.random();
	var request =$.ajax({
        type: 'post',
        url: '/cms/book/chaptertoepub.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('生成失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 alert('生成成功');
        	 window.location.reload();
         }else{
        	 alert('生成失败');
         }
    });
}

function addToInitList(book_id){
	if(!confirm("确认添加到初始化?")){
		return;
	}
	var data_send = {};
	data_send.id = book_id;
	data_send.random = Math.random();
	var request =$.ajax({
        type: 'post',
        url: '/cms/book/add_to_init.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('添加失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 alert('添加成功');
        	 //window.location.reload();
         }else{
        	 alert('添加失败');
         }
    });
}

function pushToApns(book_id){
	if(!confirm("确认执行推送?")){
		return;
	}
	var data_send = {};
	data_send.id = book_id;
	data_send.random = Math.random();
	data_send.text = $("#push_text").val();
	var request =$.ajax({
        type: 'post',
        url: '/cms/book/push_to_apns.json',
        data: data_send,
        dataType: 'json',
        
    });

    request.fail(function( jqXHR, textStatus ) {
    	alert('推送失败');
    });

    request.done(function(data) {
         if(data.ok){
        	 alert('推送已提交到苹果');
        	 //window.location.reload();
         }else{
        	 alert('推送失败');
         }
    });
	
}