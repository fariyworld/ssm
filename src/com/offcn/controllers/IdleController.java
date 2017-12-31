package com.offcn.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.offcn.entity.Idle;
import com.offcn.service.IdleService;


@Controller
@RequestMapping(value="/Idle")
public class IdleController {
	
	@Autowired
	private IdleService idleService;
	
	
	@RequestMapping(value="/publishIdleInfo.action")
	public void publishIdleInfo(Idle idle,MultipartFile photo,HttpServletRequest request,HttpServletResponse response){
		
		Integer idleid = idleService.insertIdle(idle, photo);
		
		if( idleid == null ) request.setAttribute("iMsg", "insert idle failed");
		
		else {
			
			request.setAttribute("iMsg", "insert idle success");
			
			request.getSession().setAttribute("idleid", idleid);
		}
		
		try{
			
			request.getRequestDispatcher("/jsp/user/showIdleInfo.jsp").forward(request, response);
			
		}catch (Exception ex){
			
			System.out.println(ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="/selectIdleAllByUID.action")
	@ResponseBody
	public List<Idle> selectIdleAll(Integer uid,HttpServletRequest request){
		
		List<Idle> idleLists = idleService.selectAll(uid);
		
		request.getSession().setAttribute("idleLists", idleLists);
		
		return idleLists;
	}
	
	@RequestMapping(value="/selectIdleAll.action")
	@ResponseBody
	public List<Idle> selectIdleAll(HttpServletRequest request){
		
		List<Idle> idleLists = idleService.selectAll();
		
		request.getSession().setAttribute("idleLists", idleLists);
		
		return idleLists;
	}
	
	@RequestMapping(value="/selectAllByType.action")
	@ResponseBody
	public List<Idle> selectAllByType(Integer typeid,HttpServletRequest request){
		
		List<Idle> idleLists = idleService.selectAllByType(typeid);
		
		request.getSession().setAttribute("idleLists", idleLists);
		
		return idleLists;
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/selectByID.action")
	@ResponseBody
	public List<Idle> selectByID(Integer id,HttpServletRequest request){
		
		List<Idle> idleLists = new ArrayList<Idle>();
		
		Idle idle = idleService.selectById(id);
		
		if( request.getSession().getAttribute("caridleLists") != null ){
			
			idleLists = (List<Idle>) request.getSession().getAttribute("caridleLists");
		}
		
		idleLists.add(idle);
		
		request.getSession().setAttribute("caridleLists", idleLists);
		
		return idleLists;
	}
	
}
