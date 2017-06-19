function startUpload() {
	var form = $("#ad_form");
	var input = $("#up_file");
	var target_img = $("#ad_image")
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
				$("#ad_image_hidden").val(responseText.upload_image);
			}
		}
	};

	form.ajaxSubmit(options);

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

$(document).ready(function() {
	$(document).on("change", "#up_file", function() {
		startUpload();
	});
});