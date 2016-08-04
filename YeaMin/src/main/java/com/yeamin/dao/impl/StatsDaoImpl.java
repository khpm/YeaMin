package com.yeamin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.constants.QueryConstants;
import com.yeamin.dao.StatsDao;

@Repository
public class StatsDaoImpl implements StatsDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public StatsDaoImpl() {
		
	}
	
	@Override
	public List<Map<String, Object>> selectReviewCnt(Map<String, Object> paramMap) {
		return sqlSession.selectList(QueryConstants.QID_SELECT_REVIEW_CNT, paramMap);
	}
	
	@Override
	public List<Map<String, Object>> selectProductTop5(Map<String, Object> paramMap){
		return sqlSession.selectList(QueryConstants.QID_SELECT_PRODUCT_TOP5, paramMap);
	}
	
	@Override
	public List<Map<String, Object>> selectReservationAges(Map<String, Object> paramMap){
		return sqlSession.selectList(QueryConstants.QID_SELECT_RESERVATION_AGES, paramMap);
	}
}
