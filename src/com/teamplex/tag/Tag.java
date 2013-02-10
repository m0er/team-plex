package com.teamplex.tag;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document
@NoArgsConstructor
public class Tag {
	private ObjectId id;
	private String value;
	private Long count = 1L;
	
	public Tag(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "Tag [id=" + id + ", value=" + value + ", count=" + count + "]";
	}
}
