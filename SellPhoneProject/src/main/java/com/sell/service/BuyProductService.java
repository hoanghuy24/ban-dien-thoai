package com.sell.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.dao.impl.ProductImpl;
import com.sell.entity.Product;
import com.sell.entity.usermanager.Users;

@Service
public class BuyProductService {

	@Autowired
	ProductImpl productImpl;
	@Autowired
	UsersImpl usersImpl;

	public String checkLogin(HttpServletRequest request, int id, RedirectAttributes redirectAttributes, Model model) {

		System.out.println("this is phone check id");
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("user_id") == null) {
			Product product = productImpl.getProduct(id);
			//redirectAttributes.addAttribute(product);
			redirectAttributes.addAttribute("error", "Chua Login");
			System.out.println("redirect");
			return "redirect:/" + product.getCategory().getCategory() + "/" + product.getCode() + "-" + id;
		}

		Integer user_id = (Integer) httpSession.getAttribute("user_id");

		System.out.println(user_id);
		Users users = usersImpl.getUsers(user_id);
		model.addAttribute("users", users);

		return "Cart/cart";
	}

}
