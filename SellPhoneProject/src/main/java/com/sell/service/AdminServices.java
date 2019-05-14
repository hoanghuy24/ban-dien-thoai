package com.sell.service;

import com.sell.dao.admin.impl.UserProfileImpl;
import com.sell.dao.admin.impl.UsersImpl;
import com.sell.entity.usermanager.Users;
import com.sell.security.MD5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Service
public class AdminServices {
	@Autowired
	UsersImpl userimpl;
	@Autowired
	HttpServletRequest request;
	@Autowired
	UserProfileImpl profile;

	public String resultLogin(String username, String password, RedirectAttributes redirectAttributes,
			HttpServletResponse response) {
		for (Users users : userimpl.getListUsers()) {
			if (username.equals(users.getUsername()) && password.equals(users.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("user_id", users.getId());
				session.setAttribute("user", users);
				session.setMaxInactiveInterval(60 * 60 * 12);
				MD5 md5 = new MD5();
				Cookie cookie = new Cookie("key", md5.convertToMessageDigest(users.getUsername()));
				cookie.setMaxAge(60 * 60 * 12);
				response.addCookie(cookie);
				return "redirect:/";
			}
		}
		// fail
		redirectAttributes.addAttribute("msg", "Wrong Username or Password !!");
		return "redirect:/login";
	}

	public boolean checkCookieService(HttpServletRequest request) {
		Cookie cookie[] = request.getCookies();
		List<Users> listUser = userimpl.getListUsers();
		MD5 md5 = new MD5();
		if (cookie != null) {
			for (Cookie c : cookie) {
				if (c.getName().equals("key")) {
					for (Users users : listUser) {
						if (c.getValue().equals(md5.convertToMessageDigest(users.getUsername()))) {
							return true;
						}
					}
				}
			}
		}
		return false;
	}

	public void Logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie[] = request.getCookies();
		if(cookie != null) {
		for (Cookie cookie2 : cookie) {
			System.out.println(cookie2.getName());
			if (cookie2.getName().equals("key")) {
				System.out.println("Da in day");
				System.out.println("Truoc " + cookie2.getMaxAge());
				cookie2.setMaxAge(0);
				response.addCookie(cookie2);
				System.out.println("Sau " + cookie2.getMaxAge());

			}
		}
		}
		request.getSession().removeAttribute("user_id");
		request.getSession().removeAttribute("user");
	}

	public String getProfileSession(RedirectAttributes redirectAttributes) {
		int id = (Integer) request.getSession().getAttribute("user_id");
		redirectAttributes.addAttribute("user", profile.getUsersProfile(id));
		return "redirect:/user";
	}

}
