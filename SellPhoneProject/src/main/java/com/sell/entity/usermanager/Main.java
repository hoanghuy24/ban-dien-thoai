package com.sell.entity.usermanager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.sell.entity.Cart;
import com.sell.entity.Item;
import com.sell.entity.Product;
import com.sun.xml.fastinfoset.algorithm.IEEE754FloatingPointEncodingAlgorithm;

public class Main {
    public static void main(String[] args) {
    	SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
    Users u = session.get(Users.class, 13);
    UserProfile profile = new UserProfile();
    profile = session.get(UserProfile.class, u.getUserProfile().getId());
    
    profile.setFirstName("hhahaha");
    session.update(profile);
    session.beginTransaction().commit();
}
}
