package com.azt.common;

public class StringUtil {
	public static String nvl(String str) {
		return str == null ? "" : str;
	}

	public static String nvl(String str, String repl) {
		if (nvl(str).trim().equals("")) {
			return repl;
		}
		return str;
	}
}
