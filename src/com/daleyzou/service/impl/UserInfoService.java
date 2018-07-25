package com.daleyzou.service.impl;

import java.util.List;

import com.daleyzou.dao.IUserInfoDao;
import com.daleyzou.entity.UserInfo;
import com.daleyzou.factory.BeanFactory;
import com.daleyzou.service.IUserInfoService;
import com.daleyzou.utils.PageBean;

public class UserInfoService implements IUserInfoService {
	//通过工厂创建dao
	private IUserInfoDao userInfoDao = BeanFactory.getInstance("userInfoDao", IUserInfoDao.class);
	
	@Override
	public void getAll(PageBean<UserInfo> pb) {
		try {
			userInfoDao.getAll(pb);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public List<UserInfo> getAll(String u_name) {
		try {
			return userInfoDao.getAll(u_name);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public UserInfo findById(int u_id) {
		try {
			return userInfoDao.findById(u_id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void update(UserInfo userInfo) {
		try {
			userInfoDao.update(userInfo);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public void delete(int u_id) {
		try {
			userInfoDao.delete(u_id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public void updateAdministrator(int id, String pwd) {
		try {
			userInfoDao.updateAdministrator(id, pwd);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
