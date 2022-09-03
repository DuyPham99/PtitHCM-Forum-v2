package com.forum.entity;

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
@Data
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
}
