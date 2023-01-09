package com.ericbarajas.destinationtokyo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ericbarajas.destinationtokyo.models.LoginUser;
import com.ericbarajas.destinationtokyo.models.User;
import com.ericbarajas.destinationtokyo.services.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userServ;
	
	
	@GetMapping("/login")
	public String index(
		@ModelAttribute("newUser") User emptyUser,
		@ModelAttribute("newLogin") LoginUser emptyLoginUser
	) {
		return "/user/login.jsp";
	}
	
	@GetMapping("/register")
	public String registerpage(
		@ModelAttribute("newUser") User emptyUser,
		@ModelAttribute("newLogin") LoginUser emptyLoginUser
	) {
		return "/user/register.jsp";
	}
	
	// PROCESS REGISTER
	@PostMapping("/register")
	public String register(
		@Valid @ModelAttribute("newUser") User filledUser,
		BindingResult results,
		HttpSession session,
		Model model
	) {
		User createdUser = userServ.register(filledUser, results);
		if(results.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "/user/register.jsp";
		}
		// SAVE THE USERS ID IN SESSION
		session.setAttribute("user_id", createdUser.getId());
		return "redirect:/";
	}
	
	// PROCESS LOGIN
	@PostMapping("/login")
	public String login(
		@Valid @ModelAttribute("newLogin") LoginUser filledLoginUser,
		BindingResult results,
		HttpSession session,
		Model model
	) {
		User loggedUser = userServ.login(filledLoginUser, results);
		if(results.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "/user/login.jsp";
		}
		session.setAttribute("user_id", loggedUser.getId());
		return "redirect:/";
	}
	
//	@GetMapping("/homepage")
//	public String homepage(
//		HttpSession session,
//		Model model // VIEW MODEL
//	) {
//		Long userId = (Long) session.getAttribute("user_id");
//		if(userId== null) {
//			return "redirect:/";
//		}
//		// GRAB ONE USER FROM DB
//		model.addAttribute("oneUser", userServ.getOneUser(userId));
//		
//		return "dashboard.jsp";
//		
//	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("user_id", null);
		return "redirect:/";
	}
	
	
}
