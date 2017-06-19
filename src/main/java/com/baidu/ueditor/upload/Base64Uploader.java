package com.baidu.ueditor.upload;

import com.baidu.ueditor.define.AppInfo;
import com.baidu.ueditor.define.BaseState;
import com.baidu.ueditor.define.FileType;
import com.baidu.ueditor.define.State;
import com.lucifer.service.vote.QiniuCloudService;
import org.apache.commons.codec.binary.Base64;

import java.io.IOException;
import java.util.Map;

public final class Base64Uploader {

	public static State save(String content, Map<String, Object> conf) throws IOException {
		
		byte[] data = decode(content);

		long maxSize = ((Long) conf.get("maxSize")).longValue();

		if (!validSize(data, maxSize)) {
			return new BaseState(false, AppInfo.MAX_SIZE);
		}

		String suffix = FileType.getSuffix("JPG");
//
//		String savePath = PathFormat.parse((String) conf.get("savePath"),
//				(String) conf.get("filename"));
//
//		savePath = savePath + suffix;
//		String physicalPath = (String) conf.get("rootPath") + savePath;
//
//		State storageState = StorageManager.saveBinaryFile(data, physicalPath);


		String uploadUrl = QiniuCloudService.getInstance().simpleUploadWithoutKey(data);

		State storageState = new BaseState(true, uploadUrl);

		storageState.putInfo( "size", data.length );
		storageState.putInfo( "title", uploadUrl);


		if (storageState.isSuccess()) {
			storageState.putInfo("url", uploadUrl);
			storageState.putInfo("type", suffix);
			storageState.putInfo("original", "");
		}

		return storageState;
	}

	private static byte[] decode(String content) {
		return Base64.decodeBase64(content);
	}

	private static boolean validSize(byte[] data, long length) {
		return data.length <= length;
	}
	
}