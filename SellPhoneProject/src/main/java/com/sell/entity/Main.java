package com.sell.entity;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.sell.dao.impl.CategoryImpl;


public class Main {

	static SessionFactory factory = new Configuration().configure().buildSessionFactory();
	public static void main(String[] args) {
		Session session = factory.openSession();
		Category category = new CategoryImpl().getCategory(1);
		System.out.println(category.getCategory());
		for(Product p: category.getListProduct()) {
			System.out.println(p.getName());
		}
	}
}
