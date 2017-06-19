String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, '');
}

function setCookie(c_name,value,expiredays){
	var exdate=new Date()
	exdate.setDate(exdate.getDate()+expiredays)
	document.cookie=c_name+ "=" +escape(value)+
	((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
}

function getCookie(name) {
    if (document.cookie.length>0)
    {
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    }
    return ""
}

function delCookie(name)//鍒犻櫎cookie
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

function setSessionCookie(c_name,value){
    document.cookie = c_name+"="+value+";  path=/";
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

function isEmpty(str){
    if (null == str) {
        return true;
    }

    if (str.trim()=="") {
        return true;
    }

    return false;

}

function validMobileFormat(mobile){
    var numberRegStr = /^\d{11}$/;
    var regNum = new RegExp(numberRegStr);
    if (regNum.test(mobile)) {
        var telRegStr = /^(13|14|15|17|18)\d{9}$/;
        var reg = new RegExp(telRegStr);
        if (reg.test(mobile)) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        return false;
    }
}

