package com.forum.entity.dto;

import lombok.Data;

@Data
public class CommentMessageDto {
    private String sender;
    private String receiver;
    private String postComment;
}
