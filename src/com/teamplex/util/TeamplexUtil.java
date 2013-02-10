package com.teamplex.util;

import java.io.IOException;
import java.util.List;

import org.springframework.security.crypto.codec.Base64;
import org.springframework.web.multipart.MultipartFile;

import com.teamplex.tag.Tag;

public class TeamplexUtil {
	
	public static byte[] getBytes(MultipartFile profileImage) {
		byte[] bytes = null;
		try {
			bytes = profileImage.getBytes();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return bytes;
	}
	
	public static String base64Encode(MultipartFile profileImage) {
		return new String(Base64.encode(getBytes(profileImage)));
	}
	
	public static String getCsvTagValues(List<Tag> tags) {
		if (tags == null)
			return null;
		
		String result = "";
		for (Tag tag : tags)
			result += tag.getValue() + ",";
		return result.equals("") ? "" : result.substring(0, result.length() - 1);
	}
	
}