package com.daleyzou.service.impl;

import java.util.List;

import com.daleyzou.dao.IOrderDao;
import com.daleyzou.dao.IUserInfoDao;
import com.daleyzou.entity.Order;
import com.daleyzou.entity.Shop;
import com.daleyzou.factory.BeanFactory;
import com.daleyzou.service.IOrderService;
import com.daleyzou.utils.PageBean;

public class OrderService implements IOrderService {

	//通过工厂创建dao
	private IOrderDao orderDao = BeanFactory.getInstance("orderDao", IOrderDao.class);
		
	@Override
	public void getAll(PageBean<Order> pb) {
		try {
			orderDao.getAll(pb);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<Order> findByU_id(int u_id) {
		try {
			return orderDao.findByU_id(u_id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Order findById(int o_id) {
		try {
			return orderDao.findById(o_id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void update(Order order) {
		try {
			orderDao.update(order);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void delete(int o_id) {
		try {
			orderDao.delete(o_id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Shop getShopInfo(int o_shopid) {
		try {
			return orderDao.getShopInfo(o_shopid);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
