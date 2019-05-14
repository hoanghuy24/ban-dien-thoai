package com.sell.security;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {

	public String convertToMessageDigest(String input) {
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			digest.update(input.getBytes());
			BigInteger bigInteger = new BigInteger(1, digest.digest());
			return bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void main(String[] args) {
		String md = new MD5().convertToMessageDigest("1");	
		System.out.println(md);
		if(md.equalsIgnoreCase("2a4a82d4ba9f79074325a45bb3cdd6d8")) {
			System.out.println("true");
		}
	}
	
}
