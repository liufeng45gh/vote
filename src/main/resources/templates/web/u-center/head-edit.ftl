<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>美图WEB开放平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="http://open.web.meitu.com/sources/xiuxiu.js" type="text/javascript"></script>
    <script type="text/javascript">
window.onload=function(){
       /*第1个参数是加载编辑器div容器，第2个参数是编辑器类型，第3个参数是div容器宽，第4个参数是div容器高*/
	xiuxiu.embedSWF("altContent",5,"100%","100%");
	//xiuxiu.setLaunchVars("avatarPreview", {visible:true, label:"头像预览",large:{width:140,height:140, label:"大头像"}});
	//xiuxiu.setLaunchVars("avatarPreview", {visible:true, label:"裁剪预览",small:{width:30,height:30}, medium:{width:60,height:60},large:{width:140,height:140, label:"大尺寸"}});
	//xiuxiu.setLaunchVars("avatarPreview", {visible:true,large:{width:140,height:140, label:"大尺寸"}});
       //修改为您自己的图片上传接口
    var url_pre = window.location.protocol + "//"+window.location.host ;
    var up_url = url_pre + "/u-center/head-edit";
	xiuxiu.setUploadURL(up_url);
        xiuxiu.setUploadType(2);
        xiuxiu.setUploadDataFieldName("file");
	xiuxiu.onInit = function ()
	{
	    //xiuxiu.setLaunchVars("avatarPreview", {visible:true, label:"头像预览",large:{width:140,height:140, label:"大头像"}});
	    //xiuxiu.setLaunchVars("avatarPreview", {visible:true, label:"裁剪预览",small:{width:30,height:30}, medium:{width:60,height:60},large:{width:140,height:140, label:"大尺寸"}});

		xiuxiu.loadPhoto("http://open.web.meitu.com/sources/images/1.jpg");
	}
	xiuxiu.onUploadResponse = function (data)
	{
		//alert("上传响应" + data);  可以开启调试
		 window.parent.location.reload();
	}
}
</script>
    <style type="text/css">
	html, body { height:100%; overflow:hidden; }
	body { margin:0; }
</style>
</head>
<body>
<div id="altContent">
    <h1>美图秀秀</h1>
</div>
</body>
</html>