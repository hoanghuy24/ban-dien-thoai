package com.sell.service;

import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class AdminServices {
    @Autowired
    UsersImpl userimpl;
    public String resultLogin(String username, String password, Model model){
        for (Users users: userimpl.getListUsers() ) {
            if(username.equals(users.getUsername()) && password.equals(users.getPassword())){
                model.addAttribute("username", users.getUsername());
                return "view/admin/admin-manager";
            }
        }
        model.addAttribute("msg", "Tên tài khoản hoặc mật khẩu không chính xác !");
        return "view/admin/admin-login";
    }
}
