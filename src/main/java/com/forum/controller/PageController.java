package com.forum.controller;


import java.util.ArrayList;
import java.util.Collections;

import com.forum.entity.Notification;
import com.forum.respository.NotificationRepository;
import com.forum.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.forum.entity.Comment;
import com.forum.entity.Post;
import com.forum.service.CategoryService;
import com.forum.service.PostService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@Controller
public class PageController {
	
	@Autowired
	PostService postService;
	
	@Autowired
	CategoryService categoryService;

	@Autowired
	NotificationRepository notificationRepository;

	@Autowired
	UserService userService;

	@GetMapping("/pageContent/{idPost}")
	String showPage(ModelMap model, @PathVariable ("idPost") int idPost,  HttpServletRequest request) {
		Post post = postService.findById(idPost);
		SecurityContext context = (SecurityContext) request.getSession().getAttribute(SPRING_SECURITY_CONTEXT_KEY);
		String category = post.getCategory().getName();
		model.addAttribute("post", post);
		model.addAttribute("category", category);
		if (context != null && context.getAuthentication().getName() != null) {
			model.addAttribute("notification",
					notificationRepository.findAllByReceiver_UsernameOrderByIdNotificationDesc(context.getAuthentication().getName())
							.orElse(Collections.emptyList()));
			model.addAttribute("user", userService.findById((context.getAuthentication().getName())));
		}
		return "pageContent";
	}

	@GetMapping("/pageContent/{idPost}/{idComment}")
	String showPageViaComment(ModelMap model, @PathVariable ("idPost") int idPost, @PathVariable ("idComment") int idComment,  HttpSession session) {
		Post post = postService.findById(idPost);
		Notification notification = notificationRepository.findById(idComment).orElse(null);
		SecurityContext context = (SecurityContext) session.getAttribute(SPRING_SECURITY_CONTEXT_KEY);
		if (notification != null) {
			notification.setReaded(true);
			notificationRepository.save(notification);
		}

		String category = post.getCategory().getName();
		model.addAttribute("post", post);
		model.addAttribute("category", category);

		if (context.getAuthentication().getName() != null) {
			model.addAttribute("notification",
					notificationRepository.findAllByReceiver_UsernameOrderByIdNotificationDesc(context.getAuthentication().getName())
							.orElse(Collections.emptyList()));
		}
		return "pageContent";
	}
}
