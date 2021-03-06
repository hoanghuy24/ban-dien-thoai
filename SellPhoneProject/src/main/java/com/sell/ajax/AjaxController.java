package com.sell.ajax;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/api")
public class AjaxController extends HttpServlet {
    @Autowired
    UsersImpl usersimpl;

    @ResponseBody
    @PostMapping("/check-username")
    public String checkUsername(HttpServletRequest req) {
        String username = req.getParameter("username");
        for (Users users : usersimpl.getListUsers()) {
            if (username.equalsIgnoreCase(users.getUsername())) {
                return "false";
            }
        }
        return "true";
    }

    @ResponseBody
    @PostMapping("/check-email")
    public String checkEmail(HttpServletRequest req) {
        String e = req.getParameter("email");
        for (Users users : usersimpl.getListUsers()) {
            if (e.equalsIgnoreCase(users.getUserProfile().getEmail())) {
                return "false";
            }
        }
        return "true";
    }
    @ResponseBody
    @PostMapping("/register-result")
    public String registerResult(){
        return  "";
    }
}
