<%@page import="reply.userreplyEntity"%>
<%@page import="reply.replyDB,users.*"%>
<%@page import="announcement.announcementDB"%>
<%@page import="announcement.announceEntity"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	userEntity ue=(userEntity)session.getAttribute("user");
  	replyDB rd=new replyDB();
  	int userid=ue.getU_id();
  	ArrayList<userreplyEntity> list=rd.getUserReplyByUserId(pageSize, currentpage, userid);
  	pageCount=rd.getPageCount(pageSize);
  	if(nextpage>=pageCount){
		nextpage=pageCount;
	}
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
	.tit{
    	font-size: 30px;
    	background: #D8D8D8;
    	color: #555555;
    }
	#ac_list{
	
	margin-top:2%;
		}

</style>
<link rel="stylesheet" href="<%=path%>/bootstrap/bootstrap.min.css" type="text/css"/>
<script src="<%=path%>/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/bootstrap/jquery.min.js"></script>
<script type="text/javascript">

	function delet(id){
		if(confirm("删除此评论？")==true){
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
				if(rd.deleteUserReply(id)==1){
					out.print("alert('删除成功！')");
					response.sendRedirect("reply.jsp?page="+pages);
				} 
			%>
		}
	}
</script>
  <body>
    <p class="tit">我的评论</p>
    
    <center>
   <table class="table table-striped">
  <thead>
    <tr>
      <th>评论id</th>
      <th>内容</th>
      <th>时间</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  	for(userreplyEntity m:list){ 
  		String content=m.getR_content();
  		int length=content.length();
  		if(length>12){
  			content=content.subSequence(0, 12)+"...";
  		}
  %>
    <tr>
      <td><%=m.getR_id()%></td>
      <td><%=content %></td>
      <td><%=m.getR_time() %></td>
      <td>
      <div class="btn-group" role="group" >
 		 <a href="<%=path %>/cl/shopinfo.jsp?shopid=<%=m.getR_shopid()%>" target="_black"><button type="button" class="btn btn-default" >查看</button></a>
 		 <a href="user/reply.jsp?page=<%=currentpage%>&id=<%=m.getR_id()%>"><button type="button" class="btn btn-default" onclick="javascript:return delet(<%=m.getR_id()%>);">删除</button></a>
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
      <a href="user/reply.jsp?page=<%=lastpage%>" >
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <%
    	for(int i=1;i<=pageCount;i++){
    %>
    <li><a href="user/reply.jsp?page=<%=i%>"><%=i %></a></li>
    
    <%
    	}
    %>
    <li>
      <a href="user/reply.jsp?page=<%=nextpage %>" >
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
  </body>
</html>
