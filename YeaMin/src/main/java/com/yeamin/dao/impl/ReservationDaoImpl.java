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
import com.yeamin.dto.ReservationDto;
import com.yeamin.dto.ReservationProductDto;

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
	public Integer selectReservationCapacityListCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne(QueryConstants.QID_SELECT_RESERVATION_CAPACITY_LIST_CNT, paramMap);
	}
	
	@Override
	public ReservationCapacityDto selectReservationCapacity(Map<String, Object> paramMap) {
		return sqlSession.selectOne(QueryConstants.QID_SELECT_RESERVATION_CAPACITY, paramMap);
	}

	@Override
	public Integer insertReservationCapacity(Map<String, Object> paramMap) {
		return sqlSession.insert(QueryConstants.QID_INSERT_RESERVATION_CAPACITY, paramMap);
	}
	
	@Override
	public Integer updateReservationCapacity(Map<String, Object> paramMap) {
		return sqlSession.delete(QueryConstants.QID_UPDATE_RESERVATION_CAPACITY, paramMap);
	}
	
	@Override
	public Integer deleteReservationCapacity(Map<String, Object> paramMap) {
		return sqlSession.delete(QueryConstants.QID_DELETE_RESERVATION_CAPACITY, paramMap);
	}
	
	@Override
	public Integer selectReservationNoSeq() {
		return sqlSession.selectOne(QueryConstants.QID_SELECT_RESERVATION_NO_SEQ);
	}
	
	@Override
	public List<ReservationDto> selectReservationList(Map<String, Object> paramMap) {
		return sqlSession.selectList(QueryConstants.QID_SELECT_RESERVATION_LIST, paramMap);
	}
	
	@Override
	public ReservationDto selectReservation(Map<String, Object> paramMap) {
		return sqlSession.selectOne(QueryConstants.QID_SELECT_RESERVATION, paramMap);
	}
	
	@Override
	public Integer insertReservation(Map<String, Object> paramMap) {
		return sqlSession.insert(QueryConstants.QID_INSERT_RESERVATION, paramMap);
	}
	
	@Override
	public Integer updateReservation(Map<String, Object> paramMap) {
		return sqlSession.delete(QueryConstants.QID_UPDATE_RESERVATION, paramMap);
	}
	
	@Override
	public Integer deleteReservation(Map<String, Object> paramMap) {
		return sqlSession.delete(QueryConstants.QID_DELETE_RESERVATION, paramMap);
	}
	
	@Override
	public List<ReservationProductDto> selectReservationProductList(Map<String, Object> paramMap) {
		return sqlSession.selectList(QueryConstants.QID_SELECT_RESERVATION_PRODUCT_LIST, paramMap);
	}
	
	@Override
	public Integer insertReservationProduct(Map<String, Object> paramMap) {
		return sqlSession.insert(QueryConstants.QID_INSERT_RESERVATION_PRODUCT, paramMap);
	}
	
	@Override
	public List<ReservationDto> selectReservationPeople(Map<String, Object> paramMap){
		return sqlSession.selectList(QueryConstants.QID_SELECT_RESERVATION_PEOPLE, paramMap);
	}
	
}
