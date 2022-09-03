package com.forum.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import lombok.Data;
import org.hibernate.annotations.CascadeType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.NonNull;

@Entity
@Table(name = "profile")
@Data
public class Profile {
	@Id
	@GeneratedValue
	int profile_id;

	@Column(unique=true)
	String username;

	String avatar;
	String name;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Past
	Date birthday;
	
	Boolean gender;
	
	@Column(name = "identity_card")
	String idCard;

	@Column(name = "phone_number")
	String phoneNumber;

	String address;
	
	@OneToOne(mappedBy = "profile")
	User user;
}
