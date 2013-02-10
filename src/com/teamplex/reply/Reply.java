package com.teamplex.reply;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

import com.teamplex.user.User;

@Data
@Document
@NoArgsConstructor
public class Reply {
	private ObjectId id;
	private String idString;
	
	private Date created;
	private String content;
	private ObjectId postId;
	
	private User writer;
	
	private boolean contentWriter;
	
	public Reply(String content, User writer) {
		this.content = content;
		this.writer = writer;
	}

	public void setId(ObjectId id) {
		this.id = id;
		this.idString = id.toString();
	}

	public String getIdString() {
		if (idString == null && id != null)
			return id.toString();
		return idString;
	}

	@Override
	public String toString() {
		return "Reply [id=" + id + ", created=" + created + ", content="
				+ content + ", postId=" + postId + ", writer=" + writer + "]";
	}
	
}