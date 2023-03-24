package com.dtsys;

import java.util.Hashtable;
import java.util.Map;

public class VCodeStore {
	public static Map<String, String> VCodeMap = new Hashtable<String, String> ();
	
	public static String getVCode(String key) {
		return VCodeMap.get(key);
	}
	
	public static void putVCode(String key, String value) {
		VCodeMap.put(key, value);
	}
}
