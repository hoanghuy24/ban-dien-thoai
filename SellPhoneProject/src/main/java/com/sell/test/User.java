package com.sell.test;

import javax.validation.constraints.NotBlank;

import org.hibernate.Session;
import org.hibernate.validator.constraints.Length;

import com.sell.entity.PersonOrder;
import com.sell.entity.usermanager.UserProfile;
import com.sell.entity.usermanager.Users;
import com.sell.hibernate.HibernateUI;

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
		Session session = HibernateUI.getSessionFactory().openSession();
		Users users = session.get(Users.class, 15);
		System.out.println(users.getUsername());
		UserProfile profile = users.getUserProfile();
		System.out.println(profile.getId());
	}
	
	
}
