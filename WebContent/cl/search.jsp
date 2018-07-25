<%@ page language="java" import="java.util.*,manage.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>搜索</title>
	<link rel="stylesheet" href="/cl/css/cl.css">
	<link rel="stylesheet" href="/cl/css/regist.css">
	<link rel="stylesheet" href="/cl/css/login.css">
	<link rel="stylesheet" href="/cl/css/search.css">
	<link rel="stylesheet" href="/cl/css/find.css">
</head>
<body>
<div id="top">
		<p id="userinfo">欢迎来到潮流</p>
		<a href="/cl/user/userinfo.jsp"><p id="user" style="float: left; margin-left: 10px;margin-top:15px">
			<c:if test="${not empty sessionScope.user }">
				${sessionScope.user.u_name }	
			</c:if>	
		</p></a>
		<ul>
			<li><a href="/cl/cl/shopcar.jsp"><img src="/cl/img/u51.png" alt="">购物车</a></li>
			<c:if test="${empty sessionScope.user }">
				<li><a href="/cl/cl/regist.jsp">注册</a></li>
			<li><a href="/cl/cl/login.jsp">登陆</a></li>	
			</c:if>	
		</ul>
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
			</a>
			<div class="search">
				
				<form id="form" method="post" action="../find_action?select=1&gettype=1">
	          		<input type="text" name="name" placeholder="请输入关键字">
				<div style="visibility: visible;" class="butt">
	          		<button id="searchinfo" type="submit" style="height:45px">搜索<img src="/cl/img/u41.png" alt=""></button>
	        	</div>
	        	</form>
			</div>
		</div>
		<div style="clear: both; padding-top: 5px">
			<hr>
		</div>
		<%
		request.setCharacterEncoding("UTF-8");
		List<shopinfos> cloths=(List<shopinfos>)session.getAttribute("cloths");
		for(int i=0;i<cloths.size();i++){
			shopinfos cloth=cloths.get(i);
			 out.print("<div id='box'>"+
					"<a href='shopinfo.jsp?shopid="+cloth.getSi_id()+"' title='查看'>"+
					"<img src='/cl"+cloth.getSi_photo()+"'></a>"+
					"<span>"+cloth.getSi_name()+"</span>"+
					"</div>"); 
		}

		%>
		
	</div>
<div id="foot">
	<hr>
	<p>本网站开发人员为全体潮流员工</p>
	<p>本网站版权所有为潮流，最终法律解释权为潮流</p>
	<p>联系我们:QQ群639195798</p>
	<p>友情链接 <a href="">天猫</a>
	<a href="">淘宝</a>
	<a href="">京东</a>
	<a href="">蘑菇街</a></p>
</div>
</body>
</html>