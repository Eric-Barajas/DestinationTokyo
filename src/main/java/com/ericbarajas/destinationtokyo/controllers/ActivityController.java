package com.ericbarajas.destinationtokyo.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ericbarajas.destinationtokyo.models.Activity;
import com.ericbarajas.destinationtokyo.models.LoginUser;
import com.ericbarajas.destinationtokyo.models.User;
import com.ericbarajas.destinationtokyo.models.UserAction;
import com.ericbarajas.destinationtokyo.services.ActivityService;
import com.ericbarajas.destinationtokyo.services.UserService;

@Controller
public class ActivityController {
	
	@Autowired
	ActivityService activityServ;
	
	@Autowired
	UserService userServ;
	
	
	@GetMapping("/")
	public String index(
		@ModelAttribute("newUser") User emptyUser,
		@ModelAttribute("newLogin") LoginUser emptyLoginUser
	) {
		return "/activity/index.jsp";
	}
	
	@GetMapping("/anime")
	public String anime(
			@ModelAttribute("newUser") User emptyUser,
			@ModelAttribute("newLogin") LoginUser emptyLoginUser
		) {
			return "/activity/anime.jsp";
		}
	
	@GetMapping("/tester")
	public String tester(
			@ModelAttribute("newUser") User emptyUser,
			@ModelAttribute("newLogin") LoginUser emptyLoginUser
		) {
			return "/activity/tester.jsp";
		}
	
	@GetMapping("/animehotspots")
	public String everythinganime(
			@ModelAttribute("newUser") User emptyUser,
			@ModelAttribute("newLogin") LoginUser emptyLoginUser,
			Model model
		) {
			List<Activity> activities = activityServ.getAllActivities();
			model.addAttribute("activities", activities);
			return "/activity/animehotspots.jsp";
		}
	
//	To show one restaurant here ill put description and everyhtign 
//	+ comments made by users & the ability for the logged in user 
//	to add their own comments
//	read one
	@GetMapping("/activity/{id}")
	public String oneActivity(
		@PathVariable("id") Long ActivityId,
		@ModelAttribute("userActionObj")UserAction emptyUserAction,
		Model model,
		HttpSession session
	) {
		Activity oneActivity = activityServ.getOneActivity(ActivityId);
		System.out.println(oneActivity);
		
		System.out.println(userServ.findCommentList(oneActivity).size());
		model.addAttribute("useractions", userServ.findCommentList(oneActivity));
		model.addAttribute("number", userServ.findCommentList(oneActivity).size());
		model.addAttribute("activity", oneActivity);
		model.addAttribute("user", userServ.getOneUser((Long) session.getAttribute("user_id")));
		return "/activity/display.jsp";
	}
	
	@PostMapping("/activity")
	public String processActivity(
		@Valid @ModelAttribute("userActionObj")UserAction filledUserAction,
		BindingResult results
	) {
		// VALIDATIONS FAIL
		if(results.hasErrors()) {
			return "/activity/display.jsp";
		}
		// VALIDATIONS PASS
//		userServ.getActionByUser(filledUserAction.getUser()).add(filledUserAction);
		userServ.createUserAction(filledUserAction);
//		userServ.updateUser(filledUserAction.getUser());
		return "redirect:/";
	}
	
	
	// ---------------- CREATING A Activity -----------------//
		@GetMapping(value={"/activity/new"})
		public String createActivity(
			@ModelAttribute("activityObj")Activity emptyActivity
		) {
			return "/activity/create.jsp";
		}
		
		@PostMapping("/activity/new")
		public String processActivity(
			@Valid @ModelAttribute("activityObj")Activity filledActivity,
			BindingResult results
		) {
			// VALIDATIONS FAIL
			if(results.hasErrors()) {
				return "/activity/create.jsp";
			}
			// VALIDATIONS PASS
			activityServ.createActivity(filledActivity);
			return "redirect:/";
		}
}
