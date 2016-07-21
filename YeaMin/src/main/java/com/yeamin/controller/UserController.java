package com.yeamin.controller;

import java.util.List;
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

import com.yeamin.constants.AppConstants;
import com.yeamin.dao.UserDao;
import com.yeamin.dto.UserDto;
import com.yeamin.util.YmUtil;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

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
	
	@RequestMapping("/userContents.do")
	public ModelAndView userContents() {
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/user/userContents.jsp");
		return mav;
	}
	
	@RequestMapping("/userModal.do")
	public ModelAndView userModal(@RequestParam Map<String, Object> paramMap) {
//		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
//		mav.addObject("contentViewName", "/WEB-INF/jsp/user/userModal.jsp");
		ModelAndView mav = new ModelAndView("/WEB-INF/jsp/user/userModal.jsp");
		mav.addObject("modalType", paramMap.get("modalType"));
		if(AppConstants.MODAL_TYPE_UPDATE.equals(paramMap.get("modalType"))) {
			UserDto dto = userDao.selectUser(paramMap);
			mav.addObject("dto", dto);
		}
		return mav;
	}
	
	@RequestMapping("/selectUserList.json")
	public @ResponseBody Map<String, Object> selectUserList(@RequestParam Map<String, Object> paramMap) {
		String result = "";
		String msg = "";
		
		List<UserDto> list = userDao.selectUserList(paramMap);
		
		result = "ok";
		
		return YmUtil.gerResponseRetMap(result, msg, paramMap, list);
	}
	
	@RequestMapping("/insertUser.json")
	public @ResponseBody Map<String, Object> insertUser(@RequestParam Map<String, Object> paramMap) {
		String result = "ok";
		String msg = "";
		
		Integer sqlResult = userDao.insertUser(paramMap);
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
	//회원정보 수정 화면
	@RequestMapping("/userUpdateContents.do")
	public ModelAndView userUpdateContents() {
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/mypage/userUpdateContents.jsp");
		return mav;
	}
	
	@RequestMapping("/updateUser.json")
	public @ResponseBody Map<String, Object> updateUser(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) {
		String result = "";
		String msg = "";
		
		Integer sqlResult = userDao.updateUser(paramMap);
		if(sqlResult != 0){
			result = "ok";
			msg="수정 성공";
			UserDto dto = userDao.selectUser(paramMap);
			HttpSession session = request.getSession();
			session.setAttribute("user", dto);
		}else{
			result = "error";
			msg="수정 실패";
		}
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	@RequestMapping("/userDeleteContents.do")
	public ModelAndView userDeleteContents() {
		ModelAndView mav = new ModelAndView(AppConstants.TEMPLATE_VIEW_PATH);
		mav.addObject("contentViewName", "/WEB-INF/jsp/mypage/userDeleteContents.jsp");
		return mav;
	}	
	@RequestMapping("/deleteUser.json")
	public @ResponseBody Map<String, Object> deleteUser(@RequestParam Map<String, Object> paramMap,  HttpServletRequest request) {
		String result = "";
		String msg = "";
		
		Integer sqlResult = userDao.deleteUser(paramMap);
		if(sqlResult != 0){
			HttpSession session = request.getSession();
			session.removeAttribute("user");
			result = "ok";
			msg = "삭제 성공";
		}else{
			result = "error";
			msg = "삭제 실패";			
		}
		
		return YmUtil.gerResponseRetMap(result, msg);
	}
	
}
