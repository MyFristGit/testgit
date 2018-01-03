package com.udata.osp.util;


import java.security.MessageDigest;

import org.apache.shiro.crypto.hash.SimpleHash;

public class MD5 {

	public static String md5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			str = buf.toString();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return str;
	}

	public static void main(String[] args) {
		System.out.println(md5("31119@qq.com" + "123456"));
		System.out.println(md5("mj1"));
		String passwd = new SimpleHash("SHA-1", "赵安新", "888888").toString(); // 密码加密
		System.out.println(passwd);
	
	}
}
