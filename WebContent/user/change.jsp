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
		.size{
			font-size: 20px;
			font-style: normal;
			color: #555555;
		}
		#choose{
			clear: both;
			margin-left:25%;
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
    #change{
    	height: auto;
		margin-left:30%;
		margin-right:30%;
    }
    #change input{
    	width:350px;
    	height:30px;
    }
	</style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/userInfo?method=update&u_id=${sessionScope.loginUserInfo.u_id }" method="post">
		<div id="userinfo">
		<p class="tit" style="margin-left:-10px;margin-top: -10px; text-align:center">修改信息</p>
		<div id="change">
			<p class="size">&nbsp;&nbsp;&nbsp;用户名：<input id="username" type="text" name="username" value="${sessionScope.loginUserInfo.u_name }" readonly="readonly"></p>
			<p class="size">&nbsp;&nbsp;&nbsp;旧密码：<input id="password" type="password" name="password"><h5 style="color: red;">${message }</h5></p>
			<p class="size">&nbsp;&nbsp;&nbsp;新密码：<input id="newpassword" type="password" name="newpassword"></p>
			<p class="size">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱：&nbsp;<input id="email" type="text" name="email" value="${sessionScope.loginUserInfo.ui_email }"></p>
			<p class="size">联系电话：<input id="phone" type="text" name="phone" value="${sessionScope.loginUserInfo.ui_phone }"></p>
			<div><span class="size" style="float:left">收货地址：</span><p style="float:left" class="size"><textarea id="adress" name="adress" cols="28" rows="5"
				style="font-size: 20px;" class="size">${sessionScope.loginUserInfo.ui_address }</textarea></p>
			</div>
			<div style="clear:both" class="size">
				<a href="${pageContext.request.contextPath }/user/info.jsp"><input type="button" value="返回" style="width:100px;height:40px"></a>
				<input type="submit" value="确定" style="margin-left: 300px;width:100px;height:40px">
			</div>
		</div>
		</div>
	</form>
	
</body>
</html>