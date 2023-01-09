package com.ericbarajas.destinationtokyo.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ericbarajas.destinationtokyo.models.Activity;
import com.ericbarajas.destinationtokyo.models.LoginUser;
import com.ericbarajas.destinationtokyo.models.User;
import com.ericbarajas.destinationtokyo.models.UserAction;
import com.ericbarajas.destinationtokyo.repositories.UserActionRepository;
import com.ericbarajas.destinationtokyo.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	UserActionRepository useractionRepo;
	
    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult results) {
        // TO-DO: Additional validations!
    	
    	//CHECK TO SEE IF EMAIL IS AREADY TAKEN
    	if(this.checkEmail(newUser.getEmail())){
    		results.rejectValue("email", "Duplicate", "Email already exists");
    	}
    	
    	// CHECK TO SEE IF PASSWORD AND CONFIRM PASSWORD DOES NOT MATCH
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		results.rejectValue("confirm", "ConfirmPass", "Password and Confirm Pass must match");
    	}
        if(results.hasErrors()) {
        	return null;
        }
        
        // HASH AND SET PASSWORD, SAVE USER TO DB
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return userRepo.save(newUser);
    }
    
    public User login(LoginUser newLoginObject, BindingResult results) {
        // TO-DO: Additional validations!
    	
    	// FIND THE USER IN THE DB
    	if(!this.checkEmail(newLoginObject.getEmail())) {
    		results.rejectValue("email", "Non-existant", "INVALID CREDENTIALS");
    	}
        if(results.hasErrors()) {
        	return null;
        }
        
        // CHECK TO SEE IF PASSWORD MATCHES
        User user = userRepo.findByEmail(newLoginObject.getEmail()).orElse(null);
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    	    results.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	if(results.hasErrors()) {
    		return null;
    	}
    	
    	return user;
    }
    
    
    public boolean checkEmail(String email) {
    	Optional<User> user = userRepo.findByEmail(email);
    	
    	if(user.isPresent()) {
    		return true;
    	}
    	else {
    		return false;
    	}
    }
    
    public User getOneUser(Long id) {
    	return userRepo.findById(id).orElse(null);
    }
    
    //USER CREATE A COMMENT(S)
 	public void createUserAction(UserAction useraction) {
 		useractionRepo.save(useraction);
 	}
 	
 	public List<UserAction> getActionByUser(User user) {
 		return useractionRepo.findByUser(user);
 	}
 	
 	public void updateUser(User user) {
 		userRepo.save(user);
 	}
 	
	//READ ALL COMMENTS
	public List<UserAction> findCommentList(Activity activity) {
		return useractionRepo.findByActivity(activity);
	}
}
