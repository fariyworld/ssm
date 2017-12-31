package com.offcn.mappers;

import com.offcn.common.Mapper;
import com.offcn.entity.QueryVO;
import com.offcn.entity.User;

public interface UserMapper extends Mapper<User> {

	public Integer selectUserByPhoneAndAccount(QueryVO queryVO);
	
	public User findUserByPhoneAndAccount(User user);

	public Integer checkOldPWD(User user);

	public Integer updatePWD(User user);
	
}
