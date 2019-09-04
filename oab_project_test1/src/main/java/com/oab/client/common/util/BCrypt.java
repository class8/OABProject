package com.oab.client.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class BCrypt {

	// 해쉬함수를 이용해 패스워드 암호화 작업을 수행한다
	public static byte[] getSHA256(String source, String salt) {
		byte byteData[] = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(source.getBytes());
			md.update(salt.getBytes());
			byteData = md.digest();
		} catch (NoSuchAlgorithmException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return byteData;
	}

}
