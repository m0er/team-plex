package com.teamplex.spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;

import com.teamplex.user.User;
import com.teamplex.user.UserRepository;

/**
 * 스프링 시큐리티에서 인증받기 위한 서비스.
 * @author moer
 *
 */
public class TeamplexUserDetailsService implements UserDetailsService {
	@Autowired private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) {
		User domainUser = userRepository.findOneByEmail(username);
		
		if (domainUser == null) {
			throw new UsernameNotFoundException(username + " 사용자를 찾을 수 없습니다.");
		}
		
		return new TeamplexUserDetails(domainUser);
	}
}
