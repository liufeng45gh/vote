function startUpload() {
	var form = $("#hfc-form");
	var input = $("#up_file");
	var target_img = $("#logo_cover")
	var oldName = input.attr("name");
	if (input.val().indexOf('%') >= 0) {
		alert("图片文件名不正确");
		return;
	}
	input.attr("name", "file");
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
		url : '/cloud/upload',
		dataType : 'json',
		success : function(responseData, statusText, xhr, $form) {
			if (statusText == "success") {
				// console.log("upload file success!");
				target_img.attr("src", responseData.data);
				$("#logo_hidden").val(responseData.data);
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