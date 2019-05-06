package com.sell.service;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class AdminServices {
    @Autowired
    UsersImpl userimpl;
    @Autowired
    HttpServletRequest request;
    @Autowired
    UserProfileImpl profile;
    public String resultLogin(String username, String password, RedirectAttributes redirectAttributes) {
        for (Users users : userimpl.getListUsers()) {
            if (username.equals(users.getUsername()) && password.equals(users.getPassword())) {
                //       model.addAttribute("username", users);
                HttpSession session = request.getSession();
                session.setAttribute("user_id", users.getId());
                session.setAttribute("user", users);
                session.setMaxInactiveInterval(60*60*12);
                return "redirect:/";
            }
        }
        // fail
        redirectAttributes.addAttribute("msg", "Wrong Username or Password !!");
        return "redirect:/login";
    }

    public String getProfileSession(RedirectAttributes redirectAttributes){
        int id = (Integer) request.getSession().getAttribute("user_id");
        redirectAttributes.addAttribute("user",profile.getUsersProfile(id));
        return "redirect:/user";
    }
}
