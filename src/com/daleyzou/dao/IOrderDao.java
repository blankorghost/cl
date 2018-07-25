package com.daleyzou.dao;

import java.util.List;

import com.daleyzou.entity.Order;
import com.daleyzou.entity.Shop;
import com.daleyzou.utils.PageBean;

/**
 * 订单信息dao接口设计
 * @author 11543
 *
 */
public interface IOrderDao {
	
	/**
	 * 分页显示所有订单信息
	 */
	void getAll(PageBean<Order> pb);
	
	/**
	 * 得到总订单信息条数
	 */
	int getTotalCount(PageBean<Order> pb);
	
	/**
	 * 根据下单人姓名查询订单
	 */
	List<Order> findByU_name(String u_name);
	
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
