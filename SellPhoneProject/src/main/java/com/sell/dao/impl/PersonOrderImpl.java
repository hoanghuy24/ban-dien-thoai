package com.sell.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.sell.dao.PersonOrderDAO;
import com.sell.entity.PersonOrder;
import com.sell.hibernate.HibernateUI;

public class PersonOrderImpl implements PersonOrderDAO {

	public List<PersonOrder> getListPersonOrder() {
		Session session = HibernateUI.getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<PersonOrder> list = session.createQuery("From " + PersonOrder.class.getName() +" as p where p.status= order").getResultList();
		return list;
	}
	
	public List<PersonOrder> getListPersonOrderCancel() {
		Session session = HibernateUI.getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<PersonOrder> list = session.createQuery("From " + PersonOrder.class.getName() +" as p where p.status= cancel").getResultList();
		return list;
	}

}
