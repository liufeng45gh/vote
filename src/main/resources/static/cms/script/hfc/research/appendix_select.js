function startUploadAppendix() {
	var form = $("#hfc-form");
	var input = $("#appendix_input");

	var oldName = input.attr("name");
	if (input.val().indexOf('%') >= 0) {
		alert("文件名不正确");
		return;
	}
	input.attr("name", "file");


	if (input.val() == "") {
		return;
	}

	var options = {
		url : '/cloud/upload',
		dataType : 'json',
		success : function(responseData, statusText, xhr, $form) {
			if (statusText == "success") {
				// console.log("upload file success!");
				$("#appendix_url_href").html("已上传");
				$("#appendix_url_href").attr("href",responseData.data);
				$("#appendix_url").val(responseData.data);
			}
		}
	};

	form.ajaxSubmit(options);

}



$(document).ready(function() {
	$(document).on("change", "#appendix_input", function() {
		startUploadAppendix();
	});
});