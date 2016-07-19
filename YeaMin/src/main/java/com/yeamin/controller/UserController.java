package com.yeamin.controller;

import java.util.HashMap;
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

import com.yeamin.dao.UserDao;
import com.yeamin.dto.UserDto;

@Controller
public class UserController {

	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private UserDao userDao;
	
	public UserController() {
		
	}
	
	@RequestMapping("/userLoginModal.do")
	public ModelAndView userLoginModal() {
		ModelAndView mav = new ModelAndView("/WEB-INF/jsp/userLoginModal.jsp");
		return mav;
	}
	
	@RequestMapping("/userLogin.do")
	public @ResponseBody Map<String, Object> userLogin(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) {
		String result = "ok";
		String msg = "";
		
		UserDto dto = userDao.selectUser(paramMap);
		
		if(dto == null) {
			result = "error";
			// msg = "존재하지 않는 사용자입니다.";
			msg = "입력하신 아이디/비밀번호를 잘못 입력하였습니다.";
		} else {
			String dtoUserPw = dto.getUser_pw();
			String paramUserPw = (String) paramMap.get("user_pw");
			
			if(!dtoUserPw.equals(paramUserPw)) {
				result = "error";
				// msg = "비밀번호가 일치하지 않습니다.";
				msg = "입력하신 아이디/비밀번호를 잘못 입력하였습니다.";
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("user", dto);
			}
		}
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", result);
		ret.put("msg", msg);
		
		return ret;
	}
	
	@RequestMapping("/userLogout.do")
	public @ResponseBody Map<String, Object> userLogout(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) {
		String result = "ok";
		String msg = "";
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("result", result);
		ret.put("msg", msg);
		
		return ret;
	}
	
}
