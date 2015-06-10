package com.teamplex.test.android;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AndroidTestController {
	
	@RequestMapping("/test/useragent")
	@ResponseBody
	public String userAgent(@RequestHeader("User-Agent") String userAgent) {
		return userAgent;
	}
	
}
