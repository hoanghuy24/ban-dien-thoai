package com.sell.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.dao.impl.ProductImpl;
import com.sell.entity.Cart;
import com.sell.entity.Product;
import com.sell.entity.usermanager.Users;

@Service
public class BuyProductService {

	@Autowired
	ProductImpl productImpl;
	@Autowired
	UsersImpl usersImpl;
	public boolean checkLogin(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) {
		System.out.println("this is phone check id");
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("user_id") == null) {
			redirectAttributes.addAttribute("error", "Please Login");
			System.out.println("redirect");
			return false;
		}
		return true;
	}
	
	public void order() {
		
	}
	
	
	public void cart(Model model, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		Integer id_user = (Integer) httpSession.getAttribute("user_id");
		Users users = usersImpl.getUsers(id_user);
		model.addAttribute("users", users);
	}

	public boolean check(Users users, HttpServletRequest request) {
		for (Users u : usersImpl.getListUsers()) {
			if (u.getUsername().equalsIgnoreCase(users.getUsername())
					&& u.getPassword().equalsIgnoreCase(users.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("user_id", u.getId());
				return true;
			}
		}
		return false;
	}
	
	public void OrderProduct(int id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer idUser = (Integer) session.getAttribute("user_id");
		
	}
}
