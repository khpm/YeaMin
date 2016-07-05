package com.yeamin.dao.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.dao.ReviewDao;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public ReviewDaoImpl() {
		
	}
	
}
