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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
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
		System.out.println("id = " + id);
		if (id == 0) {

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
		model.addAttribute("product", product);
		return "admin/form-add";
	}

	@PostMapping("add-product")
	public String addProduct(@RequestParam(name = "category_data", required = false) int category,
			@RequestParam(name = "discount", required = false) int discount,
			@RequestParam(name = "numberOfProduct", required = false) int numberOfProduct,
			@ModelAttribute("product") Product product, Model model, RedirectAttributes attributes) {
		product.setDiscount(discount);
		product.setNumberOfProduct(numberOfProduct);
		if (category == -1) {
			model.addAttribute("product", product);
			return "admin/form-add";
		}
		Category category2 = categoryImpl.getCategory(category);
		product.setCategory(category2);
		productImpl.insertProduct(product);
		List<Product>l = new ArrayList<Product>();
		l.add(product);
		model.addAttribute("product", l);
		System.out.println("ID Product: " + product.getId());

		return "admin/Category";
	}

	int a = 5;

	@GetMapping("complete")
	public String addComplete(HttpServletResponse response, Model model, HttpServletRequest request) {
		response.setIntHeader("refresh", 1);
		model.addAttribute("s", a);
		a--;
		if (a <= 0) {
			Product product = (Product) request.getAttribute("product");
			System.out.println(product);
			model.addAttribute("product", product);
			return "admin/show-info";
		}
		return "admin/Complete";
	}

	@RequestMapping("/")
	public String managerCategory(Model model) {
		List<Category> listCategory = categoryImpl.getListCategory();
		if (listCategory == null || listCategory.size() == 0) {
			return "admin/Category";
		}
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("product", productImpl.getAllListProduct());
		return "admin/Category";
	}

	@RequestMapping("/delete/{name}-{id}")
	public String delete(@PathVariable("id") int id) {
		Product product = productImpl.getProduct(id);
		productImpl.deleteProduct(product);
		int root = product.getCategory().getId();
		return "redirect:/admin/"+ product.getCategory().getCategory() +"-" + root;
	}
	@RequestMapping("/update/{name}-{id}")
	public String update(@PathVariable("id") int id, Model model) {
		Product product = productImpl.getProduct(id);
		model.addAttribute("product", product);
		
		return "admin/Form-Edit";
	}

	@RequestMapping("/{category}-{id}")
	public String category(@PathVariable("id") int category, Model model) {
		System.out.println("vao day roi");
		List<Product> liProducts = productImpl.getListProductByCategory(categoryImpl.getCategory(category));
		model.addAttribute("product", liProducts);
		return "admin/Category";
	}

}
