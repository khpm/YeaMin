package com.yeamin.dao.impl;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.constants.QueryConstants;
import com.yeamin.dao.StoreDao;
import com.yeamin.dto.StoreDto;

@Repository
public class StoreDaoImpl implements StoreDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public StoreDaoImpl() {
		
	}
	
	
	@Override
	public StoreDto selectStore(){
		return sqlSession.selectOne(QueryConstants.QID_SELECT_STORE);
	}
	
	@Override
	public Integer insertStore(Map<String, Object> paramMap){
		return sqlSession.insert(QueryConstants.QID_INSERT_STORE, paramMap);
	}
	
	@Override
	public Integer updateStore(Map<String, Object> paramMap){
		return sqlSession.update(QueryConstants.QID_UPDATE_STORE, paramMap);
	}
	
	@Override
	public Integer insertStoreImg(Map<String, Object> paramMap){
		return sqlSession.insert(QueryConstants.QID_INSERT_STORE_IMG, paramMap);
	}

	
}
