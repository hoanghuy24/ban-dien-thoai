package com.sell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.sell.dao.impl.CategoryImpl;
import com.sell.dao.impl.ProductImpl;
import com.sell.entity.Category;

@Service
public class CategoryService {

    @Autowired
    ProductImpl product;

    public void htc(Model model) {
        Category category = new CategoryImpl().getCategory(1);
        model.addAttribute("category", category.getCategory());
        model.addAttribute("product", product.getListProductByCategory(category));
    }

    public void iphone(Model model) {
        Category category = new CategoryImpl().getCategory(2);
        model.addAttribute("category", category.getCategory());
        model.addAttribute("product", product.getListProductByCategory(category));
    }

    public void samsung(Model model) {
        Category category = new CategoryImpl().getCategory(6);
        model.addAttribute("category", category.getCategory());

        model.addAttribute("product", product.getListProductByCategory(category));
    }

    public void nokia(Model model) {
        Category category = new CategoryImpl().getCategory(3);
        model.addAttribute("category", category.getCategory());
        model.addAttribute("product", product.getListProductByCategory(category));
    }

    public void blackberry(Model model) {
        Category category = new CategoryImpl().getCategory(5);
        model.addAttribute("category", category.getCategory());

        model.addAttribute("product", product.getListProductByCategory(category));
    }

    public void sony(Model model) {
        Category category = new CategoryImpl().getCategory(4);
        model.addAttribute("category", category.getCategory());
        model.addAttribute("product", product.getListProductByCategory(category));
    }

}
