package com.yeamin.dao.impl;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.constants.QueryConstants;
import com.yeamin.dao.ReviewDao;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public ReviewDaoImpl() {
		
	}
	
	@Override
	public Integer insertReview(Map<String, Object> paramMap){
		return sqlSession.insert(QueryConstants.QID_INSERT_REVIEW, paramMap);
	}
	
	@Override
	public String selectReviewMaxRef(){
		return sqlSession.selectOne(QueryConstants.QID_SELECT_REVIEW_MAXREF);
	}
}
