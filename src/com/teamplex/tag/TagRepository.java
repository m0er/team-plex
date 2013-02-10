package com.teamplex.tag;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface TagRepository extends MongoRepository<Tag, ObjectId> {

	Tag findByValue(String value);

}
