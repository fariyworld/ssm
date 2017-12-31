package com.offcn.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.offcn.common.BaseService;
import com.offcn.entity.Idle;
import com.offcn.mappers.IdleMapper;

public interface IdleService extends BaseService<Idle, IdleMapper> {

	public Integer insertIdle(Idle idle, MultipartFile photo);

	public List<Idle> selectAll(Integer uid);
	
	List<Idle> selectAllByType(Integer typeid);
	
}
