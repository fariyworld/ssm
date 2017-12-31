package com.offcn.service;

import org.springframework.web.multipart.MultipartFile;

import com.offcn.common.BaseService;
import com.offcn.entity.QueryVO;
import com.offcn.entity.User;
import com.offcn.mappers.UserMapper;

public interface UserService extends BaseService<User, UserMapper> {
	
	
	public boolean selectUserByPhoneAndAccount(String phone, String account);
	public User findUserByPhoneAndAccount(User user);
	public QueryVO checkOldPWD(User user);
	public QueryVO updatePWD(User user);
	public boolean updateUserInfo(MultipartFile photo, User user);
}
