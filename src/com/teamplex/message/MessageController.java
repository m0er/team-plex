package com.teamplex.message;

import java.util.Date;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.teamplex.security.SecurityService;
import com.teamplex.user.User;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired MessageService messageService;
	@Autowired SecurityService securityService;
	
	@RequestMapping("/send/{toUser}")
	@ResponseBody
	public String send(@PathVariable User toUser, Message message) {
		message.setSent(new Date());
		message.setFrom(securityService.getCurrentUser());
		message.setTo(toUser);
		
		messageService.send(message);
		
		return "success";
	}
	
	@RequestMapping("/list/{receiverId}")
	@ResponseBody
	public List<Message> list(@PathVariable("receiverId") ObjectId receiverId) {
		return messageService.getByReceiverId(receiverId);
	}
	
	/**
	 * TODO: 메시지의 ObjectId 리스트를 받아서 처리하게끔 수정하자
	 * @param from
	 * @return
	 */
	@RequestMapping("/read")
	@ResponseBody
	public String read() {
		messageService.readAll(securityService.getCurrentUser().getId());
		return "success";
	}
	
}
