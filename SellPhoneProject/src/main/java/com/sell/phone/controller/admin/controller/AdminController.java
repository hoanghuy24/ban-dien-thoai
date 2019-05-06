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

@Controller
public class AdminController {
    @Autowired
    AdminServices adminServices;
    @Autowired
    UserProfileImpl profile;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@RequestParam(value = "msg", required = false) String msg, Model model, HttpServletRequest request) {
        if(request.getSession().getAttribute("user_id") != null){
            return "redirect:/";
        }
        else {
            if (msg != null) {
                model.addAttribute("msg", msg);
            }
            return "/admin/login";
        }
    }
    
    @RequestMapping("admin/login")
    public String adminLogin() {
    	return "redirect:login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(value = "username") String username,
                        @RequestParam(value = "password") String password, RedirectAttributes redirectAttributes) {
        return adminServices.resultLogin(username, password, redirectAttributes);
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("user_id");
        return "redirect:/login";
    }
}
