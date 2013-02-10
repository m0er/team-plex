package com.teamplex.user;

import java.util.*;

import lombok.Data;
import lombok.NoArgsConstructor;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

import com.teamplex.security.Role;
import com.teamplex.tag.Tag;
import com.teamplex.util.TeamplexUtil;

@Data
@Document
@NoArgsConstructor
public class User {
	private ObjectId id;
	private Date joined;
	private String email;
	private String password;
	private String nickname;
	private String encodeProfileImage;
	private List<Role> roles;
	private Status status;
	
	private List<Tag> tags;
	
	public enum Status {
		ACTIVE, INACTIVE, DEACTIVATED, LOCKED
	}
	
	@SuppressWarnings("unused")
	private String tagPrint;
	
	public User(String email, String password, String nickname, String encodeProfileImage) {
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.encodeProfileImage = encodeProfileImage;
	}
	
	public void setTags(List<Tag> tags) {
		if (tags == null)
			tags = new ArrayList<>();
		
		this.tags = tags;
	}
	
	public String getTagPrint() {
		return TeamplexUtil.getCsvTagValues(tags);
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", joined=" + joined + ", email=" + email
				+ ", password=" + password + ", nickname=" + nickname
				+ ", roles=" + roles + " ]";
	}
}