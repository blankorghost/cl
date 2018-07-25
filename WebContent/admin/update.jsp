<%@ page language="java" import="manage.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商品</title>
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
#ok{
float:right;
margin-top:10px;
}
</style>

<link rel="stylesheet" href="../bootstrap/bootstrap.min.css" type="text/css"/>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	int id=Integer.parseInt(request.getParameter("id"));
	shopinfos cloth=find.find_by_id(id);
	
%>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">
  <img class="img-circle" id="logo" src="../img/cl.jpg"/>
  <span id="top">商品修改</span>
  </div>

  <!-- Table -->
  <form name="frm" action="../update" method="post">
  <table align="center" class="table" id="table">
    <tr>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品ID号</span>
			<input type="text" class="form-control" name="si_id" value="<%=cloth.getSi_id() %>">
		</div>
		</td>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品名</span>
			<input type="text" class="form-control" name="si_name" value="<%=cloth.getSi_name() %>">
		</div>
		</td>
    </tr>
    <tr>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品类型ID号</span>
			<input type="text" class="form-control" name="si_typeid" value="<%=cloth.getSi_typeid() %>">
		</div>
		</td>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品类型名</span>
			<input type="text" class="form-control" name="si_typename" value="<%=cloth.getSi_typename() %>">
		</div>
		</td>
    </tr>
    <tr>
    	<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">上市时间</span>
			<input type="hidden" class="form-control" name="si_time" value="<%=cloth.getSi_time() %>">
			<input type="text" class="form-control" value="<%=cloth.getSi_time() %>">
		</div>
		</td>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">价格（精确到个位）</span>
			<input type="text" class="form-control" name="si_price" value="<%=cloth.getSi_price() %>">
		</div>
		</td>
    </tr>
    <tr>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">库存数</span>
			<input type="text" class="form-control" name="si_allnum" value="<%=cloth.getSi_allnum() %>">
		</div>
		</td>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">商品介绍</span>
			<input class="form-control span12" type="text" name="si_content" value="<%=cloth.getSi_content() %>">
		</div>
		</td>
    </tr>
    <tr>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">备注</span>
			<input class="form-control span12" name="si_remark" value="<%=cloth.getSi_remark() %>">
		</div>
		</td>
		<td width="300px">
    	<div class="input-group input-group-sm">
 	 		<span class="input-group-addon" id="sizing-addon3">折扣（精确到个位）</span>
			<input type="text" class="form-control" name="si_count" value="<%=cloth.getSi_count() %>">
		</div>
		</td>
    </tr>
    <tr>
    	<td colspan="2" width="300px">
    	<button type="submit" onclick="return check();" class="btn" id="ok">确定</button>
    	<a href="javascript:history.go(-1);" class="btn" id="back">返回|</a>
		</td>
    </tr>
  </table>
  </form>
</div>

<script language="JavaScript">
function check(){
	if(frm.si_id.value==""){
		alert("请输入商品ID号!");
		frm.si_id.focus();
		return false;
	}
	if(frm.si_name.value==""){
		alert("请输入商品名!");
		frm.si_name.focus();
		return false;
	}
	if(frm.si_typeid.value==""){
		alert("请输入类型ID!");
		frm.si_typeid.focus();
		return false;
	}
	if(frm.si_typename.value==""){
		alert("请输入类型名!");
		frm.si_typename.focus();
		return false;
	}
	if(frm.si_time.value==""){
		alert("请输入上市时间!");
		frm.si_time.focus();
		return false;
	}
	if(frm.si_price.value==""){
		alert("请输入价格!");
		frm.si_price.focus();
		return false;
	}
	if(frm.si_allnum.value==""){
		alert("请输入库存数量!");
		frm.si_allnum.focus();
		return false;
	}
	if(frm.si_content.value==""){
		alert("请输入商品介绍!");
		frm.si_content.focus();
		return false;
	}
	return true;
}
</script>
</body>

<script src="../bootstrap/bootstrap.min.js"></script>
<script src="../bootstrap/jquery.min.js"></script>
</html>
