package com.sell.dao.impl;

import org.hibernate.Session;

import com.sell.dao.BuyProductDAO;
import com.sell.entity.Cart;
import com.sell.entity.Item;
import com.sell.entity.usermanager.Users;
import com.sell.hibernate.HibernateUI;

public class BuyProductImpl implements BuyProductDAO {

	public void addProductInCart(Item item) {
		Session session = HibernateUI.getSessionFactory().openSession();
		session.save(item);
		session.beginTransaction().commit();
		session.close();
	}

	public void setNumberOfProduct(Item item, int numberOfProduct) {
		item.setNumberOfProduct(numberOfProduct);
		Session session = HibernateUI.getSessionFactory().openSession();
		session.update(item);
		session.beginTransaction().commit();
		session.close();
	}

	public void removeProductInItem(Item item) {
		Session session = HibernateUI.getSessionFactory().openSession();
		session.delete(item);
		session.beginTransaction().commit();
		session.close();
	}
	
	public static void main(String[] args) {
		BuyProductImpl buyProductImpl = new BuyProductImpl();
		Session session = HibernateUI.getSessionFactory().openSession();
		Users users = session.get(Users.class, 2);
		Cart cart = null;
		for(Cart c : users.getListCart()) {
			cart = c;
			break;
		}
		if(cart != null) {
			for(Item item : cart.getListItem()) {
				if(item.getId() == 2) {
					buyProductImpl.setNumberOfProduct(item, 100);
				}
			}
		}
	}

}
