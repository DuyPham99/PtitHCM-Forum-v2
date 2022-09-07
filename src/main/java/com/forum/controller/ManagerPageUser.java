package com.forum.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.forum.respository.PostRepository;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@Controller
public class ManagerPageUser {
	
	@Autowired
	PostRepository postRepository;
	
	@GetMapping("/manage-post-user")
	public String show(ModelMap model, HttpServletRequest request) {
		SecurityContext context = (SecurityContext) request.getSession().getAttribute(SPRING_SECURITY_CONTEXT_KEY);
		model.addAttribute("list", postRepository.getPostOfUser(context.getAuthentication().getName()));
		return "manage-post-user";
	}
}
