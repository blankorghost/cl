<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<%@ page import="bean.BuyList" %>
<%@ page import="java.util.*,java.io.*" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>填写订单页面</title>
	<link rel="stylesheet" href="/cl/css/cl.css">
	<link rel="stylesheet" href="/cl/css/regist.css">
	<link rel="stylesheet" href="/cl/css/login.css">
	<link rel="stylesheet" href="/cl/css/shop.css">
	<link rel="stylesheet" href="/cl/css/shopcar.css">
</head>
<body>
<div id="top">
		<p id="userinfo">欢迎来到潮流</p>
		<a href="/cl/user/userinfo.jsp"><p id="user" style="float: left; margin-left: 10px;margin-top:15px">
			<c:if test="${not empty sessionScope.user }">
				${sessionScope.user.u_name }	
			</c:if>	
		</p></a>
		<ul>
			<li><a href="/cl/cl/shopcar.jsp"><img src="/cl/img/u51.png" alt="">购物车</a></li>
		</ul>
</div>
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
<form action="<%=request.getContextPath() %>/ShopinsertAction" name="form" style="margin-left:30%;margin-right:30%" method="post">
 <table>
   <caption><font size="5" color="red">填写订单信息</font><span class="star" >*</span>(为必填项)</caption>
  
      <%-- <tr  height="30">
       <td>订单号</td><td <% out.print(rs.getString(1)); %>></td>
       </tr>
       --%>
       
    <tr>
        <td>收货人</td><td><input type="text" name="realname" id="realname"><span class="star">*</span></td>
        </tr>
    
        <!-- <td>Email</td><td><input type="text" id="email"></td>
        </tr>
     <tr> -->
        <td>用户地址</td><td><input type="text" name="address"><span class="star" id="address">*</span></td>
        </tr>
     <tr>
        <td>电&nbsp;&nbsp;话</td><td><input type="text" name="tel"><span class="star" id="tel">*</span></td>
        </tr>   
     <tr>
        <td>邮&nbsp;&nbsp;编</td><td><input type="text" name="youbian"><span class="star" id="youbian">*</span></td>
        </tr>
     <tr>
        <tr><td>备&nbsp;&nbsp;注</td><td><TEXTAREA name="detail"  rows="2" cols="20" onpropertychange="if(this.value.length>200) {this.value=value.substr(0,200);alert('描述最多20个字符!');}"></TEXTAREA>200个字符以内</td></tr>
        </tr> 
        <tr>
    <%
       java.util.Date date=new java.util.Date();
       //System.out.print(date);
       %>
       <td>下单时间</td><td ><p  name="ordertime" ><%=date %></p> </td>
       </tr> 
    <tr>
        
     <tr><td colspan="3" align="center" ><input type="submit" value="提交" onclick="check()" class="c-input"><input type="reset" value="重置"><input type="button" value="返回" onclick="fun2()"></td></tr> 

 </table>
</form>
<div id="foot" style="clear:both">
	<hr>
	<p>本网站开发人员为全体潮流员工</p>
	<p>本网站版权所有为潮流，最终法律解释权为潮流</p>
	<p>联系我们:QQ群639195798</p>
	<p>友情链接 <a href="">天猫</a>
	<a href="">淘宝</a>
	<a href="">京东</a>
	<a href="">蘑菇街</a></p>
</div>
</body>
</html>
<script language="JavaScript">
function check(){
	//window.location.href="../ShopinsertAction";
	if(form.realname.value==""){
		alert("请输入收货人!");
		form.realname.focus();
		return ;
	}
	if(form.address.value==""){
		alert("请输入用户地址!");
		form.address.focus();
		return ;
	}
	if(form.tel.value==""){
		alert("请输入联系人电话!");
		form.tel.focus();
		return ;
	}
	if(form.youbian.value==""){
		alert("请输入邮编!");
		form.youbian.focus();
		return ;
	}
}
function fun2(){
	history.back();
}
</script>