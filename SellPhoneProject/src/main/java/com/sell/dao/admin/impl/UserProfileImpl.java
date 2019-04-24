package com.sell.dao.admin.impl;

import com.sell.dao.admin.UserProfileDAO;
import com.sell.entity.usermanager.UserProfile;
import com.sell.hibernate.HibernateUI;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserProfileImpl implements UserProfileDAO {

    public boolean editProfile(UserProfile profile) {
        Session session = HibernateUI.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(profile);
            transaction.commit();
            return true;
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return false;
    }

    public boolean deleteProfile(UserProfile profile) {
        Session session = HibernateUI.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(profile);
            transaction.commit();
            return true;
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return false;
    }

    public List<UserProfile> getResultList() {
        Session session = HibernateUI.getSessionFactory().openSession();
        return session.createQuery("FROM UserProfile").getResultList();
    }

    public UserProfile getUsersProfile(int id) {
        Session session = HibernateUI.getSessionFactory().openSession();
        return session.find(UserProfile.class, id);
    }

//    public static void main(String[] args) {
//        UserProfileImpl profile = new UserProfileImpl();
//        for (UserProfile userProfile : profile.getResultList()) {
//            System.out.println(userProfile);
//        }
//        UserProfile userProfile = profile.getUsersProfile(2);
//        userProfile.setFirstName("Tkw");
//        System.out.println(profile.editProfile(userProfile));
//    }
}
