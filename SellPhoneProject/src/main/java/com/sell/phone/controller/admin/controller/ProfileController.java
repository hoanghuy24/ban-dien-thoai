package com.sell.phone.controller.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.UserProfile;
import com.sell.entity.usermanager.Users;

@Controller
@RequestMapping("profile")
public class ProfileController {

	@Autowired
	UserProfileImpl userProfileImpl;

	@Autowired
	UsersImpl userImpl;

	@RequestMapping("/user")
	public String user(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Integer id = (Integer) request.getSession().getAttribute("user_id");
		System.out.println(id);
		UserProfile profile = userProfileImpl.getUserProfileByUserId(id);
		model.addAttribute("profile", profile);
		return "admin/profile";
	}

	@PostMapping("/update-profile")
	public String updateProfile(@ModelAttribute("profile") UserProfile userProfile, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		System.out.println(userProfile.getId());
		if (this.userProfileImpl.updateProfile(userProfile)) {
			redirectAttributes.addAttribute("msg", "Edit success !");
			System.out.println("complete");
		} else {
			redirectAttributes.addAttribute("msg", "Edit Fail !");
			System.out.println(userProfile);
		}

		return "redirect:/profile/user";
	}

	@GetMapping("/update-profile")
	public String updateProfile() {
		return "redirect:/profile/user";
	}
}
