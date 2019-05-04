package com.sell.dao.admin;

import com.sell.entity.usermanager.UserProfile;

import java.util.List;

public interface UserProfileDAO {
    boolean editProfile(UserProfile profile);
    boolean deleteProfile(UserProfile profile);
    List<UserProfile> getResultList();
    UserProfile getUsersProfile(int id);
  //  UserProfile getUsersProfileByName(String username);
    UserProfile getUserProfileByUserId(int id);
    boolean updateProfile(UserProfile profile);
}
