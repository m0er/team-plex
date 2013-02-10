package com.teamplex.spring.converter;

import java.lang.annotation.Annotation;
import java.util.Collections;
import java.util.Set;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.ConditionalGenericConverter;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.web.bind.annotation.PathVariable;

public class ObjectIdToDomainConverter implements ConditionalGenericConverter {
	@Autowired private MongoTemplate mongoTemplate;
	
	@Override
	public Set<ConvertiblePair> getConvertibleTypes() {
		return Collections.singleton(new ConvertiblePair(String.class, Object.class));
	}

	@Override
	public Object convert(Object source, TypeDescriptor sourceType, TypeDescriptor targetType) {
		ObjectId id = ObjectId.massageToObjectId(source);
		return mongoTemplate.findOne(Query.query(Criteria.where("id").is(id)), targetType.getType());
	}

	@Override
	public boolean matches(TypeDescriptor sourceType, TypeDescriptor targetType) {
		Annotation pathVariable = targetType.getAnnotation(PathVariable.class);
		
		if (pathVariable != null && targetType.getType().isAnnotationPresent(Document.class)) {
			return true;
		}
		
		return false;
	}

}
