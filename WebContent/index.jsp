<%@ page language="java" import="java.util.*,manage.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>潮流</title>
	<link rel="stylesheet" href="/cl/css/cl.css">
	<script src="/cl/js/jquery-2.0.0.min.js"></script>
	<link rel="stylesheet" href="/cl/css/lunbo.css">
	<link rel="stylesheet" href="/cl/css/h-nav.css">
	<link rel="stylesheet" href="/cl/bootstrap/bootstrap.min.css">
	<script src="/cl/bootstrap/bootstrap.min.js"></script>
	<script src="/cl/js/lunbo.js"></script>
	<script src="/cl/js/h-nav.js"></script>
	<style>
	a{
		color:black;
	}
	.showon{
	display:none;
}
	</style>
</head>
<body>
<div id="top">
		<p id="userinfo" style="margin-top:20px">欢迎来到潮流</p>
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
<div id="h-nav" class="showon">
	<ul>
		<li><a href="#top" ><input type="button" value="顶部"></a></li>
		<li><a href="#shangyi" ><input type="button" value="上衣"></a></li>
		<li><a href="#t-shit" ><input type="button" value="T恤"></a></li>
		<li><a href="#chenshan" ><input type="button" value="衬衫"></a></li>
		<li><a href="#niuzai" ><input type="button" value="牛仔"></a></li>
		<li><a href="#foot" ><input type="button" value="底部"></a></li>
		<li><a href="announce/announce.jsp" ><input type="button" value="公告"></a></li>
	</ul>
