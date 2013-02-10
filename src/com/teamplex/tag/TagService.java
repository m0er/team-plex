package com.teamplex.tag;

import static org.springframework.data.mongodb.core.query.Criteria.*;
import static org.springframework.data.mongodb.core.query.Query.*;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.*;
import org.springframework.stereotype.Service;

@Slf4j
@Service("tagService")
public class TagService {
	@Autowired private TagRepository tagRepository;
	@Autowired private MongoTemplate mongoTemplate;
	
	/**
	 * 있으면 Update or 없으면 Insert
	 * @param tag
	 * @return
	 */
	public Tag upsert(Tag tag) {
		String value = tag.getValue();
		mongoTemplate.upsert(query(where("value").is(value)), new Update().inc("count", 1L), Tag.class);
		
		Tag found = tagRepository.findByValue(value);
		
		log.info(tag.getValue() + " count: " + found.getCount());
		
		return found;
	}

	public void upsert(List<Tag> tags) {
		if (tags == null)  {
			log.debug("TagService.upsert(List<Tag>) :: " + "태그 리스트가 null 입니다");
			return;
		}
		
		for (Tag tag : tags) {
			upsert(tag);
		}
	}
	
	public void delete(Tag tag) {
		String value = tag.getValue();
		Tag found = tagRepository.findByValue(value);
		
		if (found.getCount() > 0) {
			mongoTemplate.upsert(query(where("value").is(value)), new Update().inc("count", -1L), Tag.class);
		} else {
			tagRepository.delete(tag);
		}
	}

	public List<Tag> listByTerm(String term, int limit) {
		return mongoTemplate.find(Query.query(Criteria.where("value").regex("^" + term + ".*")).limit(limit), Tag.class);
	}
}