<%@page import="announcement.announcementDB"%>
<%@page import="announcement.announceEntity"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <%
 	int id=Integer.parseInt(request.getParameter("id"));
  	announcementDB ad=new announcementDB();
	announceEntity announceEntity=ad.getAnnounceById(id);
  %>
  <style type="text/css">
#logo{
	height:50px;
	width:50px;
	}
	#top{
	font-size: 25px;
	padding-bottom:5px;
	}
	#table{
	min-width:600px;
	width:800px;
	float: center;
	}
	#top_div{
	background-color:#F5F5F5;
	}
	#main{
		width:100%;
		height:100%;
	}
	#content{
		width:80%;
		height:60%;
		word-wrap:break-word;
		width:80%;
	}
	#return{
	margin-top:4%%;
	margin-left:88%;
	}

</style>
<link rel="stylesheet" href="<%=path%>/bootstrap/bootstrap.min.css" type="text/css"/>
<script src="<%=path%>/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/bootstrap/jquery.min.js"></script>
  <body>
  <div id="#main">
    <div class="panel-heading" id="top_div"><img class="img-circle" id="logo" src="<%=path%>/img/cl.jpg"/><span id="top">公告详情</span></div>
	<center>
		<h2><%=announceEntity.getA_title() %></h2>
		<h4>发布时间:<%=announceEntity.getA_time()%></h4>
	</center>
	<center>
		<div id="content">
			<%=announceEntity.getA_content()%>
		</div>
	</center>
	<div id="return"><a href="admin/announcement/announcement.jsp"><button type="button" class="btn btn-default" >返回</button></a></div>
	</div>
  </body>
</html>

