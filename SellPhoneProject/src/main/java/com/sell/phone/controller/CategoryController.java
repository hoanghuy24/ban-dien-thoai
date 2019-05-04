package com.sell.phone.controller;

import com.sell.dao.impl.CategoryImpl;
import com.sell.dao.impl.ProductImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sell.service.CategoryService;
import com.sell.service.IDCategory;

@Controller
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @Autowired
    CategoryImpl categoryImpl;

    @Autowired
    ProductImpl productImpl;

    @RequestMapping("/htc")
    public String htc(Model model) {
        categoryService.htc(model, 0);
        return "/Category";
    }

    @RequestMapping("/iphone")
    public String iphone(Model model) {
        categoryService.iphone(model,0);
        return "/Category";
    }

    @RequestMapping("/samsung")
    public String samsung(Model model) {
        categoryService.samsung(model,0);

        return "/Category";
    }

    @RequestMapping("/nokia")
    public String nokia(Model model) {
        categoryService.nokia(model, 0);
        return "/Category";
    }

    @RequestMapping("/blackberry")
    public String blackberry(Model model) {
        categoryService.blackberry(model,0);

        return "/Category";
    }

    @RequestMapping("/sony")
    public String sony(Model model) {
        categoryService.sony(model, 0);
        return "/Category";
    }
    
    
    @RequestMapping("HTC-page-{i}")
    public String htcPage(@PathVariable("i") int page, Model model) {
    	categoryService.htc(model, page);
        return "/Category";
    }
    
    @RequestMapping("SONY-page-{i}")
    public String sonyPage(@PathVariable("i") int page, Model model) {
    	categoryService.sony(model, page);
        return "/Category";
    }
    @RequestMapping("SamSung-page-{i}")
    public String SamSungPage(@PathVariable("i") int page, Model model) {
    	categoryService.samsung(model, page);
        return "/Category";
    }
    @RequestMapping("Iphone-page-{i}")
    public String iphonePage(@PathVariable("i") int page, Model model) {
    	categoryService.htc(model, page);
        return "/Category";
    }
    @RequestMapping("NOKIA-page-{i}")
    public String nokiaPage(@PathVariable("i") int page, Model model) {
    	categoryService.nokia(model, page);
        return "/Category";
    }
    @RequestMapping("Blackberry-page-{i}")
    public String blackberryPage(@PathVariable("i") int page, Model model) {
    	categoryService.blackberry(model, page);
        return "/Category";
    }
    

    @RequestMapping("/{category}/{code}-{id}")
    public String show(@PathVariable("id") int id, Model model, @RequestParam(name="error", required = false) String error) {
		System.out.println("Come");
		if(error != null) {
			model.addAttribute("error", error);
		}
        model.addAttribute("product", productImpl.getProduct(id));
        return "/show-info";
    }

    @RequestMapping("/{category}/iphone")
    public String redirectIphone() {
        System.out.println("Here");
        return "redirect:/iphone";
    }

    @RequestMapping("/{category}/samsung")
    public String redirectSamsung() {
        System.out.println("Here");
        return "redirect:/samsung";
    }

    @RequestMapping("/{category}/htc")
    public String redirectHtc() {
        System.out.println("Here");
        return "redirect:/htc";
    }

    @RequestMapping("/{category}/blackberry")
    public String redirectBlack() {
        System.out.println("Here");
        return "redirect:/blackberry";
    }

    @RequestMapping("/{category}/sony")
    public String redirectSony() {
        System.out.println("Here");
        return "redirect:/sony";
    }

    @RequestMapping("/{category}/nokia")
    public String redirectNokia() {
        System.out.println("Here");
        return "redirect:/nokia";
    }
}
