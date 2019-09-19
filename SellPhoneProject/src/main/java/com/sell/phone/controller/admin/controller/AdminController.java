package com.sell.phone.controller.admin.controller;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.entity.usermanager.Users;
import com.sell.service.AdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
public class AdminController {
	@Autowired
	AdminServices adminServices;
	@Autowired
	UserProfileImpl profile;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "msg", required = false) String msg, Model model,
			HttpServletRequest request) {
		if (adminServices.checkCookieService(request)) {
			return "redirect:/";
		} else {
			model.addAttribute("msg", msg);
			return "admin/login";
		}
	}

	@RequestMapping("admin/login")
	public String adminLogin() {
		return "redirect:login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password, RedirectAttributes redirectAttributes,
			HttpServletResponse response) {
		if (adminServices.resultLogin(username, password, redirectAttributes, response)) {
			return "redirect:/";
		} else {
			return "redirect:/login";

		}
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		adminServices.Logout(request, response);
		return "redirect:/";
	}

	@GetMapping("register")
	public String register(Model model) {
		model.addAttribute("newUser", new Users());
		return "admin/register";
	}

	@PostMapping("register")
	public String register(@Valid @ModelAttribute("newUser") Users users, BindingResult result, Model model,
			HttpServletResponse response) {
		if (result.hasErrors()) {
			return "admin/register";
		}
		System.out.println("HELLO");
		adminServices.register(users, response);
		return "redirect:/";
	}

	int timeOut = 5;

	@GetMapping("not-admin")
	public String notAdmin(HttpServletResponse response, Model model) {
		System.out.println("Vao day");
		response.setIntHeader("refresh", 1);
		timeOut--;
		if (timeOut == 0) {
			timeOut = 5;
			return "redirect:/";
		}
		model.addAttribute("timeOut", timeOut);
		return "admin/not-admin";
	}
	@GetMapping("admin")
	public String admin() {
		return "redirect:admin/";
	}

    public void Say() {
        System.out.println("HELLO WORLD");
    }
	
}
