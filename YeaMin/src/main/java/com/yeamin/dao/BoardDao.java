package com.yeamin.dao;

import java.util.List;
import java.util.Map;

import com.yeamin.dto.BoardDto;

public interface BoardDao {
	public Integer insertBoard(Map<String, Object> paramMap);
	public Integer getMaxRef();
	public Integer getNoticeMaxRef();
	public List<BoardDto> selectBoardList(Map<String, Object> paramMap);
	public Integer selecBoardListCnt(Map<String, Object> paramMap);
	public BoardDto selectBoard(Map<String, Object> paramMap);
	public Integer updateBoard(Map<String, Object> paramMap);
	public Integer deleteBoard(Map<String, Object> paramMap);
	public Integer updateBoardReadCount(Map<String, Object> paramMap);
	public Integer selectBoardCnt(Map<String, Object> paramMap);
	
	public Integer updateBoardReplyStep(Map<String, Object> paramMap);
	public Integer insertBoardReply(Map<String, Object> paramMap);
	public Integer selectBoardDeleteCheck(Map<String, Object> paramMap);
}
