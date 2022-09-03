package com.forum.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import org.apache.commons.lang3.builder.EqualsExclude;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Post")
public class Post {

	@Id
	@Column(name = "id_post")
	@NotNull(message = "Không được bỏ trống!")
	@GeneratedValue
	Integer idPost;
	
	@NotEmpty(message = "Tiêu đề không được bỏ trống!")
	String title;
	
	@NotEmpty(message = "Nội dung không được bỏ trống!")
	String content;
	
	int react;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:MM:ss")
	@Column(name = "date")
	@CreationTimestamp
	Date timeCreate;
	
	@ManyToOne
	@JoinColumn(name = "username")
	User user;
	
	String thumb;
	
	@OneToMany(mappedBy = "post", cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	List<Comment> comments = new ArrayList<>();

	@ManyToOne
	@JoinColumn(name = "id_category")
	@JsonBackReference
	Category category;

	public Post() {
		super();
	}

	public Post(String content, int react, Date timeCreate, User user) {
		super();
		this.content = content;
		this.react = react;
		this.timeCreate = timeCreate;
		this.user = user;
	}

	public Integer getIdPost() {
		return idPost;
	}

	public void setIdPost(Integer idPost) {
		this.idPost = idPost;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReact() {
		return react;
	}

	public void setReact(int react) {
		this.react = react;
	}

	public Date getTimeCreate() {
		return timeCreate;
	}

	public void setTimeCreate(Date timeCreate) {
		this.timeCreate = timeCreate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}
