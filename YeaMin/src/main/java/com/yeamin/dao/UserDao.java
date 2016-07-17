package com.yeamin.dao;

import java.util.Map;

import com.yeamin.dto.UserDto;

public interface UserDao {
	
	public UserDto selectUser(Map<String, Object> paramMap);
	
}
