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
	public Integer getNoticeMaxRef(){
		return sqlSession.selectOne(QueryConstants.QID_INSERT_BOARD_NOTICE_MAXREF);
	}
	
	@Override
	public List<BoardDto> selectBoardList(Map<String, Object> paramMap){
		return sqlSession.selectList(QueryConstants.QID_SELECT_BOARD_LIST, paramMap);
	}
	
	@Override
	public Integer selecBoardListCnt(Map<String, Object> paramMap){
		return sqlSession.selectOne(QueryConstants.QID_SELECT_BOARD_LIST_CNT, paramMap); 
		
	}
	
	@Override
	public BoardDto selectBoard(Map<String, Object> paramMap){
		return sqlSession.selectOne(QueryConstants.QID_SELECT_BOARD_LIST_ONE,paramMap);
	}
	
	@Override
	public Integer updateBoard(Map<String, Object> paramMap){
		return sqlSession.update(QueryConstants.QID_UPDATE_BOARD, paramMap);
	}
	
	@Override
	public Integer deleteBoard(Map<String, Object> paramMap){
		return sqlSession.delete(QueryConstants.QID_DELETE_BOARD, paramMap);
	}
	
	@Override
	public Integer updateBoardReadCount(Map<String, Object> paramMap){
		return sqlSession.update(QueryConstants.QID_UPDATE_BOARD_READCOUNT, paramMap);
	}
	
	@Override
	public Integer updateBoardReplyStep(Map<String, Object> paramMap){
		return sqlSession.update(QueryConstants.QID_UPDATE_BOARD_REPLY_STEP, paramMap);
	}
	
	@Override
	public Integer insertBoardReply(Map<String, Object> paramMap){
		return sqlSession.insert(QueryConstants.QID_INSERT_BOARD_REPLY, paramMap);
	}
	
	@Override
	public Integer selectBoardDeleteCheck(Map<String, Object> paramMap){
		return sqlSession.selectOne(QueryConstants.QID_SELETE_BOARD_DELETE_CHECK, paramMap);
	}
	
	@Override
	public Integer selectBoardCnt(Map<String, Object> paramMap){
		return sqlSession.selectOne(QueryConstants.QID_SELECT_BOARD_CNT, paramMap);
	}
}
