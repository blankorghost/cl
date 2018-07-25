<%@ page language="java" import="manage.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详细信息</title>
</head>
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
#back{
float:right;
margin-top:10px;
}
#update{
float:right;
margin-top:10px;
}
img{
width:200px;
height:350px;
}
</style>

<link rel="stylesheet" href="../bootstrap/bootstrap.min.css" type="text/css"/>
<body>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">
  <img class="img-circle" id="logo" src="../img/cl.jpg"/>
  <span id="top">商品详细信息</span>
  </div>
<%
	request.setCharacterEncoding("UTF-8");
	int id=Integer.parseInt(request.getParameter("id"));
	shopinfos cloth=find.find_by_id(id);
%>

  <!-- Table -->
  <table align="center" class="table" id="table">
    <tr>
    	<td width="300px">
			<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">商品ID</h3>
 			 	</div>
  				<div class="panel-body">
  			 			<%=cloth.getSi_id() %>
  				</div>
			</div>
		</td>
    	<td width="300px">
    	<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">商品名</h3>
 			 	</div>
  				<div class="panel-body">
  			 			<%=cloth.getSi_name() %>
  				</div>
			</div>
		</td>
    </tr>
    <tr>
    	<td width="300px">
    	<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">商品类型ID</h3>
 			 	</div>
  				<div class="panel-body">
  			 			<%=cloth.getSi_typeid() %>
  				</div>
			</div>
		</td>
    	<td width="300px">
    	<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">商品类型名</h3>
 			 	</div>
  				<div class="panel-body">
  			 			<%=cloth.getSi_typename() %>
  				</div>
			</div>
		</td>
    </tr>
    <tr>
    	<td width="300px">
    	<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">上市时间</h3>
 			 	</div>
  				<div class="panel-body">
  			 			<%=cloth.getSi_time() %>
  				</div>
			</div>
		</td>
		<td width="300px">
    	<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">价格</h3>
 			 	</div>
  				<div class="panel-body">
  			 			<%=cloth.getSi_price() %>元
  				</div>
			</div>
		</td>
    </tr>
    <tr>
		<td width="300px">
    	<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">库存数</h3>
 			 	</div>
  				<div class="panel-body">
  			 			<%=cloth.getSi_allnum() %>件
  				</div>
			</div>
		</td>
		<td width="300px">
    	<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">商品介绍</h3>
 			 	</div>
  				<div class="panel-body">
  			 			 <%=cloth.getSi_content() %>
  				</div>
			</div>
		</td>
    </tr>
    <tr>
		<td width="300px">
    	<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">备注</h3>
 			 	</div>
  				<div class="panel-body">
  			 			<%=cloth.getSi_remark() %>
  				</div>
			</div>
		</td>
		<td width="300px">
    	<div class="panel panel-default">
  				<div class="panel-heading">
    			<h3 class="panel-title">折扣</h3>
 			 	</div>
  				<div class="panel-body">
  			 			<%=cloth.getSi_count() %>
  				</div>
			</div>
		</td>
    </tr>
    <tr>
    	<td colspan="1" width="300px" align="center">
    	<a class="btn" href="picture.jsp?id=<%=cloth.getSi_id() %>">查看图片</a>
			
		</td>
		<td>
		<form action="../tu?id=<%=cloth.getSi_id() %>" method="post" enctype="multipart/form-data">
		<input  type="file" name="tu">
		<button type="submit" class="btn">提交图片</button>
		</form>
		</td>
    </tr>
    <tr>
    	<td colspan="2" width="300px">
    	<a href="update.jsp?id=<%=cloth.getSi_id() %>" class="FunctionButton" id="update">修改</a>
    	<a href="javascript:history.go(-1);" class="FunctionButton" id="back">返回|</a>
		</td>
    </tr>
  </table>
</div>

</body>

<script src="../bootstrap/bootstrap.min.js"></script>
<script src="../bootstrap/jquery.min.js"></script>
</html>