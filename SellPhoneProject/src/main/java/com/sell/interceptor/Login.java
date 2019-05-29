package com.sell.interceptor;

import com.sell.dao.admin.impl.UserProfileImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HandlerInterceptorAdapter {
	@Autowired
	UserProfileImpl profile;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("interceptor login");
		if(request.getSession().getAttribute("user_id") == null) {
			request.setAttribute("msg", "Vui lòng đăng nhập ");
			request.getRequestDispatcher("/login").forward(request, response);;
			return false;
		}
		return true;
	}
}
