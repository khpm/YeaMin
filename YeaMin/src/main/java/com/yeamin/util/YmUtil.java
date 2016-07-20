package com.yeamin.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class YmUtil {

	private YmUtil() {
		
	}
	
	public final static Map<String, Object> gerResponseRetMap(String result, String msg, Map<String, Object> paramMap, List<?> list) {
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
		ret.put("result", result);
		ret.put("list", list);
		ret.put("page", page);
		ret.put("msg", msg);
		
		return ret;
	}
	
	public final static Map<String, Object> gerResponseRetMap(String result, String msg) {
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", result);
		ret.put("msg", msg);
		
		return ret;
	}
	
}
