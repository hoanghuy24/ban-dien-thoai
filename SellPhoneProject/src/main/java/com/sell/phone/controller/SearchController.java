package com.sell.phone.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sell.entity.Product;
import com.sell.service.Search;

@Controller
public class SearchController {

	@RequestMapping("/result")
	public String resultSearch(@RequestParam("search") String keyword, Model model) {
		return "view/ResultSearch";
	}
	
}
