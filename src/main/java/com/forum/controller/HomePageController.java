package com.forum.controller;

import javax.servlet.http.HttpSession;

import com.forum.respository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forum.respository.PostRepository;
import com.forum.service.PostService;
import com.forum.service.UserService;

import java.util.Collections;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@Controller
public class HomePageController {
	
	@Autowired
	PostService postService;
	
	@Autowired
	PostRepository postRespository;
	
	@Autowired
	UserService userService;

	@Autowired
	NotificationRepository notificationRepository;
	
	@RequestMapping("/")
	public String homepage(ModelMap model, HttpSession session) {
		model.addAttribute("active", postRespository.findAllByCategory_IdCategory(1, PageRequest.of(0, 5)));
		model.addAttribute("study", postRespository.getStudyPost());
		model.addAttribute("club", postRespository.getClubPost());
		model.addAttribute("talk", postRespository.getTalkPost());
		model.addAttribute("exp", postRespository.getExpPost());
		model.addAttribute("another", postRespository.getAnotherPost());
		if (session.getAttribute(SPRING_SECURITY_CONTEXT_KEY) != null) {
			model.addAttribute("notification", notificationRepository.findAllByReceiver_UsernameOrderByIdNotificationDesc(((SecurityContext)session.getAttribute(SPRING_SECURITY_CONTEXT_KEY)).getAuthentication().getName())
					.orElse(Collections.emptyList()));
			model.addAttribute("user", userService.findById(((SecurityContext)session.getAttribute(SPRING_SECURITY_CONTEXT_KEY)).getAuthentication().getName()));
		}
		return "index";
	}
}
