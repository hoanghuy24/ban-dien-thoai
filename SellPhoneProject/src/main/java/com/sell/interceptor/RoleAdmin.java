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
		Integer id = (Integer) request.getAttribute("user_id");
		if (id != null) {
			Users user2 = userImpl.getUsers(id);
			if (user2 != null) {
				if (user2.getId_role().getId() == 1) {
					return true;
				}
			}

		}
		response.sendRedirect("/not-admin");
		return true;

	}

}
