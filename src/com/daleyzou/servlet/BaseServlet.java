package com.daleyzou.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daleyzou.factory.BeanFactory;
import com.daleyzou.service.IOrderService;
import com.daleyzou.service.IUserInfoService;
import com.daleyzou.utils.WebUtils;

/**
 * 项目中的Servlet，希望所有的servlet都继承此类
 * @author 11543
 *
 */
public abstract class BaseServlet extends HttpServlet {
	
	//一次创建所有的service
	protected IUserInfoService userInfoService = 
			BeanFactory.getInstance("userInfoService", IUserInfoService.class);
	protected IOrderService orderService = 
			BeanFactory.getInstance("orderService", IOrderService.class);
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//方法返回值
		Object returnValue = null;
		
		//【约定：操作类型的值，必须对应servlet中的方法的名称】
		String methodName = request.getParameter("method");
		
		try {
			//1.获取当前类的字节码
			Class clazz = this.getClass();
			//2.获取当前执行的方法的Method类型
			Method method = clazz.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			//3.执行方法
			returnValue = method.invoke(this, request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
			returnValue = "/error/error.jsp";
		}
		
		//跳转
		WebUtils.goTo(request, response, returnValue);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
}
