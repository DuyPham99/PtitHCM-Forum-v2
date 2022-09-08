package com.forum.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.forum.respository.NotificationRepository;
import com.forum.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.forum.entity.Post;
import com.forum.respository.PostRepository;
import com.forum.service.CategoryService;
import com.forum.service.PostService;

import javax.servlet.http.HttpSession;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@Controller
public class TopicPageController {

    @Autowired
    PostRepository postRepository;

    @Autowired
    PostService postService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    NotificationRepository notificationRepository;

    @Autowired
    UserService userService;

    @GetMapping("/topic/{category}/{page}")
    public String showTopicPage(@PathVariable("category") int category, @PathVariable("page") int page, ModelMap model, HttpSession session) {
        List<Post> list = postService.getPageSortElement(page - 1, 5, "id_post", category);
        SecurityContext context = (SecurityContext) session.getAttribute(SPRING_SECURITY_CONTEXT_KEY);
        model.addAttribute("list", list);
        model.addAttribute("category", categoryService.findById(category).getName());
        model.addAttribute("notification", notificationRepository
                .findAllByReceiver_UsernameOrderByIdNotificationDesc(context.getAuthentication().getName())
                .orElse(Collections.emptyList()));
        if (context != null && context.getAuthentication().getName() != null) {
            model.addAttribute("user", userService.findById((context.getAuthentication().getName())));
        }

        if (postRepository.countRecord(category) % 5 != 0) {
            model.addAttribute("amountOfPage", postRepository.countRecord(category) / 5 + 1);
        } else {
            model.addAttribute("amountOfPage", postRepository.countRecord(category) / 5);
        }
        return "topicPage";
    }

    @GetMapping("/topic")
    public String showTopicPage1() {
        return "topicPage";
    }
}
