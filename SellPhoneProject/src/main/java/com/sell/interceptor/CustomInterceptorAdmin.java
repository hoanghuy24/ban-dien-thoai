package com.sell.interceptor;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.Users;
import com.sell.security.MD5;
import com.sell.service.AdminServices;
import com.sell.service.HomeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomInterceptorAdmin extends HandlerInterceptorAdapter {
	@Autowired
	UserProfileImpl profile;

	@Autowired
	UsersImpl usersImpl;

	@Autowired
	HomeService homeService;

	@Autowired
	AdminServices adminService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("intercep custom");
		MD5 md5 = new MD5();
		Cookie cookie[] = request.getCookies();
		if (cookie != null) {
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("key")) {
					for (Users u : usersImpl.getListUsers()) {
						if (md5.convertToMessageDigest(u.getUsername()).equals(cookie[i].getValue())) {
							request.getSession().setAttribute("user_id", u.getId());
							request.getSession().setAttribute("user", u);
							request.getSession().setMaxInactiveInterval(60 * 60 * 24);
							return true;
						}
					}
				}
			}
		}
		adminService.Logout(request, response);
		return true;
	}

}
