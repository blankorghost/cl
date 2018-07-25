<%@page import="users.userEntity"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
int shopid=Integer.parseInt(request.getParameter("shopid"));
int o_id=Integer.parseInt(request.getParameter("orderid"));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style>
		#fff{
			width:30%;
			
		}
		
		#content{
			margin-top:4%;
			resize:none;
		}
	</style>

  </head>
  <body>
   	<link rel="stylesheet" href="<%=path%>/bootstrap/bootstrap.min.css" type="text/css"/>
	<script src="<%=path%>/bootstrap/bootstrap.min.js"></script>
	<script src="<%=path%>/bootstrap/jquery.min.js"></script>
	
	<center>
    <form action="<%=path+"/replyAddAction?shopid="+shopid+"&orderid="+o_id%>" method="post">
    	<table>	
		<div class="form-group" style="margin-top:2%" id="fff">
	    <label for="name">发布评价</label>
	    <textarea class="form-control" rows="6" id="content" name="content"></textarea>
	  	</div>
		
		<div class="btn-group" role="group" style="margin-top:2%">
 		 <button type="submit" class="btn btn-default">确定</button>
 		 <a href="user/order.jsp"><button type="button" class="btn btn-default" >取消</button></a>
 	  </div>
		</table>
	</form>
    </center>
  </body>
</html>
