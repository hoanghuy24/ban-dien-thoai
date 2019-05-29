package com.sell.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.Users;

public class RoleAdmin extends HandlerInterceptorAdapter {

	@Autowired
	UsersImpl userImpl;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/*
		 * System.out.println("Interceptor admin");
		 * 
		 * MD5 md5 = new MD5(); Cookie cookie[] = request.getCookies(); if (cookie !=
		 * null) { for (int i = 0; i < cookie.length; i++) { if
		 * (cookie[i].getName().equals("key")) { for (Users u : userImpl.getListUsers())
		 * { if
		 * (md5.convertToMessageDigest(u.getUsername()).equals(cookie[i].getValue())) {
		 * request.getSession().setAttribute("user_id", u.getId());
		 * request.getSession().setAttribute("user", u);
		 * request.getSession().setMaxInactiveInterval(60 * 60 * 24); } } } } }
		 */
		Integer id = (Integer) request.getSession().getAttribute("user_id");
		System.out.println("ID: " + id);
		if (id != null) {
			Users user2 = userImpl.getUsers(id);
			if (user2 != null) {
				if (user2.getId_role().getId() == 2) {
					return true;
				}
			}

		}
		System.out.println("Xong day");
		String path = request.getServletContext().getContextPath();
		response.sendRedirect(path + "/not-admin");
		return false;

	}

}
