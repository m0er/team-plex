package com.teamplex.message;

import java.util.Date;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.*;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	@Autowired private MessageRepository messageRepository;
	@Autowired private MongoTemplate mongoTemplate;
	
	public void send(Message message) {
		messageRepository.save(message);
	}

	public long count(ObjectId id) {
		return mongoTemplate.count(Query.query(Criteria.where("to.id").is(id).andOperator(Criteria.where("read").is(false))), Message.class);
	}
	
	public List<Message> getByReceiverId(ObjectId id) {
		return mongoTemplate.find(Query.query(Criteria.where("to.id").is(id).andOperator(Criteria.where("read").is(false))), Message.class);
	}

	public void readAll(ObjectId id) {
		mongoTemplate.updateMulti(
				Query.query(Criteria.where("to.id").is(id).andOperator(Criteria.where("read").is(false))),
				Update.update("read", true).set("received", new Date()),
				Message.class);
	}
	
}
