package com.offcn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offcn.entity.Idletype;
import com.offcn.mappers.IdleTypeMapper;
import com.offcn.service.IdleTypeService;

@Service("idleTypeService")
public class IdleTypeServiceImpl implements IdleTypeService {
	
	@Autowired
	private IdleTypeMapper idleTypeMapper;

	@Override
	public Integer insert(Idletype t) {
		
		
		
		return null;
	}

	@Override
	public Idletype selectById(Integer id) {
		
		
		
		return null;
	}

	@Override
	public Integer update(Idletype t) {
		
		
		
		return null;
	}

	@Override
	public List<Idletype> selectAll() {
		
		return idleTypeMapper.selectAll();
	}

}
