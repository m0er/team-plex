package com.teamplex.mypage;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

import com.teamplex.post.Post;
import com.teamplex.user.User;

@Data
@NoArgsConstructor
public class MyPageDto {
	private List<Post> posts;
	private User user;
}
