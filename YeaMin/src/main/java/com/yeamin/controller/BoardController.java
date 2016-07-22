package com.yeamin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.BoardDao;
import com.yeamin.dto.BoardDto;

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
	public ModelAndView boardModal(@RequestParam Map<String, Object> paramMap) {
		ModelAndView mav = new ModelAndView("/WEB-INF/jsp/board/boardModal.jsp");
		mav.addObject("modalType", paramMap.get("modalType"));
		if(AppConstants.MODAL_TYPE_UPDATE.equals(paramMap.get("modalType"))) {
			//BoardDto dto = boardDao.selectProductCategory(paramMap);
			//mav.addObject("dto", dto);
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
	
	@RequestMapping("/selectBoardList.json")
	public @ResponseBody Map<String, Object> selectBoardList(@RequestParam Map<String, Object> paramMap) {
		List<BoardDto> list=boardDao.selectBoardList(paramMap);
		return getSelectListResult(paramMap,list);
	}
	
	public Map<String, Object> getSelectListResult(Map<String, Object> paramMap, List<?> list) {
		int listCount = list.size();
		int pageCount = 1; // 전체 페이지 개수
		int pageSize = 100; // 한 페이지에 들어갈 개수
		int mok = listCount / pageSize;
		int nmg = listCount % pageSize;
		
		if(nmg == 0) {
			pageCount = mok;
		} else if(nmg > 0) {
			pageCount = mok + 1;
		}
		
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("pageNo", paramMap.get("pageNo"));
		page.put("pageCount", pageCount);
		page.put("listCount", listCount);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "ok");
		result.put("list", list);
		result.put("page", page);
		result.put("msg", "");
		return result;
	}
}
