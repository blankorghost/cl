<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/cl/css/userinfo.css">
	<script src="/cl/js/jquery-2.0.0.min.js"></script>
	<style>
		#userinfo{
			width: auto;
		}
		#allinfo{
			height: auto;
			margin-right:30%;
			margin-left:15%;
		}
		.size{
			font-size: 20px;
			font-style: normal;
			color: #555555;
		}
		#choose{
			clear: both;
			margin-left:10%;
		}
		#choose input{
			width: 100px;
			height: 40px;
		}
		.tit{
    	font-size: 30px;
    	margin-top: -20px;
    	background: #D8D8D8;
    	color: #555555;
    }
	</style>
</head>
<body>
	<div id="userinfo">
		<p class="tit" style="margin-left:-10px;margin-top: -10px;">我的信息</p>
		<div id="allinfo">
			<p class="size">用户名：<span id="username">${sessionScope.loginUserInfo.u_name }</span></p>
			<p class="size">邮箱：<span id="email"></span>${sessionScope.loginUserInfo.ui_email }</p>
			<p class="size">联系电话：<span id="phone"></span>${sessionScope.loginUserInfo.ui_phone }</p>
			<p class="size">收货地址：<span id="adress"></span>${sessionScope.loginUserInfo.ui_address }</p>
		</div>
		<div id="choose">
			<a target="_parent" href="${pageContext.request.contextPath }/userInfo?method=quit"><input type="button" value="退出" ></a>
			<a  href="${pageContext.request.contextPath }/user/change.jsp"><input type="button" value="修改" style="margin-left: 200px" ></a>
		</div>
	</div>
</body>
</html>