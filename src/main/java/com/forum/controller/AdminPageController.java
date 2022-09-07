package com.forum.controller;

import java.time.ZoneId;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.forum.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.forum.entity.Post;
import com.forum.entity.User;
import com.forum.respository.PostRepository;
import com.forum.respository.UserRepository;
import com.forum.service.PostService;
import com.forum.service.UserService;

@Controller
public class AdminPageController {

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PostRepository postRepository;

    @Autowired
    PostService postService;

    @GetMapping("/admin/dashboard")
    public String showDashboard() {
        return "/admin/dashboard";
    }

    @GetMapping("/admin/table/{page}")
    public String showTable(@PathVariable("page") int page, ModelMap model) {
        model.addAttribute("list", userService.getPageUser(page));
        long size = userRepository.count();

        if (size % 5 != 0 || size / 5 == 0) {
            model.addAttribute("numberPage", size / 5 + 1);
        } else model.addAttribute("numberPage", size / 5);
        return "/admin/table";
    }

    @PostMapping("/admin/table/delete/{username}")
    @ResponseStatus(HttpStatus.OK)
    public void showUsername(@PathVariable("username") String username, ModelMap model) {
        User user = userService.findById(username);
        user.setDeleteFlag(1);
        userService.save(user);
    }

    @PostMapping("/admin/table/update/{username}/{role}")
    @ResponseStatus(HttpStatus.OK)
    public void changeRole(@PathVariable("role") String role, @PathVariable("username") String username) {
        User user = userService.findById(username);
        user.setRole(role);
        userService.save(user);
    }

    @GetMapping("/admin/post/{page}")
    public String showPost(@PathVariable("page") int page, ModelMap model) {
        List<Post> list = postService.getPageSortElementAdmin(page - 1, 5, "id_post");
        model.addAttribute("list", list);
        long size = postRepository.count();
        if (size % 5 != 0 || size / 5 == 0) {
            model.addAttribute("size", size / 5 + 1);
        } else model.addAttribute("size", size / 5);
        return "/admin/post";
    }

    @PostMapping("/admin/post/delete/{isPost}")
    @ResponseStatus(HttpStatus.OK)
    void deletePost(@PathVariable("isPost") int id, ModelMap model) {
        postService.delete(postService.findById(id));
    }

    @GetMapping("/admin/statistic")
    public String showStatistic(ModelMap model) {
        List<Post> postList = postRepository.findAll();

        Map<String, Long> posts = postList
                .stream()
                .filter(Objects::nonNull)
                .map(Post::getCategory)
                .map(Category::getName)
                .collect(Collectors.groupingBy(Function.identity(),
                        Collectors.counting()));

        Map<String, Long> users = postList
                .stream()
                .filter(Objects::nonNull)
                .map(Post::getUser)
                .map(User::getUsername)
                .collect(Collectors.groupingBy(Function.identity(),
                        Collectors.counting()));

        Map<String, Long> postPerMonth = postList
                .stream()
                .filter(Objects::nonNull)
                .map(x -> x.getTimeCreate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue())
                .map(String::valueOf)
                .collect(Collectors.groupingBy(Function.identity(),
                        Collectors.counting()));

        users = users.entrySet().stream()
                .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
                .limit(3)
                .distinct()
                .collect(Collectors.toMap(
                        Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));

        model.addAttribute("postEachCategories", posts);
        model.addAttribute("topUserCreatePostKey", users.keySet());
        model.addAttribute("topUserCreatePostValue", users.values());
        model.addAttribute("postPerMonth", postPerMonth);

        return "/admin/statistic";
    }
}
