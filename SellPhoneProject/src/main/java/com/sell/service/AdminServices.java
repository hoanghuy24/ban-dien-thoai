package com.sell.service;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class AdminServices {
    @Autowired
    UsersImpl userimpl;
    @Autowired
    HttpServletRequest request;
    public boolean resultLogin(String username, String password, Model model){
        for (Users users: userimpl.getListUsers() ) {
            if(username.equals(users.getUsername()) && password.equals(users.getPassword())){
         //       model.addAttribute("username", users);
                HttpSession session = request.getSession();
                session.setAttribute("user", users);
                return true;
            }
        }
        model.addAttribute("msg", "Tên tài khoản hoặc mật khẩu không chính xác !");
        return false;
    }
}
