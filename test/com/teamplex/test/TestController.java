package com.teamplex.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/angularjs/{name}")
	public String angularJs(@PathVariable String name) {
		return "/test/angularjs/" + name;
	}
	
}
