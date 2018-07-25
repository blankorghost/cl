package com.daleyzou.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daleyzou.entity.Order;
import com.daleyzou.entity.Shop;
import com.daleyzou.entity.UserInfo;
import com.daleyzou.utils.Condition;
import com.daleyzou.utils.PageBean;

public class OrderServlet extends BaseServlet {

	
	public Object orderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.1查询所有的“订单信息”，保存
		PageBean<Order> pb = new PageBean<Order>();
		//条件对象
		Condition condition = new Condition();
		//第一次访问，设置当前页为1
		String curPage = request.getParameter("currentPage");
		//判断
		if (curPage == null || "".equals(curPage.trim())){
			//第一次访问，设置当前页为1
			pb.setCurrentPage(1);
		}else {
			//【设置当前页参数】
			pb.setCurrentPage(Integer.parseInt(curPage));
		}
		//设置条件对象到pageBean中
		pb.setCondition(condition);
		//-----分页查询
		orderService.getAll(pb);
		//保存查询后的pb对象
		request.setAttribute("pb", pb);
		//1.4跳转
		return request.getRequestDispatcher("/admin/daleyzou/orderList.jsp");
	}
	
	public Object search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.得到输入的用户名
			String u_name = request.getParameter("searchOrder");
			if (u_name == null || "".equals(u_name)){
				return request.getRequestDispatcher("/admin/daleyzou/userInfoList.jsp");
			}
			
			//2.得到管理员选择的查询方式
			String findMethod = request.getParameter("mySelected");
			System.out.println(findMethod+":"+u_name);
			if ("searchByOrderName".equals(findMethod)){
				PageBean<Order> pb = new PageBean<Order>();
				pb.setCurrentPage(1);
				Condition condition = new Condition();
				condition.setU_name(u_name);
				pb.setCondition(condition);
				//-----分页查询
				orderService.getAll(pb);
				//保存查询后的pb对象
				request.setAttribute("pb", pb);
			}else if ("searchByOrderId".equals(findMethod)) {
				Order order = orderService.findById(Integer.parseInt(u_name));
				
				List<Order> list = new ArrayList<Order>();
				list.add(order);
				PageBean<Order> pb = new PageBean<Order>();
				if (order != null){
					pb.setPageData(list);
				}else {
					pb.setPageData(null);
				}
				pb.setCurrentPage(1);
				pb.setTotalPage(1);
				
				//保存查询后的pb对象
				request.setAttribute("pb", pb);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return request.getRequestDispatcher("/admin/daleyzou/orderList.jsp");
	}
	
	
	/**
	 * 
	 *后台状态更新
	 */
	public Object deliver(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Order order = new Order();
		int o_id = Integer.parseInt(request.getParameter("o_id"));
		int status = Integer.parseInt(request.getParameter("nowStatus"));
		order.setO_status(status+1);
		order.setO_id(o_id);
		orderService.update(order);
		
		return request.getRequestDispatcher("/order?method=orderList");
	}
	
	
	
	/**
	 * 
	 *前台状态更新
	 */
	public Object deliver1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Order order = new Order();
		int o_id = Integer.parseInt(request.getParameter("o_id"));
		int u_id = Integer.parseInt(request.getParameter("u_id"));
		int status = Integer.parseInt(request.getParameter("nowStatus"));
		order.setO_status(status+1);
		order.setO_id(o_id);
		orderService.update(order);
		
		return request.getRequestDispatcher("/order?method=customOrderDetail&u_id="+u_id);
	}
	
	
	/**
	 * 
	 * 后台删除操作
	 */
	public Object delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取请求id
		String o_id = request.getParameter("o_id");
		//2.调用service更新
		orderService.delete(Integer.parseInt(o_id));
		
		return request.getRequestDispatcher("/order?method=orderList");
	}
	
	/**
	 * 
	 * 前台删除操作
	 */
	public Object delete1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取请求id
		String o_id = request.getParameter("o_id");
		int u_id = Integer.parseInt(request.getParameter("u_id"));
		//2.调用service更新
		orderService.delete(Integer.parseInt(o_id));

		//跳转
		return request.getRequestDispatcher("/order?method=customOrderDetail&u_id="+u_id);
	}
	
	
	public Object orderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取请求id
		String o_id = request.getParameter("o_id");
		//2.调用service更新
		Order order = orderService.findById(Integer.parseInt(o_id));
		
		//通过订单中的商品id查询商品的名称和图片路径
		Shop shop = orderService.getShopInfo(order.getO_shopid());
		
		request.setAttribute("order", order);
		request.setAttribute("shop", shop);
		
		return request.getRequestDispatcher("/admin/daleyzou/orderDetail.jsp");
	}
	
	public Object customOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取请求id
		String u_id = request.getParameter("u_id");
		//2.调用service查找
		List<Order> orderList = orderService.findByU_id(Integer.parseInt(u_id));
		request.setAttribute("orderList", orderList);
		request.setAttribute("userId", u_id);
		return request.getRequestDispatcher("/user/order.jsp");
		
	}
	
	
	public Object dd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return null;
	}



	

}
