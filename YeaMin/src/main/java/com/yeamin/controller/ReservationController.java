package com.yeamin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.ReservationDao;
import com.yeamin.dao.StatsDao;
import com.yeamin.dto.ReservationCapacityDto;

@Controller
public class ReservationController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private StatsDao statsDao;
	
	public ReservationController() {
		
	}
	
	@RequestMapping("/reservationCapacityContents.do")
	public ModelAndView reservationCapacityContents() {
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/reservation/reservationCapacityContents.jsp");
		return mav;
	}
	
	@RequestMapping("/reservationCapacityModal.do")
	public ModelAndView reservationCapacityModal(@RequestParam Map<String, Object> paramMap) {
//		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
//		mav.addObject("contentViewName", "/WEB-INF/jsp/reservation/reservationCapacityModal.jsp");
		ModelAndView mav = new ModelAndView("/WEB-INF/jsp/reservation/reservationCapacityModal.jsp");
		mav.addObject("modalType", paramMap.get("modalType"));
		if(AppConstants.MODAL_TYPE_UPDATE.equals(paramMap.get("modalType"))) {
			ReservationCapacityDto dto = reservationDao.selectReservationCapacity(paramMap);
			mav.addObject("dto", dto);
		}
		return mav;
	}
	
	@RequestMapping("/selectReservationCapacityList.json")
	public @ResponseBody Map<String, Object> selectReservationCapacityList(@RequestParam Map<String, Object> paramMap) {
		List<ReservationCapacityDto> list = reservationDao.selectReservationCapacityList(paramMap);
		return getSelectListResult(paramMap, list);
	}
	
	@RequestMapping("/insertReservationCapacity.json")
	public @ResponseBody Map<String, Object> insertReservationCapacity(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = reservationDao.insertReservationCapacity(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		ret.put("msg", "정한영 바보");
		
		return ret;
	}
	
	@RequestMapping("/updateReservationCapacity.json")
	public @ResponseBody Map<String, Object> updateReservationCapacity(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = reservationDao.updateReservationCapacity(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		ret.put("msg", "한영아 힘드니? 어려운거 있으면 편하게 말해 ㅋ");
		
		return ret;
	}

	@RequestMapping("/deleteReservationCapacity.json")
	public @ResponseBody Map<String, Object> deleteReservationCapacity(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = reservationDao.deleteReservationCapacity(paramMap);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		ret.put("msg", "음... 뭐라고 쓰지? 내일 보자 ㅋ");
		
		return ret;
	}
	
	public Map<String, Object> getSelectListResult(Map<String, Object> paramMap, List<?> list) {
		int listCount = list.size();
		int pageCount = 0; // 전체 페이지 개수
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
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", "ok");
		ret.put("list", list);
		ret.put("page", page);
		ret.put("msg", "");
		return ret;
	}
	
}
