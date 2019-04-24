package com.sell.service;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.springframework.ui.Model;

import com.sell.entity.Product;
import com.sell.hibernate.HibernateUI;

public class Search {
	public List<Product> getResultSearch(String keyword) {
		Session session = HibernateUI.getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		Query query = session.createQuery("From Product as P Where P.name like '%" + keyword + "%'");
		List<Product> list = query.getResultList();
		session.close();
		return list;

	}

	public String check(String keyword, Model model) {
		if(getResultSearch(keyword).size() == 0) {
			model.addAttribute("notResult", "Không có kết quả nào cho " + keyword);
			return "view/ResultSearch";
		}
		model.addAttribute("result", "Có " + getResultSearch(keyword).size() + " kết quả tìm kiếm cho " + keyword);
		model.addAttribute("listResult", getResultSearch(keyword));
		return "view/ResultSearch";
	}

	public static void main(String[] args) {
		Search s = new Search();
		for (Product p : s.getResultSearch("Ipho")) {
			System.out.println(p.getName());
		}
	}
}
