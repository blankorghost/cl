package com.daleyzou.service;

import java.util.List;

import com.daleyzou.entity.UserInfo;
import com.daleyzou.utils.PageBean;

public interface IUserInfoService {
	/**
	 * 分页显示所有用户信息
	 */
	void getAll(PageBean<UserInfo> pb);
	
	
	/**
	 * 根据用户名查询用户信息
	 */
	List<UserInfo> getAll(String u_name);
	
	/**
	 * 根据id（主键）查询用户信息
	 */
	UserInfo findById(int u_id);
	
	/**
	 * 更新用户信息
	 */
	void update(UserInfo userInfo);
	
	/**
	 * 删除指定用户
	 */
	void delete(int u_id);
	
	void updateAdministrator(int id, String pwd);
}
