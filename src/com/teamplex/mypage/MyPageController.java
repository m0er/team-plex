package com.teamplex.mypage;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.teamplex.message.Message;
import com.teamplex.message.MessageService;
import com.teamplex.security.SecurityService;
import com.teamplex.tag.TagService;
import com.teamplex.user.User;
import com.teamplex.user.UserService;
import com.teamplex.util.TeamplexUtil;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired TagService tagService;
	@Autowired UserService userService;
	@Autowired MyPageService myPageService;
	@Autowired MessageService messageService;
	@Autowired SecurityService securityService;
	
	@ModelAttribute("notifications")
	public List<Message> notifications() {
		if (securityService.isAuthenticated()) {
			return messageService.getByReceiverId(securityService.getCurrentUser().getId());
		}
		
		return null;
	}
	
	@ModelAttribute("currentUser")
	public User currentUser() {
		return securityService.getCurrentUser();
	}
	
	@RequestMapping("/{userId}")
	public String mypage(@PathVariable ObjectId userId, Model model) {
		log.info("MyPageController.mypage(): {}", userId);
		
		MyPageDto myPageDto = myPageService.getInfo(userId);
		model.addAttribute("dto", myPageDto);
		
		return "mypage/index";
	}
	
	@PreAuthorize("#currentUser.id.toString() == #userId.toString()")
	@RequestMapping("/{userId}/form")
	public String form(@PathVariable ObjectId userId, @ModelAttribute("currentUser") User currentUser, Model model) {
		log.info("MyPageController.form(): {}", userId);
		
		MyPageDto myPageDto = myPageService.getInfo(userId);
		model.addAttribute("dto", myPageDto);
		
		return "mypage/form";
	}

	@RequestMapping(value="/{userId}/update", method=RequestMethod.POST)
	public String updateUser(@PathVariable ObjectId userId, MyPage mypage, Model model) {
		log.info("MyPageController.updateUser() called");
		User user = myPageService.update(userId, mypage);
		tagService.upsert(mypage.getTags());
		if (user != null) {
			return "redirect:/mypage/" + user.getId();
		}
		return null;
	}
	
	@RequestMapping(value="/{userId}/profileImage/update", method=RequestMethod.POST)
	@ResponseBody
	public String updateProfileImage(@PathVariable ObjectId userId, @RequestParam("profileImage") MultipartFile profileImage) {
		myPageService.updateProfileImage(userId, profileImage);
		return Base64.encode(TeamplexUtil.getBytes(profileImage)).toString();
	}
	
	@RequestMapping(value="/{userId}/verify", method=RequestMethod.POST)
	@ResponseBody
	public boolean verifyPassword(@PathVariable ObjectId userId, @RequestParam("password") String password) {
		return myPageService.isVerify(userId, password);
	}
	
	@RequestMapping(value="/{userId}/password/update", method=RequestMethod.POST)
	@ResponseBody
	public boolean updatePassword(@PathVariable ObjectId userId, @RequestParam String newPasswordAgain) {
		User user = userService.getById(userId);
		user.setPassword(newPasswordAgain);
		
		userService.updateUser(user);
		return true;
	}
	
}