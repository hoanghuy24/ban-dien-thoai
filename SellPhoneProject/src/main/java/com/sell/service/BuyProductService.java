package com.sell.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.dao.impl.ItemImpl;
import com.sell.dao.impl.ProductImpl;
import com.sell.entity.Item;
import com.sell.entity.usermanager.Users;
import com.sell.security.MD5;

@Service
public class BuyProductService {

	@Autowired
	ProductImpl productImpl;
	@Autowired
	UsersImpl usersImpl;
	@Autowired
	ItemImpl itemImpl;

	@Autowired
	AdminServices adminServices;

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

	public void order(int idProduct, int quentity, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer id = (Integer) session.getAttribute("user_id");
		System.out.println("id IN ORDER" + id);
		Users users = usersImpl.getUsers(id);
		itemImpl.addProduct(productImpl.getProduct(idProduct), users.getCart(), quentity);
	}

	public void delete(int idProduct, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer id = (Integer) session.getAttribute("user_id");
		Users users = usersImpl.getUsers(id);
		itemImpl.deleteProduct(productImpl.getProduct(idProduct), users.getCart());
	}

	public void updateQuentity(int idProduct, int quentity, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer id = (Integer) session.getAttribute("user_id");
		Users users = usersImpl.getUsers(id);
		itemImpl.updateQuentity(productImpl.getProduct(idProduct), users.getCart(), quentity);
	}

	public void cart(Model model, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		Integer id_user = (Integer) httpSession.getAttribute("user_id");
		Users users = usersImpl.getUsers(id_user);
		System.out.println(users.getCart().getListItem().size());
		model.addAttribute("users", users);
	}

	public boolean check(Users users, HttpServletRequest request, HttpServletResponse response) {

		MD5 md5 = new MD5();
		for (Users u : usersImpl.getListUsers()) {
			if (u.getUsername().equals(users.getUsername())
					&& u.getPassword().equals(users.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("user_id", u.getId());
				session.setAttribute("user", users);
				session.setMaxInactiveInterval(60 * 60 * 12);
				Cookie cookie = new Cookie("key", md5.convertToMessageDigest(u.getUsername()));
				cookie.setMaxAge(60 * 60 * 24);
				response.addCookie(cookie);
				return true;
			}
		}
		return false;

	}

	public void pay(HttpServletRequest request, Model model) {
		HttpSession httpSession = request.getSession();
		Integer id = (Integer) httpSession.getAttribute("user_id");
		Users users = usersImpl.getUsers(id);
		List<Item> listItem = users.getCart().getListItem();
		int sumMoney = 0;
		for (Item item : listItem) {
			sumMoney += (item.getProduct().getPrice() * item.getNumberOfProduct());
		}

		System.out.println("SUmMoney: " + sumMoney);
		model.addAttribute("sumMoney", sumMoney);
		model.addAttribute("listItem", listItem);
	}

	public void Ordered(HttpServletRequest request, Model model) {
		HttpSession httpSession = request.getSession();
		Integer id = (Integer) httpSession.getAttribute("user_id");
		Users users = usersImpl.getUsers(id);
		List<Item> list = itemImpl.productOrdered(users.getCart());
		model.addAttribute("listProducOrdered", list);
	}

	public void destroyOrder(int idProduct, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		Integer id = (Integer) httpSession.getAttribute("user_id");
		Users users = usersImpl.getUsers(id);
		itemImpl.DestroyOrder(idProduct, users.getCart());
	}

	public void createOrder(HttpServletRequest request, String fullName, String phone, String otherInformation,
			String addressOrder) {
		HttpSession httpSession = request.getSession();
		Integer id = (Integer) httpSession.getAttribute("user_id");
		Users users = usersImpl.getUsers(id);
		itemImpl.CreateOrder(users.getCart().getListItem(), fullName, phone, otherInformation, addressOrder, users);
	}
}
