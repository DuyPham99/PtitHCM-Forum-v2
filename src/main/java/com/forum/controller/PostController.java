package com.forum.controller;



import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.entity.Post;
import com.forum.security.JwtUtil;
import com.forum.service.PostService;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@Controller
public class PostController {

	@Autowired
	PostService postSerivice;
	
	@GetMapping("/post")
	public String showPost(HttpServletRequest request, ModelMap model) throws IOException {
		SecurityContext context = (SecurityContext) request.getSession().getAttribute(SPRING_SECURITY_CONTEXT_KEY);
		if (context.getAuthentication().getName() == null)
		return "redirect:/";
		Post post = new Post(); 
		model.addAttribute("post", post);	
		return "post";
	}
	
	@GetMapping("/post-update")
	public String updatePost(@RequestParam("id") int  idPost, ModelMap model) {
		model.addAttribute("post", postSerivice.findById(idPost));
		return "post-update";
	}
	
	
//	@MessageMapping("/chat")
//	@SendTo("/topic/message")
//	public String send(String comment) {
//		System.out.println(comment);
//	//	String time = new SimpleDateFormat("HH:mm").format(new Date());
//		return comment + "df";
//	}
}
