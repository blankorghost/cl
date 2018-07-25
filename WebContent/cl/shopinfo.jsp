<%@ page language="java" import="java.util.*,manage.*,reply.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>商品信息</title>
	<link rel="stylesheet" href="/cl/css/cl.css">
	<script src="/cl/js/jquery-2.0.0.min.js"></script>
	<link rel="stylesheet" href="/cl/css/lunbo.css">
	<link rel="stylesheet" href="/cl/css/shopinfo.css">
	<script src="/cl/js/lunbo.js"></script>
</head>
<%
	String path=request.getContextPath();
%>
<link rel="stylesheet" href="<%=path%>/bootstrap/bootstrap.min.css" type="text/css"/>
<script src="<%=path%>/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/bootstrap/jquery.min.js"></script>
<style>
	#plun{
	float:left;
	width:80%;
	height:auto;
	margin-left:180px;
}

.pl_detail{
	word-wrap:break-word;
}
</style>
<body>

<%
			request.setCharacterEncoding("UTF-8");
			int shopid=Integer.parseInt(request.getParameter("shopid"));
			shopinfos cloth=find.find_by_id(shopid);
			session.setAttribute("shop_id", cloth.getSi_id());
			session.setAttribute("shop_price", cloth.getSi_price());
			List<picture> pics=new ArrayList<picture>();
			pics=find.findtu(shopid);
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

				replyDB rd=new replyDB();
				pageCount=rd.getPageCount(pageSize);
				int Allnums=rd.getAllReplyNumsByShopId(shopid);
				if(nextpage>=pageCount){
					nextpage=pageCount;
				}
				ArrayList<userreplyEntity> list=rd.getUserReplyByPage(pageSize, currentpage, shopid);
			
			
		%>
<div id="top">
		<p id="userinfo">欢迎来到潮流</p>
		<a href="/cl/user/userinfo.jsp"><p id="user" style="float: left; margin-left: 10px;margin-top:15px">
			<c:if test="${not empty sessionScope.user }">
				${sessionScope.user.u_name }	
			</c:if>	
		</p></a>
		<ul>
			<li><a href="/cl/cl/shopcar.jsp"><img src="/cl/img/u51.png" alt="">购物车</a></li>
			<c:if test="${empty sessionScope.user }">
				<li><a href="/cl/cl/regist.jsp">注册</a></li>
			<li><a href="/cl/cl/login.jsp">登陆</a></li>	
			</c:if>	
		</ul>
</div>
<div class="container">
	<div id="logo">
		<a href="/cl/index.jsp">
			<div class="logo-img">
				<br>
				<span class="logo-span">C</span>
				<span class="logo-span">L</span>
				<br>
				<span class="logo-span-1">潮流</span>
			</div>
		</a>
		<div class="search">
			<form id="form" method="post" action="../find_action?select=1&gettype=1">
	          		<input type="text" name="name" placeholder="请输入关键字" style="height:45px">
				<div style="visibility: visible;" class="butt">
	          		<button id="searchinfo" type="submit" style="height:45px">搜索<img src="/cl/img/u41.png" alt=""></button>
	        	</div>
	        	</form>
		</div>
	</div>
	<div id="shopinfo">
		<div id="shop-box">
		</div>
		<div id="info-img">
			<div id="m-img"><img src="/cl<%=cloth.getSi_photo() %>" alt=""></div>
			<div id="o-img">
			<%
				for(int i=pics.size(),n=0;i<pics.size()+pics.size();i++,n++){
					picture pic=new picture();
					pic=pics.get(n);
					out.print("<img src='/cl"+pic.getP_path()+"' alt=''>");
				}
			%>
			</div>
		</div>
		<div id="info">
			<h1 id="info-text"><%=cloth.getSi_name() %></h1>
			<br>
			<p><span style="font-size: 30px; margin-right: 80px;">价格</span><img src="/cl/img/u31.png" alt=""><span id="price"><%=cloth.getSi_price() %></span></p>
			<br><br><br>
			<p><span style="font-size: 30px; margin-right: 80px;">尺寸</span>
			
				<button>165/M</button>
				<button>170/M</button>
				<button>170/L</button>
			
			</p>
			<br><br><br><br><br><br>
			<p id="choose"><a href="<%=request.getContextPath()%>/buycarAddAction?shopid=<%=shopid%>" style="color:black"><input type="button" value="加入购物车" ></a><input type="button" value="下单" onclick="check()" style="margin-left: 50px;"></p>
		</div>
	</div>
	
	
	<div id="plun">
<hr>
<h3>商品评论(<%=Allnums %>):</h3>
<%
	for(userreplyEntity m:list){
		%> 
		 
		<div class="pl_detail">
		<hr>
			<h4 id="r_username"><%=m.getR_username() %></h4>
			<p id="r_content"><strong>&nbsp;&nbsp;&nbsp;<%=m.getR_content() %></strong></p>
			<p id="r_time"><%=m.getR_time() %></p>
		</div>
		<hr>
<%		
	}
%>
	
	
	<nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="shopinfo.jsp?page=<%=lastpage%>&shopid=<%=shopid %>" >
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <%
    	for(int i=1;i<=pageCount;i++){
    %>
    <li><a href="shopinfo.jsp?page=<%=i%>&shopid=<%=shopid%>"><%=i %></a></li>
    
    <%
    	}
    %>
    <li>
      <a href="shopinfo.jsp?page=<%=nextpage %>&shopid=<%=shopid %>" >
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</div>
</div>





<div id="foot">
	<hr>
	<p>本网站开发人员为全体潮流员工</p>
	<p>本网站版权所有为潮流，最终法律解释权为潮流</p>
	<p>联系我们:QQ群639195798</p>
	<p>友情链接 <a href="">天猫</a>
	<a href="">淘宝</a>
	<a href="">京东</a>
	<a href="">蘑菇街</a></p>
</div>
<script language="JavaScript">
function check(){
	window.location.href="/cl/cl/checkout.jsp";
}
function check1(){
	window.location.href="/cl/cl/shopcar.jsp";
}
</script>
</body>
</html>