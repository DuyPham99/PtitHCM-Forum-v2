package com.forum.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.LocalDate;

@Entity
@Table(name = "notification")
@Data
public class Notification {
    @Id
    @GeneratedValue
    private Integer idNotification;

    @CreatedDate
    private LocalDate createDate;

    private String message;

    private int idPost;

    private boolean readed = false;

    @ManyToOne
    @JoinColumn(name = "receive_user_id")
    private User receiver;
}
