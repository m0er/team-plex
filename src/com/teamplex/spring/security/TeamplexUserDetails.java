package com.teamplex.spring.security;

import java.util.*;

import lombok.Data;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.teamplex.security.Role;
import com.teamplex.user.User;
import com.teamplex.user.User.Status;

/**
 * 스프링 시큐리티에서 인증된 사용자의 principal을 나타낸다.
 * @author mOer
 *
 */
@Data
@SuppressWarnings("serial")
public class TeamplexUserDetails implements UserDetails {
	private User user;
	private Collection<? extends GrantedAuthority> authorities;
	
	public TeamplexUserDetails(User user) {
		this.user = user;
		this.authorities = getGrantedAuthorities(getRoles(user.getRoles()));
	}
	
	public User getUser() {
		user.setPassword(null);
		return user;
	}

	private List<String> getRoles(List<Role> roles) {
		List<String> roleStrings = new ArrayList<String>();
		
		for (Role role : roles) {
			roleStrings.add(role.getName());
		}
		
		return roleStrings;
	}

	private List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}

		return authorities;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getNickname();
	}

	@Override
	public boolean isAccountNonExpired() {
		return user.getStatus() != Status.DEACTIVATED;
	}

	@Override
	public boolean isAccountNonLocked() {
		return user.getStatus() != Status.LOCKED;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return user.getStatus() == Status.ACTIVE;
	}

}
