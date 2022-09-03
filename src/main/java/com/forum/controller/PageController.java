package com.forum.controller;


import java.util.ArrayList;
import java.util.Collections;

import com.forum.entity.Notification;
import com.forum.respository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpOutputMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.forum.entity.Comment;
import com.forum.entity.Post;
import com.forum.service.CategoryService;
import com.forum.service.PostService;

import javax.servlet.http.HttpSession;

@Controller
public class PageController {
	
	@Autowired
	PostService postService;
	
	@Autowired
	CategoryService categoryService;

	@Autowired
	NotificationRepository notificationRepository;
	
	@GetMapping("/pageContent/{idPost}")
	String showPage(ModelMap model, @PathVariable ("idPost") int idPost,  HttpSession session) {
		Post post = postService.findById(idPost);
		String category = post.getCategory().getName();
		model.addAttribute("post", post);
		model.addAttribute("category", category);
		if (session.getAttribute("username") != null) {
			model.addAttribute("notification",
					notificationRepository.findAllByReceiver_UsernameOrderByIdNotificationDesc(session.getAttribute("username").toString())
							.orElse(Collections.emptyList()));
		}
		return "pageContent";
	}

	@GetMapping("/pageContent/{idPost}/{idComment}")
	String showPageViaComment(ModelMap model, @PathVariable ("idPost") int idPost, @PathVariable ("idComment") int idComment,  HttpSession session) {
		Post post = postService.findById(idPost);
		Notification notification = notificationRepository.findById(idComment).orElse(null);

		if (notification != null) {
			notification.setReaded(true);
			notificationRepository.save(notification);
		}

		String category = post.getCategory().getName();
		model.addAttribute("post", post);
		model.addAttribute("category", category);

		if (session.getAttribute("username") != null) {
			model.addAttribute("notification",
					notificationRepository.findAllByReceiver_UsernameOrderByIdNotificationDesc(session.getAttribute("username").toString())
							.orElse(Collections.emptyList()));
		}
		return "pageContent";
	}
}
