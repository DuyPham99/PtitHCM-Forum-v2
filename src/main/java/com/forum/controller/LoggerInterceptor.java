package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.resource.HttpResource;

import com.forum.service.UserService;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@Component
public class LoggerInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		SecurityContext context = (SecurityContext) request.getSession().getAttribute(SPRING_SECURITY_CONTEXT_KEY);
		System.out.println(userService.findById(context.getAuthentication().getName()).getRole() );
		if (userService.findById(context.getAuthentication().getName()).getRole().equalsIgnoreCase("ADMIN")) {
			return true;
		}
		return false;
	}
	
	@Override
	   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	           ModelAndView modelAndView) throws Exception {
//	       System.out.println("\n-------- LogInterception.postHandle --- ");
//	       System.out.println("Request URL: " + request.getRequestURL());
	   }
	 
	   @Override
	   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
	           throws Exception {
		   
	   }
}
