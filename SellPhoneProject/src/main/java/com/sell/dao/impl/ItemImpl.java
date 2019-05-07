package com.sell.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Component;

import com.sell.dao.ItemDAO;
import com.sell.entity.Cart;
import com.sell.entity.Item;
import com.sell.entity.PersonOrder;
import com.sell.entity.Product;
import com.sell.entity.usermanager.Users;
import com.sell.hibernate.HibernateUI;

@Component
public class ItemImpl implements ItemDAO {

	public boolean addProduct(Product product, Cart cart, int quentity) {
		Session session = HibernateUI.getSessionFactory().openSession();
		for (Item i : cart.getListItem()) {
			System.out.println("ID in Item: " + i.getProduct().getId());
			System.out.println("ID product add: " + product.getId());
			if (i.getProduct().getId() == product.getId()) {
				int quentityFirst = i.getNumberOfProduct();
				quentity += quentityFirst;
				i.setNumberOfProduct(quentity);
				session.update(i);
				session.beginTransaction().commit();
				session.close();
				return false;
			}
		}
		System.out.println("Duoi");
		Item item = new Item();
		item.setCart(cart);
		item.setProduct(product);
		item.setNumberOfProduct(quentity);
		session.save(item);
		session.beginTransaction().commit();
		session.close();

		return true;
	}

	public void deleteProduct(Product product, Cart cart) {
		Session session = HibernateUI.getSessionFactory().openSession();
		for (Item item : cart.getListItem()) {
			if (item.getProduct().getId() == product.getId()) {
				session.delete(item);
				session.beginTransaction().commit();
				session.close();
				break;
			}
		}
	}

	public boolean updateQuentity(Product product, Cart cart, int quentity) {
		Session session = HibernateUI.getSessionFactory().openSession();
		for (Item item : cart.getListItem()) {
			if (item.getProduct().getId() == product.getId()) {
				item.setNumberOfProduct(quentity);
				session.update(item);
				session.beginTransaction().commit();
				session.close();

				return true;
			}
		}
		return false;
	}

	public List<Item> productOrdered(Cart cart) {
		List<Item> list = new ArrayList<Item>();
		System.out.println(cart.getListItem().size());
		for(Item item : cart.getListItem()) {
			if(item.getStatus() == "ordered") {
				list.add(item);
			}
		}
		return list;
	}

	public void DestroyOrder(int id, Cart cart) {
		Session session = HibernateUI.getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<PersonOrder> listPersonOrder = session.createQuery("From " + PersonOrder.class.getName()).getResultList();
		for (Item item : cart.getListItem()) {
			if (item.getProduct().getId() == id) {
				item.setStatus("No");
				session.update(item);
				for(PersonOrder person : listPersonOrder) {
					if(person.getItem().getId() == item.getId()) {
						person.setStatus("cancel");
						session.update(person);
					}
				}
				session.beginTransaction().commit();
				break;
			}
		}
		session.close();
	}

	public void CreateOrder(List<Item> list, String fullName, String phone, String otherInformation,
			String addressOrder, Users users) {
		Session session = HibernateUI.getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Users> listUsers = session.createQuery("From " + Users.class.getName()).getResultList();
		for (Item item : list) {
			item.setStatus("ordered");
			session.update(item);
			for (Users u : listUsers) {
				if (u.getId_role().getId() == 2) {
					PersonOrder order = new PersonOrder(1, fullName, "order", phone, addressOrder, otherInformation,
							item, u);
					session.save(order);
				}
			}
		}
		session.beginTransaction().commit();
		session.close();
	}

}
