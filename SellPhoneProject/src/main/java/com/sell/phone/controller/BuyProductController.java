package com.sell.phone.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sell.dao.impl.ProductImpl;
import com.sell.entity.Product;
import com.sell.service.BuyProductService;

@Controller
public class BuyProductController {

	@Autowired
	BuyProductService buyProductService;

	@RequestMapping("{phone}/check-{id}")
	public String check(HttpServletRequest request, Model model, @PathVariable("id") int id,
			RedirectAttributes redirectAttributes) {
		return buyProductService.checkLogin(request, id, redirectAttributes, model);
	}
	
	

}
