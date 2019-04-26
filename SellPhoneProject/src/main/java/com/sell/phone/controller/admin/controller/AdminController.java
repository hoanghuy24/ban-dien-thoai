package com.sell.phone.controller.admin.controller;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.dao.impl.ProductImpl;
import com.sell.entity.usermanager.Users;
import com.sell.service.AdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
    @Autowired
    AdminServices adminServices;
    @Autowired
    UserProfileImpl profile;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/admin/admin-login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model) {
        return adminServices.resultLogin(username, password, model) ? "redirect:/admin/dashboard" : "redirect:/admin/admin-login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "/admin/admin-login";
    }
}
