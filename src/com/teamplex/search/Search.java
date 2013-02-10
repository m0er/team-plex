package com.teamplex.search;

import java.util.List;

import lombok.Data;

import com.teamplex.post.Post;
import com.teamplex.user.User;

@Data
public class Search {
	private List<User> users;
	private List<Post> posts;	
}