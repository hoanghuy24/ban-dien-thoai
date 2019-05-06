package com.sell.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.dao.impl.ProductImpl;

@Service
public class HomeService {

	@Autowired
	ProductImpl product;
	@Autowired
	UsersImpl usersImpl;

	public void index(Model model, HttpServletRequest request) {
		model.addAttribute("listProductHightLight", product.getProductNew(IDCategory.numberOfproductHome));
		model.addAttribute("listProductNew", product.getProductNew(IDCategory.numberOfproductHome));
	}

}
