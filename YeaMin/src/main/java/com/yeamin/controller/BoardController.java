package com.yeamin.controller;

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
import com.yeamin.dto.BoardDto;
import com.yeamin.dto.UserDto;
import com.yeamin.util.YmUtil;

@Controller
public class BoardController {

	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private BoardDao boardDao;
	
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
		
		return mav;
	}
	
	//게시글 등록
	@RequestMapping("/insertBoard.json")
	public @ResponseBody Map<String, Object> insertBoard(@RequestParam Map<String, Object> paramMap) {
		int refcnt = boardDao.getMaxRef();
		refcnt = refcnt + 1;
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
		Integer sqlResult = boardDao.deleteBoard(paramMap);
		if(sqlResult!=0){
			System.out.println("수정 성공");
		}else{
			System.out.println("수정 실패");
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		
		return ret;
	}
	
	@RequestMapping("/selectBoardList.json")
	public @ResponseBody Map<String, Object> selectBoardList(@RequestParam Map<String, Object> paramMap) {
		YmUtil.setPagingInfo(paramMap);
		List<BoardDto> list = boardDao.selectBoardList(paramMap);
		Integer totCnt = boardDao.selecBoardListCnt(paramMap);
		
		return YmUtil.getSelectListResult(paramMap, list, totCnt);
	}
	
}
