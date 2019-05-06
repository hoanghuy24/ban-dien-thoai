package com.sell.phone.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sell.dao.impl.ProductImpl;
import com.sell.entity.Product;
import com.sell.entity.usermanager.Users;
import com.sell.service.BuyProductService;

@Controller
public class BuyProductController {

	@Autowired
	BuyProductService buyProductService;
	@Autowired
	ProductImpl productImpl;

	@RequestMapping("{phone}/check-{id}")
	public String check(HttpServletRequest request, Model model, @PathVariable("id") int id,
			RedirectAttributes redirectAttributes) {
		Product product = productImpl.getProduct(id);
		if (buyProductService.checkLogin(request, redirectAttributes, model)) {
			return "redirect:/cart";
		}
		return "redirect:/" + product.getCategory().getCategory() + "/" + product.getCode() + "-" + id;

	}
<<<<<<< HEAD
	@RequestMapping("/cart")
	public String cart(){
		return "/Cart/show-cart";
=======
	
	@RequestMapping("cart")
	public String cart(Model model, HttpServletRequest request) {
		buyProductService.cart(model, request);
		return "Cart/cart";
	}

	@RequestMapping(value = "login-buy-{id}", method = RequestMethod.GET)
	public String loginBuy(@PathVariable("id") int id, Model model, @RequestParam(name="error", required = false) String error) {
		model.addAttribute("id", id);
		model.addAttribute("error", error);
		return "admin/login-buy";
	}

	@RequestMapping(value = "login-buy", method = RequestMethod.POST)
	public String loginBuy(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("id") int id, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Users users = new Users(username, password);
		if (buyProductService.check(users, request)) {
			Product product = productImpl.getProduct(id);
			return "redirect:/" + product.getCategory().getCategory() + "/" + product.getCode() + "-" + id;
		}
		redirectAttributes.addAttribute("error", "Wrong Username or Password !!!");
		return "redirect:/login-buy-" + id;
	}
	
	@RequestMapping("test")
	public String test(RedirectAttributes attributes) {
		attributes.addAttribute("user", new Users("Hoang", "q21"));
		return "redirect:test1";
	}
	
	@RequestMapping("test1")
	public String test1(@RequestParam("user") Users users) {
		System.out.println(users.getUsername());
		return "Home";
>>>>>>> 399b2d61174f81511b2e1b29654c73d71fea7539
	}

}
