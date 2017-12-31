package com.offcn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.offcn.entity.QueryVO;
import com.offcn.entity.User;
import com.offcn.mappers.UserMapper;
import com.offcn.service.UserService;
import com.offcn.tools.DateUtils;
import com.offcn.tools.UploadFile;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public Integer insert(User user) {
		
		user.setBirthday(DateUtils.getTimestampByCurDate());
		
		userMapper.insert(user);
				
		return user.getUid();
	}

	@Override
	public User selectById(Integer uid) {
		
		return userMapper.selectById(uid);
	}

	@Override
	public boolean selectUserByPhoneAndAccount(String phone, String account) {
		
		Integer uid = userMapper.selectUserByPhoneAndAccount(trObj(phone, account));
		
		System.out.println("查询出来的用户id："+uid);
		
		if (  uid != null ) return false;
		
		else return true;
	}
	
	@Override
	public User findUserByPhoneAndAccount(User user) {
		
		return userMapper.findUserByPhoneAndAccount(user);
	}

	@Override
	public QueryVO checkOldPWD(User user) {
		
		QueryVO queryVO = new QueryVO();
		
		if (userMapper.checkOldPWD(user) == null) queryVO.setAjaxResult("0");
		
		else queryVO.setAjaxResult("1");
		
		return queryVO;
	}
	
	@Override
	public QueryVO updatePWD(User user) {
		
		QueryVO queryVO = new QueryVO();
		
		if (userMapper.updatePWD(user) == null) queryVO.setAjaxResult("update pwd faild");
		
		else queryVO.setAjaxResult("update pwd success");
		
		return queryVO;
	}
	
	@Override
	public boolean updateUserInfo(MultipartFile photo, User user) {
		
		if(photo.getSize() > 0 ){
			
			//保存头像
			String filename = UploadFile.saveHP(photo,"hp");
			
			user.setHeadphoto(filename);
		}

		//update user info
		/*
		 * 1.dataStr--->timestamp
		 */
		user.setBirthday(DateUtils.getTimestampByDateStr(user.getDateStr()));
		
		if ( update(user) > 0 ) return true;
		
		else return false;
	}
	
	@Override
	public Integer update(User user) {
		
		return userMapper.update(user);
	}
	
	@Override
	public List<User> selectAll() {
		
		
		
		return null;
	}
/*********************************************************************************/
	
	public QueryVO trObj(String phone, String account){
		
		QueryVO queryVO = new QueryVO();
		
		queryVO.setPhone(phone);
		queryVO.setAccount(account);
		
		return queryVO;
	}

}
