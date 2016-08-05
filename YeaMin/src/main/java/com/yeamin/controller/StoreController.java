package com.yeamin.controller;

import java.util.HashMap;
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

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.StoreDao;
import com.yeamin.dto.StoreDto;
import com.yeamin.dto.StoreImgDto;
import com.yeamin.util.YmUtil;

@Controller
public class StoreController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private StoreDao storeDao;
	
	public StoreController() {
		
	}
	
	@RequestMapping("/storeContents.do")
	public ModelAndView storeContents(){
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/store/storeContents.jsp");
		StoreDto dto = storeDao.selectStore();
		if(dto == null){
			
		}else{
			mav.addObject("dto", dto);
		}
		
		return mav;
	}
	
	@RequestMapping("/selectStore.json")
	public @ResponseBody Map<String, Object> selectStore(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		StoreDto dto = storeDao.selectStore();
		
		if(dto != null) {
			result = "ok";
		} else {
			result = "error";
		}
		
		return YmUtil.gerResponseRetMap(result, msg, dto);
	}
	
	@RequestMapping("/insertStore.json")
	public @ResponseBody Map<String, Object> insertStore(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = storeDao.insertStore(paramMap);
		Map<String, Object> ret = new HashMap<String, Object>();
		if(sqlResult!=0){
			System.out.println("등록 성공");
			ret.put("result", "ok");
		}else{
			System.out.println("등록 실패");
			ret.put("result", "error");
		}
		return ret;
	}
	
	@RequestMapping("/updateStore.json")
	public @ResponseBody Map<String, Object> updateStore(@RequestParam Map<String, Object> paramMap) {
		storeDao.deleteStoreImg();
		Integer sqlResult = storeDao.updateStore(paramMap);
		if(sqlResult!=0){
			System.out.println("수정 성공");
		}else{
			System.out.println("수정 실패");
		}
		Map<String, Object> ret = new HashMap<String, Object>();

		ret.put("result", "ok");
		
		return ret;
	}
	
	@RequestMapping("/insertStoreImg.json")
	public @ResponseBody Map<String, Object> insertStoreImg(@RequestParam Map<String, Object> paramMap) {
		Integer sqlResult = storeDao.insertStoreImg(paramMap);
		if(sqlResult!=0){
			System.out.println("등록 성공");
		}else{
			System.out.println("등록 실패");
		}
		Map<String, Object> ret = new HashMap<String, Object>();

		ret.put("result", "ok");
		
		return ret;
	}
	
	@RequestMapping("/selectStoreImg.json")
	public @ResponseBody Map<String, Object> selectStoreImg(@RequestParam Map<String, Object> paramMap) {
		List<StoreImgDto> listDto = storeDao.selectStoreImg(paramMap);
		if(listDto!=null){
			System.out.println("조회 성공");
		}else{
			System.out.println("조회 실패");
		}
		Map<String, Object> ret = new HashMap<String, Object>();

		ret.put("result", "ok");
		ret.put("listDto", listDto);
		
		return ret;
	}	
	
}
