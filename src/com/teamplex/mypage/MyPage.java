package com.teamplex.mypage;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

import com.teamplex.tag.Tag;

@Data
@NoArgsConstructor
public class MyPage {
	private String email;
	private String nickname;
	private List<Tag> tags;
}