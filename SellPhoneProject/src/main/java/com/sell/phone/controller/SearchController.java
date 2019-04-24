package com.sell.phone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sell.service.Search;

@Controller
public class SearchController {

	@Autowired
	Search search;
	
	@RequestMapping("/result")
	public String resultSearch(@RequestParam("search") String keyword, Model model) {
		return search.PaginationSearch(keyword, model, 0);
	}
	
	@RequestMapping("result-page-{page}")
	public String resultSearch(@PathVariable("page") int page, @RequestParam("keyword") String keyword, Model model) {
		return search.PaginationSearch(keyword, model, page);
	}
	
}
