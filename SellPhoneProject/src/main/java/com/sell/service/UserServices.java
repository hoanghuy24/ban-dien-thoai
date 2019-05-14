package com.sell.service;

import com.sell.entity.usermanager.Users;
import org.springframework.stereotype.Service;

@Service
public class UserServices {
    public boolean register(Users users){
        Users users1 = users;
//        users1.setUsername(users.getUsername());
//        users1.setPassword(users.getUsername());
//        users1.getUserProfile().setEmail(users.getUserProfile().getEmail());
        System.out.println(users1);
        return false;
    }
}
