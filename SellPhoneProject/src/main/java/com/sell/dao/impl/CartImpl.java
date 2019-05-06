package com.sell.dao.impl;

import org.hibernate.Session;

import com.sell.dao.CartDAO;
import com.sell.entity.Cart;
import com.sell.hibernate.HibernateUI;

public class CartImpl implements CartDAO{

	public Cart getCart(int id) {
		Session session = HibernateUI.getSessionFactory().openSession();
		Cart cart = session.get(Cart.class, id);
		session.close();
		return cart;
	}
}
