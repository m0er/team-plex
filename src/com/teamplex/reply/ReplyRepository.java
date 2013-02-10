package com.teamplex.reply;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ReplyRepository extends MongoRepository<Reply, ObjectId> {
	
	List<Reply> findAllByPostId(ObjectId postId);
	
	List<Reply> findByIdIn(Iterable<? extends ObjectId> entities);
	
	List<Reply> findByWriterId(ObjectId id, Pageable pageable);
	
}
