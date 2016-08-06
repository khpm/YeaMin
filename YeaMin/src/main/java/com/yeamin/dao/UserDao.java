package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.UserDto;

public interface UserDao {
	
	public List<UserDto> selectUserList(Map<String, Object> paramMap);
	
	public Integer selectUserListCnt(Map<String, Object> paramMap);
	
	public UserDto selectUser(Map<String, Object> paramMap);
	
	public Integer insertUser(Map<String, Object> paramMap);
	
	public Integer updateUser(Map<String, Object> paramMap);
	
	public Integer deleteUser(Map<String, Object> paramMap);
	
}
