<%@ page language="java" import="manage.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<link rel="stylesheet" href="../bootstrap/bootstrap.min.css" type="text/css"/>
<body>
<div class="panel panel-default">
 
  <table class="table">
  <%request.setCharacterEncoding("UTF-8");
  	int id=Integer.parseInt(request.getParameter("id"));
  	List<picture> pictures=new ArrayList<picture>();
  	pictures=find.findtu(id);
  	for(int i=0;i<pictures.size();i++){
  		picture tu=pictures.get(i);
  		out.print("<tr>");
  		out.print("<td align='center'>");
  		out.print("<img width='150px' height='250px' src='.."+tu.getP_path()+"'>");
  		out.print("</td>");
  		out.print("<td>");
  		out.print("<a class='btn' href='../deltu_action?id="+tu.getP_id()+"&p_sid="+tu.getS_sid()+"'>删除</a>");
  		out.print("<a class='btn' href='../makeyulan?pid="+tu.getP_id()+"&s_sid="+tu.getS_sid()+"'>设为预览图</a>");
  		out.print("</td>");
  		out.print("</tr>");
  	}
  %>
  
  </table>
</div>

<a href="javascript:history.go(-1);" class="FunctionButton" id="back">返回</a>
<script src="../bootstrap/bootstrap.min.js"></script>
<script src="../bootstrap/jquery.min.js"></script>
</body>
</html>