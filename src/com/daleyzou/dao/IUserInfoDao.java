package com.daleyzou.dao;

import java.util.List;

import com.daleyzou.entity.UserInfo;
import com.daleyzou.utils.PageBean;

/**
 * 用户信息dao层接口设计
 * @author 11543
 *
 */
public interface IUserInfoDao {
	/**
	 * 分页显示所有用户信息
	 */
	void getAll(PageBean<UserInfo> pb);
	
	/**
	 * 得到总用户信息条数
	 */
	int getTotalCount(PageBean<UserInfo> pb);
	
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
	
	/**
	 * 更改管理员信息
	 * @param id
	 * @param pwd
	 */
	void updateAdministrator(int id, String pwd);
}
