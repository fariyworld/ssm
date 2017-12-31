package com.offcn.mappers;

import java.util.List;

import com.offcn.common.Mapper;
import com.offcn.entity.Idle;

public interface IdleMapper extends Mapper<Idle> {

	List<Idle> selectAllByUID(Integer uid);
	
	List<Idle> selectAllByType(Integer typeid);
	
}
