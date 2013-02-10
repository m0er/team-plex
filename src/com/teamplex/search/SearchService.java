package com.teamplex.search;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamplex.post.PostService;
import com.teamplex.user.User;
import com.teamplex.user.UserService;

@Slf4j
@Service("searchService")
public class SearchService {
	@Autowired private PostService postService;
	@Autowired private UserService userService;
	
	private static final int RECENT_LIMIT = 10;
	
	public Search search(String term) {
		Search search = new Search();
		search.setPosts(postService.getByTag(term));
		
		List<User> users = userService.getByTag(term);
		
		search.setUsers(users);
		
		log.info("search " + term + ":\n" + search.toString());
		
		return search;
	}

	public Search recent() {
		Search search = new Search();
		search.setPosts(postService.getRecent(RECENT_LIMIT));
		
		List<User> users = userService.getRecent(RECENT_LIMIT);
		
		search.setUsers(users);
		
		log.info("search recent" + ":\n" + search.toString());
		
		return search;
	}
}
