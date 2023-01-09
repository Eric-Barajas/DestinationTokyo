package com.ericbarajas.destinationtokyo.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ericbarajas.destinationtokyo.models.Activity;

@Repository
public interface ActivityRepository extends CrudRepository<Activity, Long>{
	List<Activity> findAll();
	
	// CUSTOM QUERY - to find user by email
	Optional<Activity> findByType(String type);
	
	Optional<Activity> findByDescription(String description);
	
	Optional<Activity> findByLocation(String location);
	
	Optional<Activity> findByImages(String images);
	

}
