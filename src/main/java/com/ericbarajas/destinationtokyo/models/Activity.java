package com.ericbarajas.destinationtokyo.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "actvities")
public class Activity {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotEmpty(message="Type is required!")
    private String type;
	
	
    private String subcategory;
	
	@NotEmpty
    private String name;
    
    @NotEmpty(message="Description is required!")
    @Size(min=10, max=200, message="Description must be between 2 and 30 characters")
    private String description;
    
    @NotEmpty
    private String location;
    
    @NotEmpty
    private String images;
	
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
    
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_actions", 
        joinColumns = @JoinColumn(name = "activity_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> users;
    
    public Activity() {}


	public Activity(@NotEmpty(message = "Type is required!") String type, String subcategory, @NotEmpty String name,
		@NotEmpty(message = "Description is required!") @Size(min = 10, max = 200, message = "Description must be between 2 and 30 characters") String description,
		@NotEmpty String location, @NotEmpty String images) {
	super();
	this.type = type;
	this.subcategory = subcategory;
	this.name = name;
	this.description = description;
	this.location = location;
	this.images = images;
}





	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getSubcategory() {
		return subcategory;
	}


	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getImages() {
		return images;
	}


	public void setImages(String images) {
		this.images = images;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


	public List<User> getUsers() {
		return users;
	}


	public void setUsers(List<User> users) {
		this.users = users;
	}


    
}
