<%@ page language="java" contentType="text/html; charset=GBK" import="java.sql.*"
    pageEncoding="GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.*,users.*,manage.*"%>
<%@ page import="java.util.*,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>���ﳵ</title>
	<link rel="stylesheet" href="/cl/css/cl.css">
	<link rel="stylesheet" href="/cl/css/regist.css">
	<link rel="stylesheet" href="/cl/css/login.css">
	<link rel="stylesheet" href="/cl/css/shop.css">
	<link rel="stylesheet" href="/cl/css/shopcar.css">
</head>
<body>
<div id="top">
		<p id="userinfo">��ӭ��������</p>
		<a href="/cl/user/userinfo.jsp"><p id="user" style="float: left; margin-left: 10px">
			<c:if test="${not empty sessionScope.user }">
				${sessionScope.user.u_name }	
			</c:if>	
		</p></a>
		<ul>
			<li><a href="/cl/cl/shopcar.jsp"><img src="/cl/img/u51.png" alt="">���ﳵ</a></li>
			<c:if test="${empty sessionScope.user }">
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
					<span class="logo-span-1">����</span>
				</div>
			</a>
			<div id="logozi" 
				style="visibility: visible;">
	         	<p><span>���ﳵ</span></p>
	        	</div>
			<div class="search" style="margin-top: -80px;padding-top: 0">
				<input type="text" placeholder="������ؼ���">
				<div style="visibility: visible;" class="butt">
	          		<button id="searchinfo" onclick="" style="font-size:33px">����<img src="/cl/img/u41.png" alt=""></button>
	        	</div>
			</div>
		</div>
		<div style="clear: both;"><br><hr></div>
	
	<%
		shopcarDB sd=new shopcarDB();
		
		userEntity user=(userEntity)session.getAttribute("user");
		int userid=user.getU_id();
		ArrayList<shopcart> list=sd.getShopCarByUserId(userid);
		
	%>
	<table border="1" width="100%" rules="none" cellspacing="0"
		cellpadding="0" align="center">
	<tr height="50">
		<td colspan="5" align="center">������Ʒ����</td>
	</tr>
	<tr align="center" height="30" bgcolor="lightgrey">
	    <td>��Ʒ��</td>
		<td>�۸�Ԫ/����</td>
		<td>����</td>
		<td>�ܼۣ�Ԫ��</td>
		<!-- <td>�Ƴ���-1/�Σ�</td> -->
	</tr>
	<%
		if (list == null || list.size() == 0) {
			/* out.print(<script language="JavaScript"> function check(){ alert("���ȹ���!" );} </script>); */
	%>
	<tr height="100">
		<td colspan="5" align="center" id="tishi"><font color="#FF0000" size="6">���Ĺ��ﳵΪ�գ�</font></td>
	</tr>
	<%
		} else {
			for (int i = 0; i < list.size(); i++) {
				shopinfos shopinfo=find.find_by_id(list.get(i).getC_shopid());
				Double total=shopinfo.getSi_price();
			//	BuyList single = (BuyList) buylist.get(i);
			//	String shopname = single.getShopname();                    //�����ƷID
			//	double price = single.getPrice();
			//	int num = single.getNum();
			//	float money = ((int) ((price * num + 0.05f) * 10)) / 10f;
			//	total += money;
	%>
	<tr align="center" height="50">
		<td ><%=shopinfo.getSi_name()%></td>
		<td><%=shopinfo.getSi_price() %></td>
		<td><%=list.get(i).getC_num() %></td>
		<td><%=shopinfo.getSi_price()%></td>
		<!--<td><a href="<%=request.getContextPath()%>/ShopDelAction">�Ƴ�</a></td> -->
		<tr height="50" align="center">
		<td colspan="5">Ӧ����<%=total%></td>
	</tr>
	</tr>
	<%
		}

		}
	%>
	
	<tr height="50" align="center">
		<!-- <td colspan="2"><a href="../ShopDelAction">��չ��ﳵ</a></td> -->
		<td colspan="3"><input type="button" value="�µ�" onclick="check()"><!-- <a href="checkout.jsp">�µ�</a> --></td>
	</tr>
	</table>
	</div>
<div id="foot">
	<hr>
	<p>����վ������ԱΪȫ�峱��Ա��</p>
	<p>����վ��Ȩ����Ϊ���������շ��ɽ���ȨΪ����</p>
	<p>��ϵ����:QQȺ639195798</p>
	<p>�������� <a href="">��è</a>
	<a href="">�Ա�</a>
	<a href="">����</a>
	<a href="">Ģ����</a></p>
</div>
</body>
</html>
<script language="JavaScript">

function check(){
	window.location.href="checkout.jsp";
	
}
function fun3(){
	window.location.href="../ShopDelAction";
}
</script>