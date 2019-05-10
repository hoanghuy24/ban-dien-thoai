package com.sell.phone.controller.admin.controller;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.UserProfile;
import com.sell.entity.usermanager.Users;
import com.sell.service.AdminServices;
import com.sell.service.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
public class AccountController {
    @Autowired
    AdminServices adminServices;
    @Autowired
    UserProfileImpl profile;
    @Autowired
    UsersImpl userimpl;
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
        request.getSession().removeAttribute("user");
        return "redirect:/";
    }
    @GetMapping("/register")
    public String register(Model model){
        model.addAttribute("newUser", new Users());
        return "/admin/register";
    }
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") Users users, BindingResult result, HttpServletResponse response, Model model){
        response.setCharacterEncoding("UTF-8");
        if(result.hasErrors()){
            return "/admin/register";
        }else{
            if(userimpl.registerUsers(users) == 1) {
                model.addAttribute("msg", "Đăng ký thành công !");
                return "/admin/login";
            }else{
                model.addAttribute("msg", "Đăng ký thất bại, Vui lòng kiếm tra lại các trường thông tin");
                return "/admin/register";
            }
        }
    }
    @RequestMapping("/show")
    public String info(@ModelAttribute("newUser") Users users){
        return "/admin/info";
    }
}
