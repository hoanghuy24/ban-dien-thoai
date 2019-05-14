package com.sell.phone.controller.admin.controller;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.service.AdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AdminController {
    @Autowired
    AdminServices adminServices;
    @Autowired
    UserProfileImpl profile;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@RequestParam(value = "msg", required = false) String msg, Model model, HttpServletRequest request) {
        if(adminServices.checkCookieService(request)) {
        	return "redirect:/";
        }
        else {
        	return "admin/login";
        }
    }
    
    @RequestMapping("admin/login")
    public String adminLogin() {
    	return "redirect:login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(value = "username") String username,
                        @RequestParam(value = "password") String password, RedirectAttributes redirectAttributes, HttpServletResponse response) {
        return adminServices.resultLogin(username, password, redirectAttributes, response);
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        adminServices.Logout(request, response);
        return "redirect:/";
    }
}
