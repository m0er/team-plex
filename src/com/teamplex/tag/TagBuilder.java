package com.teamplex.tag;

import java.util.ArrayList;
import java.util.List;

import lombok.val;

public class TagBuilder {
	private List<Tag> tags = new ArrayList<>();
	
	public TagBuilder add(String... values) {
		for (val value : values)
			tags.add(new Tag(value));
		
		return this;
	}
	
	public List<Tag> build() {
		return tags;
	}
	
}
