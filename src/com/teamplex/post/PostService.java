package com.teamplex.post;

import java.util.Date;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.*;
import org.springframework.stereotype.Service;

import com.mongodb.WriteResult;
import com.teamplex.user.User;

@Service("postService")
public class PostService {
	@Autowired private PostRepository postRepository;
	@Autowired private MongoTemplate mongoTemplate;
	
	public void create(User writer, Post post) {
		post.setWriter(writer);
		post.setCreated(new Date());
		postRepository.save(post);
	}

	public Post get(ObjectId id) {
		Post post = postRepository.findOne(id);
		return post;
	}
	
	public List<Post> getByTag(String tag) {
		List<Post> posts = postRepository.findByTagsValue(tag);
		return posts;
	}

	public List<Post> getRecent(final int limit) {
		Pageable pageable = new PageRequest(0, limit, Direction.DESC, "created");
		return postRepository.findAll(pageable).getContent();
	}
	
	public void update(Post post) {
		postRepository.save(post);
	}

	public void deleteById(ObjectId id) {
		postRepository.delete(id);
	}

	public Post increaseViewCountThenRetrieve(ObjectId id, User currentUser) {
		WriteResult writeResult = mongoTemplate.updateFirst(Query.query(Criteria.where("id").is(id)), new Update().inc("viewCount", 1L), Post.class);
		
		if (writeResult.getError() == null) {
			Post post = get(id);
			
			if (currentUser != null && currentUser.getId().equals(post.getWriter().getId())) {
				post.setContentWriter(true);
			}
			
			return post;
		}
		
		return null;
	}
}