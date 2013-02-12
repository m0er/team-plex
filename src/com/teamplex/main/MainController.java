package com.teamplex.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.teamplex.message.Message;
import com.teamplex.message.MessageService;
import com.teamplex.search.Search;
import com.teamplex.search.SearchService;
import com.teamplex.security.SecurityService;
import com.teamplex.user.User;

@Controller
public class MainController {
	@Autowired SearchService searchService;
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
	
	@RequestMapping({"/", "/index"})
	public String index() {
		return "main/index";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		Search search = searchService.recent();
		model.addAttribute("search", search);
		
		return "main/list";
	}
	
	@RequestMapping("/list/{term}")
	public String search(@PathVariable String term, Model model) {
		Search search = searchService.search(term);
		model.addAttribute("search", search);
		
		return "main/list";
	}
}
