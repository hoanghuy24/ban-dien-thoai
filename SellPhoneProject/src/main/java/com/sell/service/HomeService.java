package com.sell.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.dao.impl.ProductImpl;
import com.sell.entity.usermanager.Users;
import com.sell.security.MD5;

@Service
public class HomeService {

	@Autowired
	ProductImpl product;
	@Autowired
	UsersImpl usersImpl;

	public void index(Model model, HttpServletRequest request) {
		model.addAttribute("listProductHightLight", product.getProductNew(IDCategory.numberOfproductHome));
		model.addAttribute("listProductNew", product.getProductNew(IDCategory.numberOfproductHome));
	}
	
	public boolean checkCookieService(HttpServletRequest request) {
		Cookie cookie[] = request.getCookies();
		List<Users> listUser = usersImpl.getListUsers();
		MD5 md5 = new MD5();
		if (cookie != null) {
			for (Cookie c : cookie) {
				if (c.getName().equals("key")) {
					for (Users users : listUser) {
						if (c.getValue().equals(md5.convertToMessageDigest(users.getUsername()))) {
							return true;
						}
					}
				}
			}
		}
		return false;
	}

}
