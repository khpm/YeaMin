package com.yeamin.dao.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.constants.QueryConstants;
import com.yeamin.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserDaoImpl() {
		
	}
	
	public int userCount() {
		return sqlSession.selectOne(QueryConstants.QID_SELECT_USER_COUNT);
	}
	
}
