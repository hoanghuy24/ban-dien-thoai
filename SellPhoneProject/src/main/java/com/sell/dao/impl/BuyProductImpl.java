package com.sell.dao.impl;

import org.hibernate.Session;
import org.springframework.stereotype.Component;

import com.sell.dao.BuyProductDAO;
import com.sell.entity.Item;
import com.sell.hibernate.HibernateUI;
@Component
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
}
