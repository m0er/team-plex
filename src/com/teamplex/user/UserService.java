package com.teamplex.user;

import java.util.*;

import lombok.extern.slf4j.Slf4j;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.teamplex.security.Role;
import com.teamplex.util.TeamplexUtil;

@Slf4j
@Service("userService")
public class UserService {
	@Autowired private UserRepository userRepository;
	
	public void add(User user, MultipartFile profileImage) {
		user.setJoined(new Date());
		user.setRoles(Arrays.asList(Role.USER));
		user.setStatus(User.Status.ACTIVE);
		
		String email = user.getEmail();
		user.setNickname(getNickname(email));
		user.setEncodeProfileImage(TeamplexUtil.base64Encode(profileImage));
		
		userRepository.save(user);
	}
	
	public User login(User user) {
		User found = userRepository.findOneByEmailAndPassword(user.getEmail(), user.getPassword());
		
		if (found != null) {
			log.info("로그인 성공!: {}", found.toString());
			User loginUser = userRepository.findOneSimpleById(found.getId());
			return loginUser;
		} else {
			log.info("사용자를 찾을 수 없습니다: {}", user.toString());
			return null;
		}
	}

	private String getNickname(String email) {
		return email.split("@")[0];
	}

	public List<User> getByTag(String term) {
		List<User> users = userRepository.findSimpleByTagsValue(term);
		return users;
	}
	
	public User getById(ObjectId id) {
		User user = userRepository.findOne(id);
		return user;
	}

	public User updateUser(User user) {
		return userRepository.save(user);
	}

	public List<User> getRecent(final int limit) {
		Pageable pageable = new PageRequest(0, limit, Direction.DESC, "joined");
		return userRepository.findAllSimplePageable(pageable);
	}

	public User getByEmail(String email) {
		return userRepository.findOneByEmail(email);
	}

	public List<User> getByRole(Role role) {
		return userRepository.findSimpleByRole(role);
	}
}