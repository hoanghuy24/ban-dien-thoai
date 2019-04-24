package com.sell.entity.usermanager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Main {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        UserProfile userProfile = session.find(UserProfile.class, 1);
        System.out.println(userProfile);
    }
}
