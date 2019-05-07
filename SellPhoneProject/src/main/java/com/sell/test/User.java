package com.sell.test;

import java.text.DecimalFormat;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

public class User {

	@NotBlank(message = "Not blank")
	private String username;
	@Length(max = 12, min=4, message = "max = 12, min = 4")
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public static void main(String[] args) {
		String s = "";
		if(s.equals("a")) {
			System.out.println("reu");
		}
	}
	
	
}
