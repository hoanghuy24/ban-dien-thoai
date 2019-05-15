package com.sell.phone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

	@RequestMapping("error-404")
	public String Error404() {
		return "Error/404";
	}
	
	@RequestMapping("hihi")
	public String hihi() {
		return "hahahhaha";
	}
	
}
