package com.sell.test;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Control {

	@GetMapping("testValid")
	public String test(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie [] cookies = request.getCookies();
		for(Cookie c: cookies) {
			System.out.println("Name "+c.getName());
			System.out.println("Value: "+c.getValue());
			if(c.getName().equals("testU")) {
				return "Home";
			}
		}
		if("11C7E22310AE860B3161BFC0EE0221F3".equals("93092CA83E2FCB9E18C24AEC871640E7")) {
			System.out.println(true);
		}
		else {
			System.out.println("Not true");
		}
		
		if(session.getAttribute("test") != null) {
			return "Home";
		}
		User user = new User();
		user.setUsername("Hahahah");
		user.setPassword("1234455");
		model.addAttribute("user", user);
		return "formValid";
	}
	
	@PostMapping("testValid")
	public String test(@Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		if(result.hasErrors()) {
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
