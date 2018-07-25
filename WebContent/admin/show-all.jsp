<%@ page language="java" import="manage.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所有商品</title>
</head>
<link rel="stylesheet" href="../bootstrap/bootstrap.min.css" type="text/css"/>
<style type="text/css">
#top{
font-size: 20px;
}
#top span{
font-size: 15px;
}
#tr{
background-color: #96CDCD;
}
#tr td{
width:100px;
font-size: 15px;
}
img{
width:90px;
height:95px;
}
td{
font-size:12px;
text-align: left;
text-overflow: inherit;
min-width: 80px;
}
td a{
text-align: center;
}
.text{
font-size: 10px;
}
#div{
overflow: hidden;
}
#ul{
float:right;
padding-top:1px;
padding-bottom:1px;
margin-top:0px;
magin-bottom:0px;
}
</style>

<body>
<%!List<shopinfos> cloths=new ArrayList<shopinfos>(); %>
<%!int show=4; %>
<%
	request.setCharacterEncoding("UTF-8");
	cloths=(ArrayList<shopinfos>)session.getAttribute("cloths");
	if(Integer.parseInt(request.getParameter("next"))==1){
		session.setAttribute("pagenow",
				Integer.parseInt((String)session.getAttribute("pagenow"))+1+"");
	}else if(Integer.parseInt(request.getParameter("next"))==2){
		session.setAttribute("pagenow",
				Integer.parseInt((String)session.getAttribute("pagenow"))+2+"");
	}else if(Integer.parseInt(request.getParameter("next"))==3){
		session.setAttribute("pagenow",
				Integer.parseInt((String)session.getAttribute("pagenow"))+3+"");
	}else if(Integer.parseInt(request.getParameter("next"))==-1){
		session.setAttribute("pagenow",
				Integer.parseInt((String)session.getAttribute("pagenow"))-1+"");
	}
%>
<form>
	<div class="panel panel-default" id="div">
	<div class="panel-heading" id="hold">
  	<span id="top" class="label label-primary">商品总数<span class="badge"><%=cloths.size() %></span></span>
	
	<ul class="pagination" id="ul">
	<%if(Integer.parseInt((String)session.getAttribute("pagenow"))==0){
		
		%>
    <li class="disabled">
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	<% }else{%>
	<li>
      <a href="show-all.jsp?next=<%=-1 %>" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <%} %>
    <%if((Integer.parseInt((String)session.getAttribute("len"))/show+1)-
    		Integer.parseInt((String)session.getAttribute("pagenow"))>2){ %>
    <li><a href="#"><%=Integer.parseInt((String)session.getAttribute("pagenow")) %></a></li>
    <li><a href="show-all.jsp?next=1"><%=Integer.parseInt((String)session.getAttribute("pagenow"))+1 %></a></li>
    <li><a href="show-all.jsp?next=2"><%=Integer.parseInt((String)session.getAttribute("pagenow"))+2 %></a></li>
    <%} else if((Integer.parseInt((String)session.getAttribute("len"))/show+1) -
    		Integer.parseInt((String)session.getAttribute("pagenow")) >= 0){
    	for(int i=0;i<(Integer.parseInt((String)session.getAttribute("len"))/show+1)-
        		Integer.parseInt((String)session.getAttribute("pagenow"));i++){
   out.print("<li><a href='show-all.jsp?next="+i+
		   "'>"+(Integer.parseInt((String)session.getAttribute("pagenow"))+i)+"</a></li>"); 
    }} %>
    
    <%if(Integer.parseInt((String)session.getAttribute("pagenow"))
    		>=(Integer.parseInt((String)session.getAttribute("len"))/show)-3){%>
    <li  class="disabled">
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <%}else{ %>
    <li>
      <a href="show-all.jsp?next=<%=3 %>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <%} %>
	</ul>
	
	</div>
  <table class="table">
  	<thead >
  		<tr id="tr">
    		<td>商品ID</td>
    		<td>商品名</td>
    		<td>类型ID</td>
    		<td>类型名</td>
    		<td>上市时间</td>
    		<td>图片展示</td>
    		<td>价格（元）</td>
    		<td>销量</td>
    		<td>更多</td>
    	</tr>
  	</thead>
  	<tbody>
  	<%int num=show;
  		if(Integer.parseInt((String)session.getAttribute("pagenow"))==
  		(Integer.parseInt((String)session.getAttribute("len"))/show)){
  			num=Integer.parseInt((String)session.getAttribute("len"))-
  					(Integer.parseInt((String)session.getAttribute("pagenow")))*show;
  			//System.out.println(num);
  		}
  	for(int i=Integer.parseInt((String)session.getAttribute("pagenow"))*show;
  			i<Integer.parseInt((String)session.getAttribute("pagenow"))*show+num;i++){
  		shopinfos cloth=new shopinfos();
  		cloth=cloths.get(i);
  		out.print("<tr>");
  		out.print("<td>"+cloth.getSi_id()+"</td>");
  		out.print("<td>"+cloth.getSi_name()+"</td>");
  		out.print("<td>"+cloth.getSi_typeid()+"</td>");
  		out.print("<td>"+cloth.getSi_typename()+"</td>");
  		out.print("<td>"+cloth.getSi_time()+"</td>");
  		out.print("<td><img src='.."+cloth.getSi_photo()+"'></td>");
  		out.print("<td>"+cloth.getSi_price()+"</td>");
  		out.print("<td>"+cloth.getSi_allnum()+"</td>");
  		out.print("<td>"+
  			"<a class='btn btn-primary' href='look-one.jsp?id="+cloth.getSi_id()+"'>"+
  			"<span class='text'>详细信息</span></a>"+
			"<a class='btn btn-primary' href='../delete_action?id="+cloth.getSi_id()+"'>"+
			"<span class='text'>删除</span></a></td></tr>");
  	}

  	%>
  	</tbody>
   
  </table>
  
	</div>
  
</form>

<script src="../bootstrap/bootstrap.min.js"></script>
<script src="../bootstrap/jquery.min.js"></script>
</body>
</html>