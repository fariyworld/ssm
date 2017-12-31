package com.offcn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.offcn.entity.Idle;
import com.offcn.mappers.IdleMapper;
import com.offcn.service.IdleService;
import com.offcn.tools.DateUtils;
import com.offcn.tools.UploadFile;

@Service("idleService")
public class IdleServiceImpl implements IdleService {
	
	@Autowired
	private IdleMapper idleMapper;
	
	@Override
	public Integer insert(Idle idle) {
		
		idleMapper.insert(idle);
		
		return idle.getIdleid();
	}

	@Override
	public Idle selectById(Integer id) {
		
		return idleMapper.selectById(id);
	}

	@Override
	public Integer update(Idle t) {
		
		
		
		return null;
	}

	@Override
	public List<Idle> selectAll() {
		
		return idleMapper.selectAll();
	}

	@Override
	public Integer insertIdle(Idle idle, MultipartFile photo) {
		
		if(photo.getSize() > 0 ){
			
			//保存图片
			String filename = UploadFile.saveHP(photo,"idleImg");
			
			idle.setIdleImg(filename);
		}
		
		/*
		 * 1.date  str ---> Date
		 * 2.交易方式    数组  ---> int
		 * 3.user --> 发布者 (只有id，和 userName)
		 * 4.所属类别
		 */
		idle.setPurchasing_date(DateUtils.getDateByDateStr(idle.getDate()));
		
		idle.setTransfer_mode(getTSModeByWays(idle.getWays()));
		
		System.out.println("新插入的闲置信息主键：--->"+ insert(idle));
		
		return insert(idle);
	}
	
	
	
	public Integer getTSModeByWays(Integer[] ways){
		
		if( ways != null){
			
			if ( ways.length == 1 ) return ways[0];
			
			else return 3;
		}else{
			
			return 1;
		}
		
	}

	@Override
	public List<Idle> selectAll(Integer uid) {
		
		return idleMapper.selectAllByUID(uid);
	}

	@Override
	public List<Idle> selectAllByType(Integer typeid) {
		
		return idleMapper.selectAllByType(typeid);
	}

}
