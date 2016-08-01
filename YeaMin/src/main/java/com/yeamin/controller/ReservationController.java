package com.yeamin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yeamin.constants.AppConstants;
import com.yeamin.dao.ReservationDao;
import com.yeamin.dao.StatsDao;
import com.yeamin.dto.ReservationCapacityDto;
import com.yeamin.util.YmUtil;

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
		String result = "";
		String msg = "";
		
		List<ReservationCapacityDto> list = reservationDao.selectReservationCapacityList(paramMap);
		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg, paramMap, list);
	}
	
	@RequestMapping("/insertReservationCapacity.json")
	public @ResponseBody Map<String, Object> insertReservationCapacity(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		Integer sqlResult = reservationDao.insertReservationCapacity(paramMap);
		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
	@RequestMapping("/updateReservationCapacity.json")
	public @ResponseBody Map<String, Object> updateReservationCapacity(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		Integer sqlResult = reservationDao.updateReservationCapacity(paramMap);
		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg);
	}

	@RequestMapping("/deleteReservationCapacity.json")
	public @ResponseBody Map<String, Object> deleteReservationCapacity(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		Integer sqlResult = reservationDao.deleteReservationCapacity(paramMap);
		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
	@RequestMapping("/reservationTogetherContents.do")
	public ModelAndView reservationTogetherContents() {
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/reservation/reservationTogetherContents.jsp");
		return mav;
	}
	
	@RequestMapping("/reservationStatsContents.do")
	public ModelAndView reservationStatsContents() {
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/reservation/reservationStatsContents.jsp");
		return mav;
	}
	
	@RequestMapping("/selectReviewCnt.json")
	public @ResponseBody Map<String, Object> selectReviewCnt(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		List<Map<String, Object>> list = statsDao.selectReviewCnt(paramMap);
		
		System.out.println(paramMap.get("user_gender"));
		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg, paramMap, list);
	}
	
	@RequestMapping("/selectProductTop5.json")
	public @ResponseBody Map<String, Object> selectProductTop5(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		List<Map<String, Object>> list = statsDao.selectProductTop5(paramMap);		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg, paramMap, list);
	}
	
	@RequestMapping("/reservationModal.do")
	public ModelAndView reservationModal(@RequestParam Map<String, Object> paramMap) {
		ModelAndView mav = new ModelAndView("/WEB-INF/jsp/reservation/reservationModal.jsp");
		mav.addObject("modalType", paramMap.get("modalType"));
		if(AppConstants.MODAL_TYPE_UPDATE.equals(paramMap.get("modalType"))) {
			ReservationCapacityDto dto = reservationDao.selectReservationCapacity(paramMap);
			mav.addObject("dto", dto);
		}
		return mav;
	}
	
	@RequestMapping("/insertReservation.json")
	public @ResponseBody Map<String, Object> insertReservation(@RequestParam Map<String, Object> paramMap) throws JsonParseException, JsonMappingException, IOException {
		String result = "";
		String msg = "";
		
		Integer reservation_no = reservationDao.selectReservationNoSeq();
		
		paramMap.put("reservation_no", reservation_no);
		Integer sqlResult = reservationDao.insertReservation(paramMap);
		
		
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> productList = mapper.readValue((String) paramMap.get("productList"), new TypeReference<List<Map<String, Object>>>(){});
		
		for (Map<String, Object> product : productList) {
			if(product.containsKey("product_cnt") && !((String)product.get("product_cnt")).equals("")) {
				Integer product_cnt = Integer.parseInt((String) product.get("product_cnt"));
				
				if(product_cnt > 0) {
					product.put("reservation_no", reservation_no);
					reservationDao.insertReservationProduct(product);
				}
			}
		}
		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
	@RequestMapping("/updateReservation.json")
	public @ResponseBody Map<String, Object> updateReservation(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		Integer sqlResult = reservationDao.updateReservation(paramMap);
		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg);
	}

	@RequestMapping("/deleteReservation.json")
	public @ResponseBody Map<String, Object> deleteReservation(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		Integer sqlResult = reservationDao.deleteReservation(paramMap);
		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
}
