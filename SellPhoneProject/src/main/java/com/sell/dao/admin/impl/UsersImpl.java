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

import javax.validation.ConstraintViolationException;
import java.sql.SQLIntegrityConstraintViolationException;
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

	public int registerUsers(Users users) {
		Session session = factory.openSession();
		Cart cart = new Cart("", users);
		UserProfile profile = new UserProfile(users);
		profile.setEmail(users.getUserProfile().getEmail());
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(users);
			session.save(cart);
			session.save(profile);
			transaction.commit();
			return 1;
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			return 0;
		}
		finally {
			session.close();
		}
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

	public static void main(String[] args) {
		UsersImpl users = new UsersImpl();
		Users users1 = new Users();
		users.registerUsers(users1);
	}
}
