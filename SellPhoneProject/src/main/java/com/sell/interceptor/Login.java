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
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		/*
		 * HttpSession session = request.getSession();
		 * if(session.getAttribute("user_id") == null){ //
		 * redirectAttributes.addAttribute("msg", "Bạn chưa đăng nhập !");
		 * response.sendRedirect("/Login"); }
		 */
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
