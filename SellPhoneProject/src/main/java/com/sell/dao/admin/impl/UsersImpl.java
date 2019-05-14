package com.sell.dao.admin.impl;

import com.sell.dao.admin.UsersDAO;
import com.sell.entity.Cart;
import com.sell.entity.usermanager.UserProfile;
import com.sell.entity.usermanager.Users;
import com.sell.hibernate.HibernateUI;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UsersImpl implements UsersDAO {
	static SessionFactory factory = HibernateUI.getSessionFactory();

	public boolean changeStatusUsers(Users users, int status) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			users.setStatus(status);
			session.update(users);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	public boolean changePassword(Users users, String password, String repassword) {
		if (password.equals(repassword)) {
			Session session = factory.openSession();
			Transaction transaction = null;
			try {
				transaction = session.beginTransaction();
				users.setPassword(password);
				session.update(users);
				transaction.commit();
				return true;
			} catch (Exception e) {
				transaction.rollback();
			} finally {
				session.close();
			}
		} else {
			return false;
		}
		return false;
	}

	public boolean registerUsers(Users users) {
		Session session = factory.openSession();
		Cart cart = new Cart("", users);
		UserProfile userProfile = new UserProfile();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(users);
			session.save(cart);
			session.save(userProfile);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			System.out.println("Add error");
		} finally {
			session.close();
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<Users> getListUsers() {
		Session session = factory.openSession();
		return session.createQuery("FROM Users").getResultList();
	}

	public Users getUsers(int id) {
		Session session = factory.openSession();
		Users users =  session.find(Users.class, id);
		session.close();
		return users;
	}

//	public static void main(String[] args) {
//		UsersImpl users = new UsersImpl();
//		users.registerUsers(new Users("huyabc", "2403"));
//		System.out.println("OK");
//	}
}
