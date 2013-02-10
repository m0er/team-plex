package com.teamplex.post;

import lombok.extern.slf4j.Slf4j;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.teamplex.reply.ReplyService;
import com.teamplex.security.SecurityService;
import com.teamplex.tag.TagService;

@Slf4j
@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired TagService tagService;
	@Autowired PostService postService;
	@Autowired ReplyService replyService;
	@Autowired SecurityService securityService;
	
	@RequestMapping("/write")
	public String create(Post post, @RequestHeader("referer") String referer) {
		postService.create(securityService.getCurrentUser(), post);
		tagService.upsert(post.getTags());
		
		return "redirect:" + referer;
	}
	
	@RequestMapping("/modify")
	public String modify(Post post, String originalPostId, @RequestHeader("referer") String referer) {
		ObjectId id = new ObjectId(originalPostId);
		Post originalPost = postService.get(id);
		originalPost.setContent(post.getContent());
		originalPost.setTitle(post.getTitle());
		originalPost.setTags(post.getTags());
		
		postService.create(securityService.getCurrentUser(), originalPost);
		
		return "redirect:" + referer;
	}
	
	@RequestMapping("/{id}")
	@ResponseBody
	public PostAndRepliesDto get(@PathVariable ObjectId id) {
		log.info("Post Id:" + id);
		
		PostAndRepliesDto dto = new PostAndRepliesDto();
		dto.setPost(postService.increaseViewCountThenRetrieve(id, securityService.getCurrentUser()));
		dto.setReplies(replyService.getByPostId(id));
		
		return dto;
	}
	
	@RequestMapping("/{id}/delete")
	public String delete(@PathVariable ObjectId id, @RequestHeader("referer") String referer) {
		log.info("Post Id:" + id);
		log.info("referer:" + referer);
		
		postService.deleteById(id);
		return "redirect:" + referer;
	}
}
