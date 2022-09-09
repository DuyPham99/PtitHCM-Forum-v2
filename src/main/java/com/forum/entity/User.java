package com.forum.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "user")
public class User {
	@Id
	@NotNull(message = "Username không bỏ trống!")
	@NotBlank(message = "Username không chứa khoảng trắng")
	@Size(min = 2, max = 20, message = "Độ dài Username từ 2 đến 20 ký tự!")
	String username;
	
	@Email(message = "Email không hợp lệ!")
	@NotNull
	String email;
	
	@NotNull
	String password;
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	String role;
	
	@Column(name = "delete_flag")
	int deleteFlag;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "profile_id")
	Profile profile;
	
	@OneToMany(mappedBy = "user")
	List<Post> posts;
	
	@OneToMany(mappedBy = "user")
	List<Comment> comments;

	@ManyToMany(mappedBy = "users")
	Set<Category> categories;

	@OneToMany(mappedBy = "receiver")
	List<Notification> notifications;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Set<Category> getCategories() {
		return categories;
	}

	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}

	public List<Notification> getNotifications() {
		return notifications;
	}

	public void setNotifications(List<Notification> notifications) {
		this.notifications = notifications;
	}
}
