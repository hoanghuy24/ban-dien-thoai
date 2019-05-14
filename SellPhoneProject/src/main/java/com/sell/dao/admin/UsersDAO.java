package com.sell.dao.admin;

import com.sell.entity.usermanager.Users;

import java.util.List;

public interface UsersDAO {
     boolean changeStatusUsers(Users users, int status);
     boolean changePassword(Users users, String password, String repassword);
    int registerUsers(Users users);
    List<Users> getListUsers();
    Users getUsers(int id);
}
