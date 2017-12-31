package com.offcn.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offcn.entity.Idletype;
import com.offcn.service.IdleTypeService;

@Controller
@RequestMapping(value="/IdleType")
public class IdleTypeController {

	
	@Autowired
	private IdleTypeService idleTypeService;
	
	@RequestMapping(value="/selectIdleTypeAll.action")
	@ResponseBody
	public List<Idletype> selectIdleTypeAll(HttpServletRequest request){
		
		return idleTypeService.selectAll();
	}
}
