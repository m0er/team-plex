package com.teamplex.post;

import java.util.List;

import lombok.Data;

import com.teamplex.reply.Reply;

@Data
public class PostAndRepliesDto {
	private Post post;
	private List<Reply> replies;
}
