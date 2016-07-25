package com.yeamin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeamin.constants.QueryConstants;
import com.yeamin.dao.BoardDao;
import com.yeamin.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	public BoardDaoImpl() {
		
	}
	
	@Override
	public Integer insertBoard(Map<String, Object> paramMap){
		Integer result = sqlSession.insert(QueryConstants.QID_INSERT_BOARD, paramMap);
		if(result!=0){
			System.out.println("등록 성공");
		}else{
			System.out.println("등록 실패");
		}
		return result;
	}
	
	@Override
	public Integer getMaxRef(){
		return sqlSession.selectOne(QueryConstants.QID_INSERT_BOARD_MAXREF);
	}
	
	@Override
	public List<BoardDto> selectBoardList(Map<String, Object> paramMap){
		return sqlSession.selectList(QueryConstants.QID_SELECT_BOARD_LIST);
	}
	
	@Override
	public BoardDto selectBoard(Map<String, Object> paramMap){
		return sqlSession.selectOne(QueryConstants.QID_SELECT_BOARD_LIST_ONE,paramMap);
	}
	
	@Override
	public Integer updateBoard(Map<String, Object> paramMap){
		return sqlSession.update(QueryConstants.QID_UPDATE_BOARD, paramMap);
	}
}
