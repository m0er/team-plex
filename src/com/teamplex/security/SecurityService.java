package com.teamplex.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.teamplex.spring.security.TeamplexUserDetails;
import com.teamplex.user.User;

/**
 * 스프링 시큐리티와 연동해 현재 사용자 정보를 가져오기 위해 사용한다.
 * 
 * @author mOer
 *
 */
@Service
public class SecurityService {
	
	public User getCurrentUser() {
		Authentication authentication = getAuthentication();
		
		if (authentication == null) return null;
		
		Object principal = authentication.getPrincipal();
		if (principal instanceof UserDetails) {
			return ((TeamplexUserDetails) principal).getUser();
		} else {
			return null;
		}
	}
	
	public boolean isAuthenticated() {
		return getAuthentication().getPrincipal() instanceof UserDetails;
	}
	
	private Authentication getAuthentication() {
		return SecurityContextHolder.getContext().getAuthentication();
	}
}
