package com.yeamin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.constants.QueryConstants;
import com.yeamin.dao.ReservationDao;
import com.yeamin.dto.ReservationCapacityDto;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public ReservationDaoImpl() {
		
	}
	
	@Override
	public List<ReservationCapacityDto> selectReservationCapacityList(Map<String, Object> paramMap) {
		return sqlSession.selectList(QueryConstants.QID_SELECT_RESERVATION_CAPACITY_LIST, paramMap);
	}
	
	@Override
	public ReservationCapacityDto selectReservationCapacity(Map<String, Object> paramMap) {
		return sqlSession.selectOne(QueryConstants.QID_SELECT_RESERVATION_CAPACITY, paramMap);
	}
	
}
