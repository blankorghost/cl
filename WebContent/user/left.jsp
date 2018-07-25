<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/cl/css/cl.css">
	<script src="/cl/js/jquery-2.0.0.min.js"></script>
<style type="text/css">
body{
background-color: #828282;
}
#menu  
    {  
        width:225px;  
        height:320px;  
        background-color:RGB(216,216,216);  
        padding:0px;  
        margin:0px;  
    }  
#menu ul  
    {  
        width:225px;  
        list-style-type:none;  
        padding:0px;  
        margin:0px;  
    }  
#menu ul li  
    {  
        width:225px; 
    }  
#menu ul li a  
    {  
        display:block;            /*先转化成块级元素*/  
        color:gray;  
        text-align:left;  
        text-decoration:none;  
        padding:10px 0px 10px 30px;    /*设置距离左侧的边栏和上边距*/  
        font-size:20px;  
    }  
#menu ul li a:hover  
    {  
        color:orange;  
        text-align:left;  
        text-decoration:none;  
        padding:10px 0px 10px 30px;  
        font-size:20px;  
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
<div id="menu"> 
<p class="tit">个人中心</p>
    <ul style="margin-top: -30px">  
    	<li><a target="right" href="${pageContext.request.contextPath }/order?method=customOrderDetail&u_id=${sessionScope.user.u_id}" >我的订单</a></li>
        <li><a target="right" href="${pageContext.request.contextPath }/userInfo?method=customDetail&u_id=${sessionScope.user.u_id}" >我的信息</a></li>
		<li><a target="right" href="/cl/user/reply.jsp" >我的评论</a></li> 
    </ul>  
</div>  
</body>
</html>