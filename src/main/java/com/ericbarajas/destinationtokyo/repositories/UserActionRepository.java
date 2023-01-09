package com.ericbarajas.destinationtokyo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ericbarajas.destinationtokyo.models.Activity;
import com.ericbarajas.destinationtokyo.models.User;
import com.ericbarajas.destinationtokyo.models.UserAction;

@Repository
public interface UserActionRepository extends CrudRepository<UserAction, Long>{
	List<UserAction> findAll();
	
//	custom queries
	List<UserAction> findByActivity(Activity activity);
	
	List<UserAction> findByUser(User user);
}
