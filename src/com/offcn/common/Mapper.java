package com.offcn.common;

import java.util.List;

public interface Mapper<T> {
	
	/**
	 * 
	 * @todo: 插入数据 
	 * @param t
	 * @return Integer
	 */
	Integer insert(T t);
	
	/**
	 * 
	 * @todo:根据id查询对象
	 * @param id
	 * @return T
	 */
	T selectById(Integer id);
	
	/**
	 * 
	 * @todo: 更新 
	 * @param t
	 * @return Integer
	 */
	Integer update(T t);
	
	/**
	 * 
	 * @todo: 查询全部 
	 * @return List<T>
	 */
	List<T> selectAll();
}
