package com.yeamin.dao.impl;

import java.util.List;
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

	@Override
	public List<UserDto> selectUserList(Map<String, Object> paramMap) {
		return sqlSession.selectList(QueryConstants.QID_SELECT_USER_LIST, paramMap);
	}
	
	@Override
	public Integer selectUserListCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne(QueryConstants.QID_SELECT_USER_LIST_CNT, paramMap);
	}
	
	@Override
	public UserDto selectUser(Map<String, Object> paramMap) {
		return sqlSession.selectOne(QueryConstants.QID_SELECT_USER, paramMap);
	}

	@Override
	public Integer insertUser(Map<String, Object> paramMap) {
		return sqlSession.insert(QueryConstants.QID_INSERT_USER, paramMap);
	}

	@Override
	public Integer updateUser(Map<String, Object> paramMap) {
		return sqlSession.update(QueryConstants.QID_UPDATE_USER, paramMap);
	}

	@Override
	public Integer deleteUser(Map<String, Object> paramMap) {
		return sqlSession.delete(QueryConstants.QID_DELETE_USER, paramMap);
	}
	
}
