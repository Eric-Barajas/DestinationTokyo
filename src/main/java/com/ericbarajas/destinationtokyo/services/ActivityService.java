package com.ericbarajas.destinationtokyo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ericbarajas.destinationtokyo.models.Activity;
import com.ericbarajas.destinationtokyo.repositories.ActivityRepository;
import com.ericbarajas.destinationtokyo.repositories.UserActionRepository;

@Service
public class ActivityService {
	@Autowired
	ActivityRepository activityRepo;
	
	@Autowired
	UserActionRepository useractionRepo;
	
	// ------------- CRUD FOR Activity ----------------//
	// CREATE
	public Activity createActivity(Activity activity) {
		return activityRepo.save(activity);
	}
	// READ ONE
	public Activity getOneActivity(Long id) {
		return activityRepo.findById(id).orElse(null);
	}
	// READ ALL
	public List<Activity> getAllActivities(){
		return activityRepo.findAll();
	}
	// UPDATE
	public Activity updateActivity(Activity updatedActivity) {
		return activityRepo.save(updatedActivity);
	}
	// DELETE
	public void deleteActivity(Long id) {
		activityRepo.deleteById(id);
	}
	
	
	
	
	
}
