<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
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
width:800px;
float: center;
border-bottom: hidden;
}
#back{
float:right;
margin-top:10px;
}
#ok{
float:right;
margin-top:10px;
}
</style>

<link rel="stylesheet" href="../bootstrap/bootstrap.min.css" type="text/css"/>
<body>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading"><img class="img-circle" id="logo" src="../img/cl.jpg"/><span id="top">添加商品</span></div>

  <!-- Table -->
  <form action="../insert_action" method="post">
  <table align="center" class="table" id="table">
    <tr>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品ID号</span>
			<input type="text" class="form-control" name="si_id">
		</div>
		</td>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品名</span>
			<input type="text" class="form-control" name="si_name">
		</div>
		</td>
    </tr>
    <tr>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品类型ID号</span>
			<input type="text" class="form-control" name="si_typeid">
		</div>
		</td>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品类型名</span>
			<input type="text" class="form-control" name="si_typename">
		</div>
		</td>
    </tr>
    <tr>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">上市时间</span>
 	 		<!-- <input type="hidden" name="si_time" value=""> -->
			<input type="text" class="form-control"  name="si_time">
		</div>
		</td>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">价格</span>
			<input type="text" class="form-control" name="si_price">
		</div>
		</td>
    </tr>
    <tr>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">库存数</span>
			<input type="text" class="form-control" name="si_allnum">
		</div>
		</td>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品介绍</span>
			<input class="form-control span12" type="text" name="si_content">
		</div>
		</td>
    </tr>
    <tr>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">备注</span>
			<textarea class="form-control span12" name="si_remark"></textarea>
		</div>
		</td>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">折扣</span>
			<input type="text" class="form-control" name="si_count">
		</div>
		</td>
    </tr>
    <tr>
    	<td colspan="2" >
    	<button type="submit" class="btn" id="ok" onclick="ok();">确定</button>
    	<a href="javascript:history.go(-1);" class="FunctionButton" id="back">返回|</a>
		</td>
    </tr>
  </table>
  </form>
</div>
<script type="text/javascript">
function ok(){
	alert("添加成功");
}

</script>
</body>

<script src="../bootstrap/bootstrap.min.js"></script>
<script src="../bootstrap/jquery.min.js"></script>
</html>