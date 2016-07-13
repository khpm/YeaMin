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
	
	@RequestMapping("/reservationCapacityList.do")
	public ModelAndView reservationCapacityList() {
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/reservation/reservationCapacityList.jsp");
		return mav;
	}
	
	@RequestMapping("/reservationCapacityPopup.do")
	public ModelAndView reservationCapacityPopup() {
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/reservation/reservationCapacityPopup.jsp");
		return mav;
	}
	
	@RequestMapping("/selectReservationCapacityList.json")
	public @ResponseBody Map<String, Object> selectReservationCapacityList(@RequestParam Map<String, Object> paramMap) {
		List<ReservationCapacityDto> list = reservationDao.selectReservationCapacityList(paramMap);
		return getSelectListResult(paramMap, list);
	}
	
	@RequestMapping("/selectReservationCapacity.json")
	public void selectReservationCapacity() {
		log.info("requset");
	}
	
	@RequestMapping("/insertReservationCapacity.json")
	public void insertReservationCapacity() {
		log.info("requset");
	}
	
	@RequestMapping("/updateReservationCapacity.json")
	public void updateReservationCapacity() {
		log.info("requset");
	}

	@RequestMapping("/deleteReservationCapacity.json")
	public void deleteReservationCapacity() {
		log.info("requset");
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
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "ok");
		result.put("list", list);
		result.put("page", page);
		result.put("msg", "");
		return result;
	}
	
}
