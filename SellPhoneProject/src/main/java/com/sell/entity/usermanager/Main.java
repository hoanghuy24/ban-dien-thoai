package com.sell.entity.usermanager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.PersonOrder;
import com.sell.hibernate.HibernateUI;
import com.sell.security.MD5;

public class Main {
	public static void main(String[] args) {
		Session session = HibernateUI.getSessionFactory().openSession();
		MD5 md5 = new MD5();

		UsersImpl impl = new UsersImpl();
		for(Users users : impl.getListUsers()) {
			Users users2 = users;			
			users2.setPassword(md5.convertToMessageDigest(users.getPassword()));
			session.update(users2);
			session.beginTransaction().commit();
		}
		

	}

}
