<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改公告</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  <link rel="stylesheet" href="<%=path%>/bootstrap/bootstrap.min.css" type="text/css"/>
  <script src="<%=path%>/bootstrap/bootstrap.min.js"></script>
  <script src="<%=path%>/bootstrap/jquery.min.js"></script>
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
	
	#titles{
		width:30%;
	}
	#times{
		width:30%;
	}
	
	#content{
	
	width:30%;
	height:200px;
	resize:none;
	}

</style>

<script>
	function shencha(){
		var title=document.getElementById("title");
		var content=document.getElementById("content");
		var time=document.getElementById("time");
		
		if(title==""){
			alert("标题不能为空");
			return false;
		}
	}
</script>
  <body>
    <div class="panel-heading" id="top_div"><img class="img-circle" id="logo" src="<%=path%>/img/cl.jpg"/><span id="top">发布公告</span></div>
    <center>
    <form action="<%=path+"/announceAddAction"%>" method="post">
    	<table>
    	<div class="input-group" style="margin-top:2%" id="titles">
		<span class="input-group-addon" id="basic-addon1">标题</span><input id="title" type="text" class="form-control" aria-describedby="basic-addon1" name="title" >
		</div>
		
		<div class="form-group" style="margin-top:2%">
	    <label for="name">内容</label>
	    <textarea class="form-control" rows="3" id="content" name="content" ></textarea>
	  	</div>
		
		<div class="input-group" style="margin-top:2%" id="times">
		<span class="input-group-addon" id="basic-addon1">时间</span><input type="datetime-local" class="form-control" aria-describedby="basic-addon1" name="time" id="time">
		</div>
		
		<div class="btn-group" role="group" style="margin-top:2%">
 		 <button type="submit" class="btn btn-default" onclick="javascript:shencha();">确定</button>
 		 <a href="admin/announcement/announcement.jsp"><button type="button" class="btn btn-default" >取消</button></a>
 	  </div>
		</table>
	</form>
    </center>
  </body>
</html>
