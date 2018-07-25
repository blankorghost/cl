<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/cl/css/cl.css">
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
			<li><a target="_black" href="/cl/index.jsp">返回首页</a></li>
		</ul>
</div>
</body>
</html>