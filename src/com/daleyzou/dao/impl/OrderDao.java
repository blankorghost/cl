package com.daleyzou.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.daleyzou.dao.IOrderDao;
import com.daleyzou.entity.Order;
import com.daleyzou.entity.Shop;
import com.daleyzou.utils.Condition;
import com.daleyzou.utils.JdbcUtils;
import com.daleyzou.utils.PageBean;

public class OrderDao implements IOrderDao {

	@Override
	public void getAll(PageBean<Order> pb) {
		
		//获取条件对象
		Condition condition = pb.getCondition();
		//条件之下单人姓名
		String userName = condition.getU_name();
		StringBuffer sb = new StringBuffer();
		sb.append(" select");
		sb.append("      o.`o_id`,");
		sb.append("      u.`u_name`,");
		sb.append("      o.`o_shopid`,");
		sb.append("      o.`o_shopprice`,");
		sb.append("      o.`o_nums`,");
		sb.append("      o.`o_time`,");
		sb.append("      o.`o_name`,");
		sb.append("      o.`o_adress`,");
		sb.append("      o.`o_phone`,");
		sb.append("      o.`o_youbian`,");
		sb.append("      o.`o_memo`,");
		sb.append("      o.`o_status`");
		sb.append("  FROM");
		sb.append("      t_order o,");
		sb.append("      t_users u");
		sb.append(" WHERE");
		sb.append("      1=1");
		sb.append("  AND");
		sb.append("      o.`o_userid`=u.`u_id`");
		
		List<Object> list = new ArrayList<Object>();//存储查询条件对应的值
		/************拼接查询条件******************/
		
		//菜品名称条件
		if (userName != null && !"".equals(userName.trim())){
			sb.append("  AND u.`u_name` LIKE ?");
			userName = "%"+userName+"%";
			list.add(userName);	//组装条件值
		}
		/**************分页条件*************************/
		sb.append(" LIMIT ?,?");
		/**判断：当前页<1，设置当前页为1；当前页>总页数，设置当前页为总页数**/
		//先查询总记录数
		int totalCount = getTotalCount(pb);       //******totalCount=0的话就没有必要进行下去了*******
		pb.setTotalCount(totalCount);
		if (pb.getCurrentPage() < 1){
			pb.setCurrentPage(1);
		}else if (pb.getCurrentPage() > pb.getTotalPage()) {
			pb.setCurrentPage(pb.getTotalPage());
		}
		int index = (pb.getCurrentPage() - 1) * pb.getPageCount();
		int count = pb.getPageCount();
		list.add(index);	   	//组装条件值--起始行
		list.add(count);       	//组装条件值--查询返回的行
		
		try {
			List<Order> pageData = JdbcUtils.getQueryRunner().query(sb.toString(),
					new BeanListHandler<Order>(Order.class), list.toArray());
			//把查到的数据设置到分页对象中
			pb.setPageData(pageData);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}


	}

	@Override
	public int getTotalCount(PageBean<Order> pb) {
		//获取条件对象
		Condition condition = pb.getCondition();
		//条件之下单人姓名
		String userName = condition.getU_name();
		StringBuffer sb = new StringBuffer();
		sb.append(" select");
		sb.append("      count(*)");
		sb.append("  FROM");
		sb.append("      t_order o,");
		sb.append("      t_users u");
		sb.append(" WHERE");
		sb.append("      1=1");
		sb.append("  AND");
		sb.append("      o.`o_userid`=u.`u_id`");
		
		List<Object> list = new ArrayList<Object>();//存储查询条件对应的值
		/************拼接查询条件******************/
		
		//菜品名称条件
		if (userName != null && !"".equals(userName.trim())){
			sb.append("  AND u.`u_name` LIKE ?");
			userName = "%"+userName+"%";
			list.add(userName);	//组装条件值
		}
				
		try {
			Long num = JdbcUtils.getQueryRunner().query(sb.toString(), new ScalarHandler<Long>(), list.toArray());
			return num.intValue();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	@Override
	public List<Order> findByU_name(String u_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order findById(int o_id) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select");
		sb.append("      o.`o_id`,");
		sb.append("      u.`u_name`,");
		sb.append("      o.`o_shopid`,");
		sb.append("      o.`o_shopprice`,");
		sb.append("      o.`o_nums`,");
		sb.append("      o.`o_time`,");
		sb.append("      o.`o_name`,");
		sb.append("      o.`o_adress`,");
		sb.append("      o.`o_phone`,");
		sb.append("      o.`o_youbian`,");
		sb.append("      o.`o_memo`,");
		sb.append("      o.`o_status`");
		sb.append("  FROM");
		sb.append("      t_order o,");
		sb.append("      t_users u");
		sb.append(" WHERE");
		sb.append("      1=1");
		sb.append("  AND");
		sb.append("      o.`o_userid`=u.`u_id`");
		sb.append("	 AND");
		sb.append("		 o.`o_id`=?");
		try {
			return JdbcUtils.getQueryRunner().query(sb.toString(), new BeanHandler<Order>(Order.class), o_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void update(Order order) {
		String sql = "UPDATE t_order SET o_status=? WHERE o_id=?;";
		try {
			JdbcUtils.getQueryRunner().update(sql, order.getO_status(), order.getO_id());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	@Override
	public void delete(int o_id) {
		String sql = "DELETE FROM t_order WHERE o_id=?;";
		try {
			JdbcUtils.getQueryRunner().update(sql, o_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	@Override
	public Shop getShopInfo(int o_shopid) {
		String sql = "select t_shopinfos.`si_name`,t_shopinfos.`si_photo` from t_shopinfos where si_id=?;";
		try {
			return JdbcUtils.getQueryRunner().query(sql, new BeanHandler<Shop>(Shop.class), o_shopid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<Order> findByU_id(int u_id) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select");
		sb.append("      o.`o_id`,");
		sb.append("      u.`u_name`,");
		sb.append("      o.`o_shopid`,");
		sb.append("      o.`o_shopprice`,");
		sb.append("      o.`o_nums`,");
		sb.append("      o.`o_time`,");
		sb.append("      o.`o_name`,");
		sb.append("      o.`o_adress`,");
		sb.append("      o.`o_phone`,");
		sb.append("      o.`o_youbian`,");
		sb.append("      o.`o_memo`,");
		sb.append("      o.`o_status`,");
		sb.append("      info.`si_name`,");
		sb.append("      info.`si_photo`");
		sb.append("  FROM");
		sb.append("      t_order o,");
		sb.append("      t_users u,");
		sb.append("      t_shopinfos info");
		sb.append(" WHERE");
		sb.append("      1=1");
		sb.append("  AND");
		sb.append("      o.`o_userid`=u.`u_id`");
		sb.append("	 AND");
		sb.append("		 o.`o_userid`=?");
		sb.append("	 AND");
		sb.append("		 info.`si_id`=o.`o_shopid`");
		try {
			return JdbcUtils.getQueryRunner().query(sb.toString(), new BeanListHandler<Order>(Order.class), u_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	

}
