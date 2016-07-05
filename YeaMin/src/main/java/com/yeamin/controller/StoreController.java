package com.yeamin.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yeamin.dao.StoreDao;

@Controller
public class StoreController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private StoreDao storeDao;
	
	public StoreController() {
		
	}
	
}
