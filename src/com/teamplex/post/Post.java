package com.teamplex.post;

import java.util.*;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

import com.teamplex.tag.Tag;
import com.teamplex.user.User;
import com.teamplex.util.TeamplexUtil;

@Data
@Document
@NoArgsConstructor
public class Post {
	private ObjectId id;
	private String title;
	private Date created;
	private Long viewCount;
	private String content;

	private User writer;
	private List<Tag> tags;
	@SuppressWarnings("unused")
	private String tagPrint;
	private List<ObjectId> replyIds;
	
	private boolean contentWriter;
	
	public Post(String title, String content, User writer) {
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	
	public List<ObjectId> getReplyIds() {
		if (replyIds == null)
			replyIds = new ArrayList<ObjectId>();
		return replyIds;
	}
	
	public String getTagPrint() {
		return TeamplexUtil.getCsvTagValues(tags);
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", created=" + created
				+ ", viewCount=" + viewCount + ", content=" + content
				+ ", writer=" + writer.getNickname() + ", tags=" + tags + ", replyIds="
				+ replyIds + "]";
	}
	
}
