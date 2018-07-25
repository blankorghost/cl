package com.daleyzou.service;

import java.util.List;

import com.daleyzou.entity.Order;
import com.daleyzou.entity.Shop;
import com.daleyzou.utils.PageBean;

/*
 * 订单service接口设计
 */
public interface IOrderService {

	/**
	 * 分页显示所有订单信息
	 */
	void getAll(PageBean<Order> pb);
	
	
	
	/**
	 * 根据用户id查询订单
	 */
	List<Order> findByU_id(int u_id);
	
	/**
	 * 根据订单id（主键）查询订单信息
	 */
	Order findById(int o_id);
	
	/**
	 * 根据id（主键）更新订单状态
	 */
	void update(Order order);
	
	/**
	 * 根据订单号删除指定订单
	 */
	void delete(int o_id);
	
	/**
	 * 根据商品id查询商品的名称和图片路径
	 */
	Shop getShopInfo(int o_shopid);
}
