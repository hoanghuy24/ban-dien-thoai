package com.sell.test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sell.entity.usermanager.UserProfile;
import com.sell.entity.usermanager.Users;
import com.sell.hibernate.HibernateUI;

@Controller
public class Control {

	@GetMapping("testValid")
	public String test(Model model, HttpServletRequest request) {

		return "formValid";
	}

	@PostMapping("testValid")
	public String test(@Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request,
			HttpServletResponse response) {
		if (result.hasErrors()) {
			return "formValid";
		}
		HttpSession session = request.getSession();
		session.setAttribute("test", user);
		Cookie cookie = new Cookie("testU", user.getUsername());
		cookie.setMaxAge(60);
		response.addCookie(cookie);
		return "Home";
	}
}
