package com.sell.phone.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			int quentity = Integer.parseInt(request.getParameter("quentity"));
			// System.out.println(i);
			// redirectAttributes.addAttribute("quentity", i);
			redirectAttributes.addAttribute("id", id);
			redirectAttributes.addAttribute("quentity", quentity);
			return "redirect:/order-product";
		}
		return "redirect:/" + product.getCategory().getCategory() + "/" + product.getCode() + "-" + id;

	}

	@RequestMapping("/order-product")
	public String order(HttpServletRequest request, Model model) {
		System.out.println("This is method mapping order-product");

		int quentity = Integer.parseInt(request.getParameter("quentity"));
		int idProduct = Integer.parseInt(request.getParameter("id"));
		System.out.println(quentity + "/ " + idProduct);
		System.out.println("ID: " + idProduct);

		buyProductService.order(idProduct, quentity, request);
		return "redirect:cart";
	}

	@RequestMapping("cart")
	public String cart(Model model, HttpServletRequest request) {
		buyProductService.cart(model, request);
		return "Cart/show-cart";
	}

	@RequestMapping("delete-{id}")
	public String delete(@PathVariable("id") int id, HttpServletRequest request) {
		buyProductService.delete(id, request);
		return "redirect:cart";
	}

	@RequestMapping("update-{id}")
	public String updateQuentity(@PathVariable("id") int id, @RequestParam("quentity") int quentity,
			HttpServletRequest request) {
		buyProductService.updateQuentity(id, quentity, request);
		return "redirect:cart";
	}

	@RequestMapping("pay")
	public String pay(Model model, HttpServletRequest request) {
		buyProductService.pay(request, model);
		return "Cart/pay";
	}

	@RequestMapping(value = "login-buy-{id}", method = RequestMethod.GET)
	public String loginBuy(@PathVariable("id") int id, Model model,
			@RequestParam(name = "error", required = false) String error) {
		model.addAttribute("id", id);
		model.addAttribute("error", error);
		return "admin/login-buy";
	}

	@RequestMapping(value = "login-buy", method = RequestMethod.POST)
	public String loginBuy(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("id") int id, Model model, HttpServletRequest request,
			RedirectAttributes redirectAttributes, HttpServletResponse response) {
		Users users = new Users(username, password);
		if (buyProductService.check(users, request, response)) {
			Product product = productImpl.getProduct(id);
			return "redirect:/" + product.getCategory().getCategory() + "/" + product.getCode() + "-" + id;
		}
		redirectAttributes.addAttribute("error", "Wrong Username or Password !!!");
		return "redirect:/login-buy-" + id;
	}

	@RequestMapping("ordered")
	public String ordered(HttpServletRequest request, Model model) {
		buyProductService.Ordered(request, model);
		return "Cart/Product-Ordered";
	}

	@RequestMapping("destroy-order-{id}")
	public String destroyOrder(@PathVariable("id")int id, HttpServletRequest request) {
		buyProductService.destroyOrder(id, request);
		return "redirect:ordered";
	}

	@RequestMapping("continue-pay")
	public String continuePay(HttpServletRequest request, @RequestParam("name") String fullName, @RequestParam("phonenumber") String phone, @RequestParam("other") String ortherInformation,
			@RequestParam("address") String addressOrder) {
		buyProductService.createOrder(request, fullName, phone, ortherInformation, addressOrder);
		return "redirect:ordered";
	}
	
	@RequestMapping("/admin/tets-form")
	public String te() {
		return "admin/form-add";
	}

}
