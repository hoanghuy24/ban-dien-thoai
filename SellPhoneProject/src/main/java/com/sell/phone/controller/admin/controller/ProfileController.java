package com.sell.phone.controller.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.UserProfile;
import com.sell.entity.usermanager.Users;
import com.sell.service.AdminServices;

@Controller
@RequestMapping("profile")
public class ProfileController {

	@Autowired
	UserProfileImpl userProfileImpl;

	@Autowired
	AdminServices adminServices;
	
	@Autowired
	UsersImpl userImpl;

	@RequestMapping("/")
	public String user(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Integer id = (Integer) request.getSession().getAttribute("user_id");
		System.out.println(id);
		UserProfile profile = userProfileImpl.getUserProfileByUserId(id);
		String result = (String) request.getParameter("msg");
		if(result != null) {
			model.addAttribute("msg", result);
		}
		model.addAttribute("profile", profile);
		return "admin/profile";
	}

	@PostMapping("/update-profile")
	public String updateProfile(@ModelAttribute("profile") UserProfile userProfile,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {
		Integer id = (Integer) request.getSession().getAttribute("user_id");
		UserProfile profile = userProfileImpl.getUserProfileByUserId(id);
		profile.setAboutMe(userProfile.getAboutMe());
		profile.setAddress(userProfile.getAddress());
		profile.setAvatar(userProfile.getAvatar());
		profile.setCity(userProfile.getCity());
		profile.setCountry(userProfile.getCountry());
		profile.setDate(userProfile.getDate());
		profile.setEmail(userProfile.getEmail());
		profile.setFirstName(userProfile.getFirstName());
		profile.setLastName(userProfile.getLastName());
		profile.setOtherDetail(userProfile.getOtherDetail());
		if (this.userProfileImpl.updateProfile(profile)) {
			redirectAttributes.addAttribute("msg", "Success !");
			System.out.println("complete");
		} else {
			redirectAttributes.addAttribute("msg", "Fail !");
		}
		return "redirect:/profile/";
	}

}
