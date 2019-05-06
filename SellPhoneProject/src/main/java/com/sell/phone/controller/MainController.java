package com.sell.phone.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sell.service.HomeService;

@Controller
public class MainController {
	@Autowired
	HomeService homeController;
	@RequestMapping("/")
	public String index(Model model, HttpServletRequest request) {
		homeController.index(model, request);
		return "/Home";
	}
	@RequestMapping("/show-info")
	public String showinfo(){
	    return "/show-info";
	}
}
