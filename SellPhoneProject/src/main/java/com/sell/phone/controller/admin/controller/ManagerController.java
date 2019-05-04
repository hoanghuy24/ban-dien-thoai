package com.sell.phone.controller.admin.controller;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.entity.usermanager.UserProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class ManagerController {
    @Autowired
    UserProfileImpl profile;

    @RequestMapping("/user")
    public String user(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        if(request.getSession().getAttribute("user_id") != null) {
            int id = (Integer) request.getSession().getAttribute("user_id");
            model.addAttribute("user", profile.getUserProfileByUserId(id));
            return "/admin/user";
        }
        else{
            redirectAttributes.addAttribute("msg", "Bạn chưa đăng nhập");
            return "redirect:/login";
        }
    }
    @PostMapping("/update-profile")
    public String updateProfile(@Valid @ModelAttribute UserProfile userProfile, RedirectAttributes redirectAttributes){
        if(this.profile.updateProfile(userProfile)){
            redirectAttributes.addAttribute("msg", "Edit success !");
            System.out.println(userProfile);
        }else{
            redirectAttributes.addAttribute("msg", "Edit Fail !");
            System.out.println(userProfile);
        }
        return "redirect:/admin/user";
    }
    @GetMapping("/update-profile")
    public String updateProfile(){
        return "redirect:/admin/user";
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
