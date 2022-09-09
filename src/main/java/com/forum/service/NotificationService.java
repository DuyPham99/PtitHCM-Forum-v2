package com.forum.service;

import com.forum.entity.Comment;
import com.forum.entity.Notification;
import com.forum.entity.User;
import com.forum.respository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class NotificationService {
    @Autowired
    NotificationRepository notificationRepository;

    @Autowired
    PostService postService;


    public void sendNotification(List<Comment> comments, Comment comment) {
        List<Notification> list = new ArrayList<>();
        HashSet<Object> seen=new HashSet<>();
        List<Comment> temp = comments.stream()
//                .filter(x -> !x.getUser().getUsername().equals(comment.getUser().getUsername()))
                .collect(Collectors.toList());

        // check stranger comment into post
        if (!comment.getUser().getUsername().equals(comment.getPost().getUser().getUsername())) {
            Notification notification = new Notification();
            notification.setReceiver(comment.getPost().getUser());
            notification.setMessage(String.format("%s đã comment trong bài \"%s\"", comment.getUser().getUsername(), comment.getPost().getTitle()));
            notification.setIdPost(comment.getPost().getIdPost());
            list.add(notification);
        }

        temp.removeIf(e->!seen.add(e.getUser().getUsername()));

        for (Comment comment1 : temp) {
            Notification notification = new Notification();
            notification.setReceiver(comment1.getUser());
            notification.setMessage(String.format("%s đã comment trong bài \"%s\"", comment.getUser().getUsername(), comment.getPost().getTitle()));
            notification.setIdPost(comment.getPost().getIdPost());
            list.add(notification);
        }
        notificationRepository.saveAll(list);
    }
}
