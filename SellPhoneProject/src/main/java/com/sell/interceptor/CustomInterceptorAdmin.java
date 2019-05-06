package com.sell.interceptor;

import com.sell.dao.admin.impl.UserProfileImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CustomInterceptorAdmin extends HandlerInterceptorAdapter {
	@Autowired
	UserProfileImpl profile;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("PreHandle");
		if(request.getSession().getAttribute("user_id") == null) {
			request.setAttribute("msg", "Vui lòng đăng nhập ");
			response.sendRedirect(request.getContextPath()+"/login");
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
		System.out.println("affterComletion");
	}
}
