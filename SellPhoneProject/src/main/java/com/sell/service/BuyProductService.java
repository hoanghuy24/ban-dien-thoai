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
		Users users = usersImpl.getUsers(2);
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("user_id", users.getId());
		Product product = productImpl.getProduct(id);
		// httpSession.setAttribute("user", product);
		if (httpSession.getAttribute("user_id") == null) {
			//redirectAttributes.addAttribute(product);
			redirectAttributes.addAttribute("error", "Chua Login");
			System.out.println("redirect");
			return "redirect:/"+product.getCategory().getCategory()+"/"+product.getCode()+"-"+id;
		}
		model.addAttribute("users", users);
		return "Cart/cart"; 
	}
	
	
}
