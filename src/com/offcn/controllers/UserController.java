package com.offcn.controllers;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.offcn.entity.QueryVO;
import com.offcn.entity.User;
import com.offcn.service.UserService;
import com.offcn.tools.DateUtils;

@Controller
@RequestMapping(value="/User")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/registerUser.action")
	@ResponseBody
	public User registerUser(User user){
		
		Integer uid = userService.insert(user);
		
		user.setUid(uid);
		
		return user;
	}
	
	@RequestMapping(value="/checkUserIsExist.action")
	@ResponseBody
	public QueryVO checkUserIsExist(User user){
		
		System.out.println("手机号：" + user.getPhone());
		
		QueryVO queryVO = new QueryVO();
		
		if (userService.selectUserByPhoneAndAccount(user.getPhone(), user.getAccount()))
			
			queryVO.setAjaxResult("1");
		
		else queryVO.setAjaxResult("0");
			
		return queryVO;
	}
	
	@RequestMapping(value="/login.action")
	@ResponseBody
	public User login(User user,HttpServletRequest request){
		
		User user2 = userService.findUserByPhoneAndAccount(user);
		
		if(user2 == null) return user;
		
		else request.getSession().setAttribute("user", user2);
		
		return user2;
	}
	
	@RequestMapping(value="/checkOldPWD.action")
	@ResponseBody
	public QueryVO checkOldPWD(User user){
		
		return userService.checkOldPWD(user);
	}
	
	
	@RequestMapping(value="/updatePWD.action")
	@ResponseBody
	public QueryVO updatePWD(User user){
		
		return userService.updatePWD(user);
	}
	
	@RequestMapping(value="/selectUserByID.action")
	@ResponseBody
	public User selectUserByID(Integer uid,HttpServletRequest request){
		
		User user = userService.selectById(uid);
		
		Date date = user.getBirthday();
		
		Integer[] dateArr = DateUtils.getArrByDate(date);
		
		user.setDateArr(dateArr);
		
		request.getSession().setAttribute("user", user);
		
		return user;
	}
	
	@RequestMapping(value="/updateUserInfo.action")
	public void updateUserInfo(MultipartFile photo, User user,HttpServletRequest request,HttpServletResponse response){
		
		if ( userService.updateUserInfo(photo,user) ) request.setAttribute("iMsg", "update userinfo success");
		
		else request.setAttribute("iMsg", "update userinfo failed");
		
		try {
			
			request.getRequestDispatcher("/jsp/user/UserPersonCenter.jsp").forward(request, response);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}
