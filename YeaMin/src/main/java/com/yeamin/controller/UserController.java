package com.yeamin.controller;

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
import com.yeamin.util.YmUtil;

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
	
	@RequestMapping("/userInsertModal.do")
	public ModelAndView userInsertModal() {
		ModelAndView mav = new ModelAndView("/WEB-INF/jsp/userInsertModal.jsp");
		return mav;
	}
	
	@RequestMapping("/userLogin.json")
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
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
	@RequestMapping("/userInsert.json")
	public @ResponseBody Map<String, Object> userInsert(@RequestParam Map<String, Object> paramMap) {
		String result = "ok";
		String msg = "";
		
		Integer sqlResult = userDao.insertUser(paramMap);
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
	@RequestMapping("/userLogout.json")
	public @ResponseBody Map<String, Object> userLogout(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) {
		String result = "";
		String msg = "";
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		result = "ok";
				
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
	@RequestMapping("/userIdDuplicationCheck.json")
	public @ResponseBody Map<String, Object> userIdDuplicationCheck(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		UserDto dto = userDao.selectUser(paramMap);
		
		if(dto == null) {
			result = "ok";
			msg = "사용 가능한 아이디입니다.";
		} else {
			result = "error";
			msg = "중복된 아이디입니다.";
		}
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
}
