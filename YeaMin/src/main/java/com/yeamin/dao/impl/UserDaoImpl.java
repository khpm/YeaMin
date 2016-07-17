package com.yeamin.dao.impl;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.constants.QueryConstants;
import com.yeamin.dao.UserDao;
import com.yeamin.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserDaoImpl() {
		
	}
	
	public UserDto selectUser(Map<String, Object> paramMap) {
		return sqlSession.selectOne(QueryConstants.QID_SELECT_USER, paramMap);
	}
	
}
