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
  	int currentpage;
	int pageSize=6;
	int pageCount;
	int lastpage;
	if(request.getParameter("page")!=null){
		currentpage=Integer.parseInt(request.getParameter("page"));
	}
	else{
		currentpage=1;
	}
	int nextpage=currentpage+1;
	if(currentpage==1){
		lastpage=1;
	}
	else{
		lastpage=currentpage-1;
	}
	
  	announcementDB ad=new announcementDB();
  	pageCount=ad.getPageCount(pageSize);
  	if(nextpage>=pageCount){
		nextpage=pageCount;
	}
  	ArrayList<announceEntity> list=ad.getAnnounceByPage(pageSize, currentpage);
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
	
	#ac_list{
	
	margin-top:2%;
		}
		
		
	.ac_show{
	text-align:center;
	width:180px;
	height:40px;
	background-color:#F5F5F5;
	}

</style>
<link rel="stylesheet" href="<%=path%>/bootstrap/bootstrap.min.css" type="text/css"/>
<script src="<%=path%>/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/bootstrap/jquery.min.js"></script>
<script type="text/javascript">

	function delet(id){
		if(confirm("删除此公告")==true){
			<%
				int id;
				int pages;
				if(request.getParameter("id")!=null){
					id=Integer.parseInt(request.getParameter("id"));
				}
				else{
					id=0;
				}
				if(request.getParameter("page")!=null){
					pages=Integer.parseInt(request.getParameter("page"));
				}
				else{
					pages=1;
				}
				if(ad.deleteAnnouncement(id)==1){
					out.print("alert('删除成功！')");
					response.sendRedirect("announcement.jsp?page="+pages);
				}
			%>
		}
	}
</script>
  <body>
    <div class="panel-heading" id="top_div"><img class="img-circle" id="logo" src="<%=path%>/img/cl.jpg"/><span id="top">公告管理</span></div>
    
    <center>
   <table class="table table-striped">
  <thead>
    <tr>
      <th>公告id</th>
      <th>公告标题</th>
      <th>公告内容</th>
      <th>发布时间</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  	for(announceEntity m:list){
  		String content=m.getA_content();
  		int length=content.length();
  		if(length>12){
  			content=content.subSequence(0, 12)+"...";
  		}
  %>
    <tr>
      <td><%=m.getA_id() %></td>
      <td><%=m.getA_title() %></td>
      <td><%=content %></td>
      <td><%=m.getA_time()%></td>
      <td>
      <div class="btn-group" role="group" >
      <a href="admin/announcement/announce_detail.jsp?id=<%=m.getA_id()%>"><button type="button" class="btn btn-default" >查看</button></a>
 		 <a href="admin/announcement/announce_update.jsp?id=<%=m.getA_id()%>"><button type="button" class="btn btn-default" >修改</button></a>
 		 <a href="admin/announcement/announcement.jsp?page=<%=currentpage%>&id=<%=m.getA_id()%>"><button type="button" class="btn btn-default" onclick="javascript:return delet(<%=m.getA_id()%>);">删除</button></a>
 	  </div>
      </td>
    </tr>
   <%
  		} 
   %>
  </tbody>
</table>
    </center>
    
    <nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="admin/announcement/announcement.jsp?page=<%=lastpage%>" >
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <%
    	for(int i=1;i<=pageCount;i++){
    %>
    <li><a href="admin/announcement/announcement.jsp?page=<%=i%>"><%=i %></a></li>
    
    <%
    	}
    %>
    <li>
      <a href="admin/announcement/announcement.jsp?page=<%=nextpage %>" >
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
  </body>
</html>
