package com.yeamin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.constants.QueryConstants;
import com.yeamin.dao.ReviewDao;
import com.yeamin.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public ReviewDaoImpl() {
		
	}
	
	@Override
	public List<ReviewDto> selectReviewList(){
		return sqlSession.selectList(QueryConstants.QID_SELECT_REVIEW_LIST);
	}
	
	@Override
	public ReviewDto selectReview(Map<String, Object> paramMap){
		return sqlSession.selectOne(QueryConstants.QID_SELETE_REVIEW, paramMap);
	}
	
	@Override
	public Integer insertReview(Map<String, Object> paramMap){
		return sqlSession.insert(QueryConstants.QID_INSERT_REVIEW, paramMap);
	}
	
	@Override
	public Integer updateReview(Map<String, Object> paramMap){
		return sqlSession.update(QueryConstants.QID_UPDATE_REVIEW, paramMap);
	}
	
	@Override
	public Integer deleteReview(Map<String, Object> paramMap){
		return sqlSession.delete(QueryConstants.QID_DELETE_REVIEW, paramMap);
	}
	
	@Override
	public String selectReviewMaxRef(){
		return sqlSession.selectOne(QueryConstants.QID_SELECT_REVIEW_MAXREF);
	}
	
	@Override
	public Integer insertReviewAnswerInputForm(Map<String, Object> paramMap){
		return sqlSession.insert(QueryConstants.QID_INSERT_REVIEW_ANSWER, paramMap);
	}
	
	@Override
	public Integer selectReviewCnt2(Map<String, Object> paramMap){
		return sqlSession.selectOne(QueryConstants.QID_SELECT_REVIEW_CNT2, paramMap);
	}
}
