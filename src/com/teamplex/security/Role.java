package com.teamplex.security;

/**
 * 유저의 권한을 나타내기 위해 사용하며, 스프링 시큐리티에서도 사용된다.
 * 
 * @author mOer
 *
 */
public enum Role {
	ADMIN("ROLE_ADMIN", 1), USER("ROLE_USER", 2);
	
	private String name;
	private int value;
	
	private Role(String name, int value) {
		this.name = name;
		this.value = value;
	}
	
	public String getName() {
		return name;
	}
	
	public int getValue() {
		return value;
	}
}
