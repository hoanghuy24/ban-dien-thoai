package com.sell.phone.controller.admin.controller;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.entity.usermanager.UserProfile;
import com.sell.entity.usermanager.Users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class ManagerController {
	@Autowired
	UserProfileImpl userProfileImpl;

	@RequestMapping("/user")
	public String user(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		if (request.getSession().getAttribute("user_id") != null) {
			int id = (Integer) request.getSession().getAttribute("user_id");
			model.addAttribute("user", userProfileImpl.getUserProfileByUserId(id));
			return "/admin/user";
		} else {
			redirectAttributes.addAttribute("msg", "Bạn chưa đăng nhập");
			return "redirect:/login";
		}
	}

	@PostMapping("/update-profile")
	public String updateProfile(@ModelAttribute UserProfile userProfile, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		Integer id = (Integer)request.getSession().getAttribute("user_id");
		System.out.println(id);
		Users users = userProfileImpl.getUserById(id);
		UserProfile profile = userProfileImpl.getUserProfileById(users.getUserProfile().getId());
		profile.setFirstName(userProfile.getFirstName());
		profile.setLastName(userProfile.getLastName());
		profile.setAddress(userProfile.getAddress());
		profile.setAboutMe(userProfile.getAboutMe());
		profile.setCity(userProfile.getCity());
		profile.setCountry(userProfile.getCountry());
		System.out.println("ID Profile: "+userProfile.getId());
		if (this.userProfileImpl.updateProfile(profile)) {
			redirectAttributes.addAttribute("msg", "Edit success !");
			System.out.println("complete");
			System.out.println(profile.getFirstName());
			System.out.println(userProfile);
		} else {
			redirectAttributes.addAttribute("msg", "Edit Fail !");
			System.out.println(userProfile);
		}

		return "redirect:/admin/user";
	}

	@GetMapping("/update-profile")
	public String updateProfile() {
		return "redirect:/admin/user";
	}

	@RequestMapping("/dashboard")
	public String dashboard() {
		return "/admin/dashboard";
	}

	@RequestMapping("/map")
	public String map() {
		return "/admin/map";
	}
}
