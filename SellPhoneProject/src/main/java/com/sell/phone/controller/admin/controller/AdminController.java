package com.sell.phone.controller.admin.controller;

import com.sell.service.AdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
    @Autowired
    AdminServices adminServices;
    @RequestMapping(value = "/admin-login", method = RequestMethod.GET)
    public String login(){
        return "view/admin/admin-login";
    }
    @RequestMapping(value = "/admin-login", method = RequestMethod.POST)
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model){
        return adminServices.resultLogin(username, password, model) ? "view/admin/admin-manager" : "view/admin/admin-login";
    }
}
