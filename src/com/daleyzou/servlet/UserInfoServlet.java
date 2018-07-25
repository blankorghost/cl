package com.daleyzou.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daleyzou.entity.UserInfo;
import com.daleyzou.utils.PageBean;

import users.adminEntity;
import users.userEntity;

public class UserInfoServlet extends BaseServlet {

	/**
	 * 显示用户详细信息列表
	 */
	public Object userInfoList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.1查询所有的“用户信息”，保存
		PageBean<UserInfo> pb = new PageBean<UserInfo>();
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
		pb.setPageCount(12);
		//-----分页查询
		userInfoService.getAll(pb);
		//保存查询后的pb对象
		request.setAttribute("pb", pb);
		//1.4跳转
		return request.getRequestDispatcher("/admin/daleyzou/userInfoList.jsp");
		
	}
	
	
	
	public Object delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.得到要删除的u_id
		int u_id = Integer.parseInt(request.getParameter("u_id"));
		
		//2.调用service执行删除
		userInfoService.delete(u_id);
		
		return request.getRequestDispatcher("/userInfo?method=userInfoList");
		
	}
	
	
	public Object search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入search方法！！！");
		try {
			//1.得到输入的用户名
			String name = request.getParameter("searchUser");
			if (name == null || "".equals(name)){
				return request.getRequestDispatcher("/admin/daleyzou/userInfoList.jsp");
			}
			//2.调用service执行查找
			List<UserInfo> list = userInfoService.getAll(name);
			PageBean<UserInfo> pb = new PageBean<UserInfo>();
			pb.setPageData(list);
			pb.setCurrentPage(1);
			pb.setTotalPage(1);
			
			//保存查询后的pb对象
			request.setAttribute("pb", pb);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return request.getRequestDispatcher("/admin/daleyzou/userInfoList.jsp");
	}
	
	/**
	 * 
	 * 显示用户收货地址
	 */
	public Object userInfoDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.得到要显示详细信息的u_id
		int u_id = Integer.parseInt(request.getParameter("u_id"));
		
		//2.调用service执行查询
		UserInfo userInfo = userInfoService.findById(u_id);
		//3.保存查询到的信息
		request.setAttribute("userInfo", userInfo);
		//跳转
		return request.getRequestDispatcher("/admin/daleyzou/address.jsp");
		
	}
	
	/**
	 * 
	 * 前台用户查看自己的详细信息
	 */
	public Object customDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.得到要显示详细信息的u_id（当前用户ID）
		//String str = request.getParameter("u_id");
	
		HttpSession session = request.getSession(false);
		userEntity user = (userEntity)session.getAttribute("user");
		int u_id = user.getU_id();
		System.out.println("u_id___:"+u_id);
		
		//2.调用service执行查询
		UserInfo loginUserInfo = userInfoService.findById(u_id);
		//3.保存查询到的信息
		//HttpSession session = request.getSession();
		session.setAttribute("loginUserInfo", loginUserInfo);
		System.out.println("u_id:"+loginUserInfo.getU_id());
		//跳转
		return request.getRequestDispatcher("/user/info.jsp");
		
	}
	
	/**
	 * 
	 * 前台用户更改自己的详细信息
	 */
	public Object update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.得到要更改详细信息的u_id（当前用户ID）
		int u_id = Integer.parseInt(request.getParameter("u_id"));
		String u_password = request.getParameter("password");
		HttpSession session = request.getSession(false);
		UserInfo userInfo = (UserInfo)session.getAttribute("loginUserInfo");
		String oldPassword = userInfo.getU_password();	
		//判断密码输入是否正确
		if (!u_password.equals(oldPassword)){
			request.setAttribute("message", "密码错误！");
			return request.getRequestDispatcher("/user/change.jsp");
		}
		//得到用户输入并封装		
		String ui_email = request.getParameter("email");	
		String ui_address = request.getParameter("adress");	
		String ui_phone = request.getParameter("phone");	
		String u_newpassword = request.getParameter("newpassword");  
		UserInfo newUserInfo = new UserInfo();
		newUserInfo.setU_id(u_id);
		newUserInfo.setUi_email(ui_email);
		newUserInfo.setUi_address(ui_address);
		newUserInfo.setUi_phone(ui_phone);
		newUserInfo.setU_password(u_newpassword);
		
		//.调用service执行更新
		userInfoService.update(newUserInfo);
		//System.out.println("确定就更新了哦！");
		//跳转
		return request.getRequestDispatcher("/user/info.jsp");
		
	}
	
	/**
	 * 更改管理员信息
	 */
	public Object administrator(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//1.得到要更改的密码
		String pwd1 = request.getParameter("psw1");
		String pwd2 = request.getParameter("psw2");
		if (pwd1 == null || "".equals(pwd1)){
			request.setAttribute("message", "密码不能为空！");
			return request.getRequestDispatcher("/admin/daleyzou/administrator.jsp");
		}
		if (!pwd1.equals(pwd2)){
			request.setAttribute("message", "两次输入密码不相等！");
			return request.getRequestDispatcher("/admin/daleyzou/administrator.jsp");
		}
		//2.读取session，得到当前登录管理员的id
		int id = ((adminEntity)request.getSession(false).getAttribute("admin")).getId();
		//3.调用service更改管理员信息
		userInfoService.updateAdministrator(id, pwd1);
		
		request.setAttribute("message", "更改管理员信息成功！！！！");
		//4.跳转
		return request.getRequestDispatcher("/admin/right.jsp");
		
	}
	
	
	/**
	 * 处理用户退出
	 */
	public Object quit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession(false).invalidate();; 
		//4.跳转
		return request.getRequestDispatcher("/index.jsp");
		
	}

	

}
