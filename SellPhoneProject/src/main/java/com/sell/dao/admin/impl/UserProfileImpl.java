package com.sell.dao.admin.impl;

import com.sell.dao.admin.UserProfileDAO;
import com.sell.entity.usermanager.UserProfile;
import com.sell.entity.usermanager.Users;
import com.sell.hibernate.HibernateUI;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
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
		return session.createQuery("FROM " + UserProfile.class.getName()).getResultList();
	}

	public UserProfile getUsersProfile(int id) {
		Session session = HibernateUI.getSessionFactory().openSession();
		return session.find(UserProfile.class, id);
	}

	public UserProfile getUserProfileByUserId(int id) {
		Session session = HibernateUI.getSessionFactory().openSession();
		return (UserProfile) session
				.createQuery("FROM " + UserProfile.class.getName() + " as p where p.user_id = " + id).list().get(0);
	}

	public boolean updateProfile(UserProfile profile) {
		Session session = HibernateUI.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.update(profile);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	public Users getUserById(int id) {
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
		Users users = session.get(Users.class, id);
		session.close();
		return users;
	}
	
	public UserProfile getUserProfileById(int id) {
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
		UserProfile userProfile = session.get(UserProfile.class, id);
		session.close();
		return userProfile;
	}
}
