package com.sell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.sell.dao.impl.ProductImpl;
import com.sell.entity.Product;

@Service
public class CategoryService {
	
    @Autowired
    ProductImpl product;

    @Autowired
    PaginationService paginationService;
    
    public void htc(Model model, int page) {
    	paginationService.Pagination(page, model, IDCategory.categoryHTC, IDCategory.total);
    }

    public void iphone(Model model, int page) {
    	paginationService.Pagination(page, model, IDCategory.categoryIphone, IDCategory.total);

    }

    public void samsung(Model model, int page) {
    	paginationService.Pagination(page, model, IDCategory.categorySamsung, IDCategory.total);
    }

    public void nokia(Model model, int page) {
    	paginationService.Pagination(page, model, IDCategory.categoryNokia, IDCategory.total);

    }

    public void blackberry(Model model, int page) {
    	paginationService.Pagination(page, model, IDCategory.categoryBlackberry, IDCategory.total);

    }

    public void sony(Model model, int page) {
    	paginationService.Pagination(page, model, IDCategory.categorySony, IDCategory.total);
    }
    
    public void category(String category) {
    	
    }
    
    public void ProductView(Model model, int id) {
    	Product p = product.getProduct(id);
    	model.addAttribute("product", p);
    }
    
}