</div> 
<div class="container">
	
	<div id="logo">
		<a href="index.jsp">
			<div class="logo-img">
				<br>
				<span class="logo-span">C</span>
				<span class="logo-span">L</span>
				<br>
				<span class="logo-span-1">潮流</span>
			</div>
		</a>
		<div class="search">
			<form action="<%=request.getContextPath() %>/find_action?gettype=1&select=1" method="post">
          		<input type="text" name="name" placeholder="请输入关键字">
				<div style="visibility: visible;" class="butt">
          		<button id="searchinfo" type="submit">搜索<img src="/cl/img/u41.png" alt=""></button>
        	</div>
        	</form>
		</div>
	</div>
	<div id="nav">
		<a href="index.jsp"><input type="button" value="首页"></a>
		<a href="#shangyi"><input type="button" value="上衣"></a>
		<a href="#t-shit"><input type="button" value="T恤"></a>
		<a href="#chenshan"><input type="button" value="衬衫"></a>
		<a href="#niuzai"><input type="button" value="牛仔"></a>
	</div>
	<div id="lunbo">
		<div class="slider"> 
			<ul class="slider-main"> 
			   <li class="slider-panel"> 
			    <a href="/cl/cl/shopinfo.jsp?shopid=<%=41 %>"><img src="/cl/img/u14.jpg"></a>
			   </li> 
			   <li class="slider-panel"> 
			    <a href="/cl/cl/shopinfo.jsp?shopid=<%=42 %>"><img src="/cl/img/u16.jpg"></a> 
			   </li> 
			   <li class="slider-panel"> 
			    <a href="/cl/cl/shopinfo.jsp?shopid=<%=43 %>"><img src="/cl/img/u20.jpg"></a>
			   </li> 
			   <li class="slider-panel"> 
			    <a href="/cl/cl/shopinfo.jsp?shopid=<%=44 %>"><img src="/cl/img/u22.jpg""></a>
			   </li> 
			</ul> 
			<div class="slider-extra"> 
			  <ul class="slider-nav"> 
			    <li class="slider-item">1</li> 
			    <li class="slider-item">2</li> 
			    <li class="slider-item">3</li> 
			    <li class="slider-item">4</li> 
			  </ul> 
			</div> 
		</div> 
	</div>
	<div id="special">
		<ul>
			<a href="/cl/cl/shopinfo.jsp?shopid=<%=47 %>">
			<li><h2>今日特价</h2><img src="/cl/img/u191.jpg" alt="" class="special-img">
			<p><span id="price"><img src="/cl/img/u31.png" alt=""><s>199.00</s></span><span id="rprice">180.00</span></p>
			</li>
			</a>
			<a href="/cl/cl/shopinfo.jsp?shopid=<%=45 %>">
			<li><h2>今日特价</h2><img src="/cl/img/u34.jpg" alt="" class="special-img">
			<p><span id="price"><img src="/cl/img/u31.png" alt=""><s>199.00</s></span><span id="rprice">180.00</span>
			</p></li>
			</a>
			<a href="/cl/cl/shopinfo.jsp?shopid=<%=46 %>">
			<li><h2>今日特价</h2><img src="/cl/img/u35.jpg" alt="" class="special-img">
			<p><span id="price"><img src="/cl/img/u31.png" alt=""><s>199.00</s></span><span id="rprice">180.00</span></p>
			</li></a>
		</ul>
	</div>
	<div id="clothes">
		<div id="shangyi">
			<div class="c-clor"></div><p class="tit">上衣</p>
			<ul>
			
			<%
				List<shopinfos> cloths=new ArrayList<shopinfos>();
				cloths=find.find_by_typeid(1);
				for(int i=0;i<cloths.size();i++){
					shopinfos clo=cloths.get(i);
					out.print("<li>");
					out.print("<a href='/cl/cl/shopinfo.jsp?shopid="+clo.getSi_id()+"'>");
					out.print("<div class='shopinfo'>");
					out.print("<img src='/cl/"+clo.getSi_photo()+"' alt='' class='shopinfo-img'>");
					out.print("<p style='float: left; padding-top:10px'><span style='color: red'>"+clo.getSi_price()+"</span><img src='/cl/img/u31.png' alt=''></p>");
					out.print("<p style='padding-top:10px'>"+clo.getSi_name()+"</p>");
					out.print("</div></a>");
					out.print("</li>");
				}
			%>
			
			</ul>
		</div>
		<div id="t-shit">
		<div class="c-clor"></div><p class="tit">T恤</p>
			<ul>
			<%
				List<shopinfos> cloths1=new ArrayList<shopinfos>();
				cloths1=find.find_by_typeid(3);
				for(int i=0;i<cloths1.size();i++){
					shopinfos clo=cloths1.get(i);
					out.print("<li>");
					out.print("<a href='/cl/cl/shopinfo.jsp?shopid="+clo.getSi_id()+"'>");
					out.print("<div class='shopinfo'>");
					out.print("<img src='/cl/"+clo.getSi_photo()+"' alt='' class='shopinfo-img'>");
					out.print("<p style='float: left; padding-top:10px'><span style='color: red'>"+clo.getSi_price()+"</span><img src='/cl/img/u31.png' alt=''></p>");
					out.print("<p style='padding-top:10px'>"+clo.getSi_name()+"</p>");
					out.print("</div></a>");
					out.print("</li>");
				}
			%>

			</ul>
		</div>
		<div id="chenshan">
		<div class="c-clor"></div><p class="tit">衬衫</p>
			<ul>
			
			<%
				List<shopinfos> cloths2=new ArrayList<shopinfos>();
				cloths2=find.find_by_typeid(4);
				for(int i=0;i<cloths2.size();i++){
					shopinfos clo=cloths2.get(i);
					out.print("<li>");
					out.print("<a href='/cl/cl/shopinfo.jsp?shopid="+clo.getSi_id()+"'>");
					out.print("<div class='shopinfo'>");
					out.print("<img src='/cl/"+clo.getSi_photo()+"' alt='' class='shopinfo-img'>");
					out.print("<p style='float: left; padding-top:10px'><span style='color: red'>"+clo.getSi_price()+"</span><img src='/cl/img/u31.png' alt=''></p>");
					out.print("<p style='padding-top:10px'>"+clo.getSi_name()+"</p>");
					out.print("</div></a>");
					out.print("</li>");
				}
			%>
				
			</ul>
		</div>
		<div id="niuzai">
		<div class="c-clor"></div><p class="tit">牛仔</p>
			<ul>
			
			<%
				List<shopinfos> cloths3=new ArrayList<shopinfos>();
				cloths3=find.find_by_typeid(2);
				for(int i=0;i<cloths3.size();i++){
					shopinfos clo=cloths3.get(i);
					out.print("<li>");
					out.print("<a href='/cl/cl/shopinfo.jsp?shopid="+clo.getSi_id()+"'>");
					out.print("<div class='shopinfo'>");
					out.print("<img src='/cl/"+clo.getSi_photo()+"' alt='' class='shopinfo-img'>");
					out.print("<p style='float: left; padding-top:10px'><span style='color: red'>"+clo.getSi_price()+"</span><img src='/cl/img/u31.png' alt=''></p>");
					out.print("<p style='padding-top:10px'>"+clo.getSi_name()+"</p>");
					out.print("</div></a>");
					out.print("</li>");
				}
			%>
				
			</ul>
		</div>
	</div>
</div>

<div id="foot">
	<hr>
	<p>本网站开发人员为全体潮流员工</p>
	<p>本网站版权所有为潮流，最终法律解释权为潮流</p>
	<p>联系我们:QQ群639195798</p>
	<p>友情链接 <a href="https://www.tmall.com">天猫</a>
	<a href="">淘宝</a>
	<a href="">京东</a>
	<a href="">蘑菇街</a></p>
</div>
</body>
</html>