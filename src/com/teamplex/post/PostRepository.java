package com.teamplex.post;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface PostRepository extends MongoRepository<Post, ObjectId> {

	List<Post> findByTagsValue(String value);

	List<Post> findByWriterId(ObjectId id, Pageable pageable);
	
}