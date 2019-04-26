package com.sell.phone.controller.admin.controller;

import com.sell.dao.admin.impl.UserProfileImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class ManagerController {
    @Autowired
    UserProfileImpl profile;

    @RequestMapping("/user")
    public String user(Model model, HttpServletRequest request){
        if(request.getSession().getAttribute("user_id") != null) {
            int id = (Integer) request.getSession().getAttribute("user_id");
            model.addAttribute("user", profile.getUsersProfile(id));
        }
        return "/admin/user";
    }
    @RequestMapping("/dashboard")
    public String dashboard(){
        return "/admin/dashboard";
    }
    @RequestMapping("/map")
    public String map(){
        return "/admin/map";
    }
}
