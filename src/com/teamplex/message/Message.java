package com.teamplex.message;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

import org.springframework.data.mongodb.core.mapping.Document;

import com.teamplex.user.User;

@Data
@Document
public class Message {
	private boolean read;
	private String content;
	private User from;
	private User to;
	private Date sent;
	private Date received;
	private String sentString;
	
	public void setSent(Date sent) {
		this.sent = sent;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mmZ");
		this.sentString = df.format(new Date());
	}
	
	@Override
	public String toString() {
		return "Message [read=" + read + ", content=" + content + ", from="
				+ from + ", to=" + to + ", sent=" + sent + ", received="
				+ received + "]";
	}
}
