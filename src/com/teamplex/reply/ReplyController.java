package com.teamplex.reply;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.teamplex.post.Post;
import com.teamplex.post.PostService;
import com.teamplex.security.SecurityService;
import com.teamplex.user.User;

@Slf4j
@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired PostService postService;
	@Autowired ReplyService replyService;
	@Autowired SecurityService securityService;
	
	@RequestMapping("/add")
	@ResponseBody
	public Reply add(Reply reply) {
		reply = replyService.add(securityService.getCurrentUser(), reply);
		
		log.info("reply added: " + reply.toString());
		
		updatePost(reply);
		
		return reply;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Reply update(Reply reply) {
		Reply origin = replyService.get(reply.getId());
		
		log.info("original reply: " + origin.toString());
		
		origin.setContent(reply.getContent());
		replyService.update(origin);
		
		return origin;
	}

	private void updatePost(Reply reply) {
		Post post = postService.get(reply.getPostId());
		List<ObjectId> replyIds = post.getReplyIds();
		replyIds.add(reply.getId());
		post.setReplyIds(replyIds);
		
		postService.update(post);
	}
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable ObjectId id) {
		replyService.delete(id);
		return "success";
	}
	
	@RequestMapping("/{postId}")
	@ResponseBody
	public List<Reply> get(@PathVariable ObjectId postId) {
		List<Reply> replies = replyService.getByPostId(postId);
		User currentUser = securityService.getCurrentUser();
		
		for (Reply reply : replies) {
			if (currentUser != null && currentUser.getId().equals(reply.getWriter().getId())) {
				reply.setContentWriter(true);
			}
		}
		
		return replies;
	}
}
