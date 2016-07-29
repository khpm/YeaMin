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
	
	public static Map<String, Object> getSelectListResult(Map<String, Object> paramMap, List<?> list, Integer count) {
		int listCount = count;
		int pageCount = listCount / 10  + 1; // 전체 페이지 개수
		int pageSize = 10; // 한 페이지에 들어갈 개수
		int mok = listCount / pageSize;
		int nmg = listCount % pageSize;
		
		if(nmg == 0) {
			pageCount = mok;
		} else if(nmg > 0) {
			pageCount = mok + 1;
		}
		
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("pageCount", pageCount);
		page.put("listCount", listCount);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "ok");
		result.put("list", list);
		result.put("page", page);
		result.put("msg", "");
		return result;
	}
	
	public final static Map<String, Object> gerResponseRetMap(String result, String msg) {
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", result);
		ret.put("msg", msg);
		
		return ret;
	}
	
	public final static void setPagingInfo(Map<String, Object> paramMap) {
		int pageNo = Integer.parseInt((String)paramMap.get("pageNo"));
		
		int start = (pageNo*10)-9;
		int end = pageNo*10;
		
		paramMap.put("start", start);
		paramMap.put("end", end);
	}
	
}
