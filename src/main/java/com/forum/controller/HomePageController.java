package com.forum.controller;

import javax.servlet.http.HttpSession;

import com.forum.respository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forum.respository.PostRepository;
import com.forum.service.PostService;
import com.forum.service.UserService;

import java.util.Collections;

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
		model.addAttribute("active", postRespository.findAllByCategory_IdCategory(1, PageRequest.of(1, 5)));
		model.addAttribute("study", postRespository.getStudyPost());
		model.addAttribute("club", postRespository.getClubPost());
		model.addAttribute("talk", postRespository.getTalkPost());
		model.addAttribute("exp", postRespository.getExpPost());
		model.addAttribute("another", postRespository.getAnotherPost());
		if (session.getAttribute("username") != null) {
			model.addAttribute("notification", notificationRepository.findAllByReceiver_UsernameOrderByIdNotificationDesc(session.getAttribute("username").toString())
					.orElse(Collections.emptyList()));
			model.addAttribute("user", userService.findById(session.getAttribute("username").toString()));
		}
		return "index";
	}
}
