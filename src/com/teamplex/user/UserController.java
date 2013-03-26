package com.teamplex.user;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.teamplex.tag.TagService;

@Slf4j
@Controller
public class UserController {
	@Autowired UserService userService;
	@Autowired TagService tagService;
	
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String signup(User user, @RequestParam("profileImage") MultipartFile profileImage) {
		log.info("signup user info: {}", user.toString());
		log.info("File '{}' uploaded successfully", profileImage.getOriginalFilename());
		
		userService.add(user, profileImage);
		tagService.upsert(user.getTags());
		
		return "redirect:/list";
	}
	
	//TODO: 로그인 에러 메시지 사용하려면 failure, success 핸들러 등록해야됨.
//	@RequestMapping("/login")
//	public void login(@RequestHeader("referer") String referer, Model model) {
//		log.info("referer: {}", referer);
//		model.addAttribute("referer", referer);
//	}
	
	@RequestMapping("/login/form")
	public String loginForm(String message, Model model) {
		model.addAttribute("message", message);
		return "login/form";
	}
	
//	@RequestMapping("/login/failure")
//	public String loginFailure(Model model) {
//		model.addAttribute("message", "login fail");
//		return "login/form";
//	}
	
	@RequestMapping("/logout")
	public String logout(@RequestHeader("referer") String referer, SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:" + referer;
	}
	
}
