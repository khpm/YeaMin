package com.yeamin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.BoardDao;
import com.yeamin.dao.UserDao;
import com.yeamin.dto.BoardDto;
import com.yeamin.dto.UserDto;
import com.yeamin.util.YmUtil;

@Controller
public class BoardController {

	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private UserDao userDao;
	
	public BoardController() {
		
	}
	
	//게시판 화면
	@RequestMapping("/boardContents.do")
	public ModelAndView boardContents(){
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/board/boardContents.jsp");
		return mav;
	}
	
	//게시판 Modal
	@RequestMapping("/boardModal.do")
	public ModelAndView boardModal(@RequestParam Map<String, Object> paramMap ,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/WEB-INF/jsp/board/boardModal.jsp");
		mav.addObject("modalType", paramMap.get("modalType"));
		
		if(AppConstants.MODAL_TYPE_UPDATE.equals(paramMap.get("modalType"))) {
			BoardDto dto = boardDao.selectBoard(paramMap);
			int boardUserNo = dto.getUser_no();
			UserDto sessionDto = (UserDto)request.getSession().getAttribute("user");
			if(sessionDto != null){
				int sessionUserNo = sessionDto.getUser_no();
			
				if(boardUserNo != sessionUserNo){
					boardDao.updateBoardReadCount(paramMap);
					dto = boardDao.selectBoard(paramMap);
				}else{
					
				}
			}
			mav.addObject("dto", dto);
		}
		
		if(AppConstants.MODAL_TYPE_REPLY.equals(paramMap.get("modalType"))) {
			int board_no = Integer.parseInt((String)paramMap.get("board_no"));
			mav.addObject("board_no", board_no);
		}
		
		return mav;
	}
	
	//게시글 등록
	@RequestMapping("/insertBoard.json")
	public @ResponseBody Map<String, Object> insertBoard(@RequestParam Map<String, Object> paramMap) {
		UserDto dto = userDao.selectUser(paramMap);
		int refcnt = 0;
		if(dto.getIs_admin().equals("N")){
			refcnt = boardDao.getMaxRef();
			refcnt = refcnt + 1;
		}else{
			refcnt = boardDao.getNoticeMaxRef();
			if(refcnt < 1000){
				refcnt = 1000;
			}else{
				refcnt = refcnt + 1;
			}
			
		}
		paramMap.put("board_re_ref",refcnt);
		
		Integer sqlResult = boardDao.insertBoard(paramMap);
		if(sqlResult!=0){
			System.out.println("등록 성공");
		}else{
			System.out.println("등록 실패");
		}
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
	}
	
	@RequestMapping("/updateBoard.json")
	public @ResponseBody Map<String, Object> updateBoard(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = boardDao.updateBoard(paramMap);
		if(sqlResult!=0){
			System.out.println("수정 성공");
		}else{
			System.out.println("수정 실패");
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
	}
		
	@RequestMapping("/deleteBoard.json")
	public @ResponseBody Map<String, Object> deleteBoard(@RequestParam Map<String, Object> paramMap) {
		Map<String, Object> ret = new HashMap<String, Object>();
		Integer sqlResult = boardDao.selectBoardDeleteCheck(paramMap);
		if(sqlResult == 0){
			boardDao.deleteBoard(paramMap);
			System.out.println("삭제 성공");
			ret.put("result", "ok");
		}else{
			System.out.println("삭제 실패");
			ret.put("result", "error");
		}
		
		return ret;
	}
	
	@RequestMapping("/selectBoardList.json")
	public @ResponseBody Map<String, Object> selectBoardList(@RequestParam Map<String, Object> paramMap) {
		YmUtil.setPagingInfo(paramMap);
		List<BoardDto> list = boardDao.selectBoardList(paramMap);
		Integer totCnt = boardDao.selecBoardListCnt(paramMap);
		List<BoardDto> changeList = new ArrayList<BoardDto>();
		for(BoardDto dto : list){
			if(dto.getBoard_re_step() !=0 ){
				String nbsp ="";
				for(int i = 0;i<dto.getBoard_re_level()-1;i++){
					nbsp += "&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				String board_title = dto.getBoard_title();
				dto.setBoard_title(nbsp + "└ " + board_title);
			}
			changeList.add(dto);
		}
		return YmUtil.getSelectListResult(paramMap, changeList, totCnt);
	}
	
	//댓글 등록
	@RequestMapping("/insertReply.json")
	public @ResponseBody Map<String, Object> insertReply(@RequestParam Map<String, Object> paramMap) {
		BoardDto dto = boardDao.selectBoard(paramMap); //댓글을 다려는 상위 글의 정보를 가져옴
		int re_ref = dto.getBoard_re_ref();
		int re_step = dto.getBoard_re_step();
		int re_level = dto.getBoard_re_level();
		paramMap.put("board_re_ref", re_ref);
		paramMap.put("board_re_step", re_step);
		
		Integer sqlResult = boardDao.updateBoardReplyStep(paramMap);
		re_step ++;
		re_level ++;
		
		paramMap.put("board_re_ref", re_ref);
		paramMap.put("board_re_step", re_step);
		paramMap.put("board_re_level", re_level);
		sqlResult = boardDao.insertBoardReply(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
	}
	
	@RequestMapping("/selectBoardCnt.json")
	public @ResponseBody Map<String, Object> selectBoardCnt(@RequestParam Map<String, Object> paramMap) {
		Integer boardCnt = boardDao.selectBoardCnt(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("boardCnt", boardCnt);
		ret.put("result", "ok");
		
		return ret;
	}
}
