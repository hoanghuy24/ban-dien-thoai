package com.sell.phone.controller.admin.controller;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.dao.impl.CategoryImpl;
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

@Controller
@RequestMapping("/admin")
public class ManagerController {
	@Autowired
	UserProfileImpl userProfileImpl;
	@Autowired
	CategoryImpl categoryImpl;

	@RequestMapping("/user")
	public String user(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		int id = (Integer) request.getSession().getAttribute("user_id");
		model.addAttribute("user", userProfileImpl.getUserProfileByUserId(id));
		return "/admin/user";
	}

	@PostMapping("/update-profile")
	public String updateProfile(@ModelAttribute UserProfile userProfile, RedirectAttributes redirectAttributes) {
		if (this.userProfileImpl.updateProfile(userProfile)) {
			redirectAttributes.addAttribute("msg", "Edit success !");
			System.out.println("complete");
		} else {
			redirectAttributes.addAttribute("msg", "Edit Fail !");
			System.out.println(userProfile);
		}

		return "redirect:/admin/user";
	}

	@GetMapping("/update-profile")
	public String updateProfile() {
		return "redirect:/admin/user";
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
		return "admin/form-add";
	}

	//@PostMapping("add-product")
	/*public String addProduct(@RequestParam(name = "price", defaultValue = "0") int price,
			@RequestParam(name = "discount", defaultValue = "0") int discount,
			@RequestParam(name = "numberOfProduct", defaultValue = "0") int numberOfProduct,
			@RequestParam("name") String name, @RequestParam("")) {
		
		return "redirect:/";
	}*/
	
	@PostMapping("add-product")
	public String addProduct(HttpServletRequest request) {
		System.out.println(request.getParameter("name"));
		return "";
	}
}
