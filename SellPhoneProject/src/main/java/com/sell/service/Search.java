package com.sell.service;

import java.util.List;
import javax.persistence.Query;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sell.entity.Product;
import com.sell.hibernate.HibernateUI;

@Service
public class Search {

	@Autowired
	PaginationService paginationService;

	public String PaginationSearch(String keyword, Model model, int page) {
		int size = getResultSearch(keyword).size();
		int numberOfPage = paginationService.page(getResultSearch(keyword), IDCategory.total);
		if (size == 0) {
			model.addAttribute("notResult", "Not Result");
			return "ResultSearch";
		}
		model.addAttribute("pageID", page);
		model.addAttribute("keyword", keyword);
		model.addAttribute("result", "There " + size + " result for " + keyword);
		model.addAttribute("listResult", pagination(page, keyword, IDCategory.total));
		model.addAttribute("page", numberOfPage);
		return "ResultSearch";
	}

	@SuppressWarnings("unchecked")
	public List<Product> pagination(int page, String keyword, int total) {
		int first = 0;
		if (page > 1) {
			first = (first + total) * (page - 1);
			System.out.println(first);
		}
		List<Product> list = null;
		Session session = HibernateUI.getSessionFactory().openSession();
		Query query = session.createQuery(
				"From " + Product.class.getName() + " as p where p.name like'%" + keyword + "%' order by p.id desc");
		query.setFirstResult(first);
		System.out.println("Page: "+ page +"\nFirst: " + first +"\nTotal :"+ total);
		query.setMaxResults(total);
		list = query.getResultList();
		session.close();
		return list;
	}

	public List<Product> getResultSearch(String keyword) {
		Session session = HibernateUI.getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Product> list = session.createQuery(
				"From " + Product.class.getName() + " as p where p.name like '%" + keyword + "%' order by p.id desc")
				.getResultList();
		session.close();
		return list;
	}

	/*
	 * public String check(String keyword, Model model) { if
	 * (getResultSearch(keyword).size() == 0) { model.addAttribute("notResult",
	 * "Không có kết quả nào cho " + keyword); return "view/ResultSearch"; }
	 * model.addAttribute("result", "Có " + getResultSearch(keyword).size() +
	 * " kết quả cho " + keyword); model.addAttribute("listResult",
	 * getResultSearch(keyword)); return "view/ResultSearch"; }
	 */
}
