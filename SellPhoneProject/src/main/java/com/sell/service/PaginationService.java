package com.sell.service;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sell.dao.impl.ProductImpl;
import com.sell.entity.Category;
import com.sell.entity.Product;
import com.sell.hibernate.HibernateUI;
@Service
public class PaginationService {
	
	public List<Product> pagination(int page, int idCategory, int total) {
		int first = 0;
		if(page > 1) {
			first = (first + total) * (page -1);
			System.out.println(first);
		}
		List<Product> list = null;
		Session session = HibernateUI.getSessionFactory().openSession();
		Query query = session.createQuery(
				"From " + Product.class.getName() + " as p where p.category =" + idCategory + " order by p.id desc");
		query.setFirstResult(first);
		query.setMaxResults(total);
		list = query.getResultList();
		session.close();
		return list;
	}
	
	
	public void Pagination(int page, Model model, int idCategory, int total) {
		Session session = HibernateUI.getSessionFactory().openSession();
		Category category = session.get(Category.class, idCategory);
		session.close();
		model.addAttribute("page", page(getListProductById(idCategory), total));
		model.addAttribute("category", category.getCategory());
		model.addAttribute("product", pagination(page, idCategory, total));
	}
	
	public int page(List<Product> list, int numberOfQuey) {
		int size = list.size();
		int numberOfPage = size / numberOfQuey;
		
		if(size % numberOfQuey != 0) {
			numberOfPage ++;
		}
		
		return numberOfPage;
	}
	
	public List<Product> getListProductById(int id) {
		Session session = HibernateUI.getSessionFactory().openSession();
		Category category = session.get(Category.class, id);
		return category.getListProduct();
	}
	
}
