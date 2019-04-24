package com.sell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.sell.dao.impl.ProductImpl;

@Service
public class HomeService {

	@Autowired
	ProductImpl product;
	
	public void index(Model model) {
		model.addAttribute("listProductHightLight", product.getProductNew(IDCategory.numberOfproductHome));
		model.addAttribute("listProductNew", product.getProductNew(IDCategory.numberOfproductHome));
	}
	
}
