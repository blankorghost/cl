<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="bean.BuyList"%>
<%@ page import="java.util.*,java.io.*"%>
<%
	String path = request.getContextPath();
	ArrayList<BuyList> reclist = (ArrayList<BuyList>) session.getAttribute("orderList");
	session.removeAttribute("orderList");
	if (reclist == null) {//测试数据还未构建
		reclist = new ArrayList<BuyList>();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>订单显示页面</title>
<link rel="stylesheet" href="/cl/css/cl.css">
<link rel="stylesheet" href="/cl/css/regist.css">
<link rel="stylesheet" href="/cl/css/login.css">
<link rel="stylesheet" href="/cl/css/shop.css">
<link rel="stylesheet" href="/cl/css/shopcar.css">
</head>
<body>
<div id="top">
		<p id="userinfo">欢迎来到潮流</p>
		<a href="/cl/user/userinfo.jsp"><p id="user" style="float: left; margin-left: 10px;margin-top:15px">
			<c:if test="${not empty sessionScope.user }">
				${sessionScope.user.u_name }	
			</c:if>	
		</p></a>>
		<ul>
			<li><a href="/cl/cl/shopcar.jsp"><img src="/cl/img/u51.png" alt="">购物车</a></li>
			<li><a href="/cl/cl/regist.jsp">注册</a></li>
			<li><a href="/cl/cl/login.jsp">登陆</a></li>
		</ul>
</div>
</div>
	<div class="container">
        <div id="logo">
			<a href="/cl/index.jsp">
				<div class="logo-img">
					<br>
					<span class="logo-span">C</span>
					<span class="logo-span">L</span>
					<br>
					<span class="logo-span-1">潮流</span>
				</div>

	<table border="1" width="800" rules="none" cellspacing="0"
		cellpadding="0" align="center">
	<tr height="50">
	<tr height="50">
		<td colspan="11" align="center">订单信息如下</td>
	</tr>
		
		<tr align="center" height="30" bgcolor="lightgrey">
			<td>店铺名字</td>
		
		
			<td>商品信息</td>
		
		
			<td>数量</td>
		
		   <td>价格</td>
		
		   <td>用户名</td>
		
		   <td>收货人</td>
		
		   <td>收货地址</td>
		
		   <td>电话</td>
		
		   <td>邮编</td>
		
		   <td>备注</td>
		
		   <td>下单时间</td>
		</tr>

			<%
				int count = reclist.size();
				for (int i = 0; i < count; i++) {
					BuyList order = reclist.get(i);
			%>
		
		<tr align="center" height="50">
			<td><%=order.getShopname()%></td>
		
			<td><%=order.getNum()%></td>
		
			<td><%=order.getPrice()%></td>
		
			<td><%=order.getUserName()%></td>
		
			<td><%=order.getRealname()%></td>
		
			<td><%=order.getUserAddress()%></td>
		
			<td><%=order.getOrderTel()%></td>
		
			<td><%=order.getPostCode()%></td>
		
			<td><%=order.getOrderTime()%></td>
		</tr>

		<%
			}
		%>
	</table>

	<div id="foot" style="clear: both">
		<hr>
		<p>本网站开发人员为全体潮流员工</p>
		<p>本网站版权所有为潮流，最终法律解释权为潮流</p>
		<p>联系我们:QQ群639195798</p>
		<p>
			友情链接 <a href="">天猫</a> <a href="">淘宝</a> <a href="">京东</a> <a href="">蘑菇街</a>
		</p>
	</div>
</body>
</html>