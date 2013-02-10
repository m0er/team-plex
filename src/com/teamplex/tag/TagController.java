package com.teamplex.tag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/tag")
public class TagController {
	@Autowired TagService tagService;
	
	@RequestMapping("/search")
	@ResponseBody
	public List<Tag> list(String term, Integer limit) {
		return tagService.listByTerm(term, limit == null ? 0 : limit);
	}
	
	@RequestMapping("/{term}/{limit}")
	@ResponseBody
	public List<Tag> listByPath(@PathVariable String term, @PathVariable Integer limit) {
		return tagService.listByTerm(term, limit);
	}
	
}
