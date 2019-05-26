package com.sell.phone.controller.admin.controller;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.dao.impl.CategoryImpl;
import com.sell.dao.impl.ProductImpl;
import com.sell.entity.Category;
import com.sell.entity.Product;
import com.sell.entity.usermanager.UserProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
public class ManagerController {
	@Autowired
	UserProfileImpl userProfileImpl;
	@Autowired
	CategoryImpl categoryImpl;
	@Autowired
	ProductImpl productImpl;

	@RequestMapping("/user")
	public String user(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		int id = (Integer) request.getSession().getAttribute("user_id");
		System.out.println("id = " +id);
		if(id == 0) {
			
		}
		model.addAttribute("user", userProfileImpl.getUserProfileByUserId(id));
		return "/admin/user";
	}


	@RequestMapping("/dashboard")
	public String dashboard() {
		return "/admin/dashboard";
	}

	@RequestMapping("/map")
	public String map() {
		return "/admin/map";
	}

	@GetMapping("add-product")
	public String addProduct(Model model) {
		model.addAttribute("category", categoryImpl.getListCategory());
		Product product = new Product();
		product.setName("Iphone");
		model.addAttribute("product", product);
		return "admin/form-add";
	}

	@PostMapping("add-product")
	public String addProduct(@RequestParam("discount") int discount,
			@RequestParam("numberOfProduct") int numberOfProduct, @ModelAttribute("product") Product product,
			@RequestParam("category") int category) {
		System.out.println(discount);
		System.out.println("come here");
		Category category2 = categoryImpl.getCategory(category);
		product.setDiscount(discount);
		product.setNumberOfProduct(numberOfProduct);
		product.setCategory(category2);
		productImpl.insertProduct(product);

		return "redirect:complete";
	}

	int a = 5;

	@GetMapping("complete")
	public String addComplete(HttpServletResponse response, Model model) {
		response.setIntHeader("refresh", 1);
		model.addAttribute("s", a);
		a--;
		if (a == 0) {
			return "redirect:add-product";
		}
		return "admin/Complete";
	}

	int notAdmin = 5;
	@GetMapping("not-admin")
	public String notAdmin(HttpServletResponse response, Model model) {
		response.setIntHeader("refresh", 1);
		notAdmin --;
		model.addAttribute("second", notAdmin);
		if(notAdmin == 0) {
			return "redirect:/";
		}
		return "admin/not-admin";
		
	}
}
