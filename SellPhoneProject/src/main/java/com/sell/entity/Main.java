package com.sell.entity;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.sell.dao.impl.CategoryImpl;
import com.sell.entity.usermanager.Users;


public class Main {

	static SessionFactory factory = new Configuration().configure().buildSessionFactory();
	public static void main(String[] args) {
		Session session = factory.openSession();
		Users u = session.get(Users.class, 2);
		System.out.println(u.getCart().getId());
	}
}
