<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>用户订单显示</title>
	<link rel="stylesheet" href="shopcar.css">
	<link rel="stylesheet" href="/cl/css/userinfo.css">
	<link rel="stylesheet" href="/cl/bootstrap/bootstrap.min.css">
	<script src="/cl/bootstrap/bootstrap.min.js"></script>
	<style>
		#shop{
			border: 1px solid #eee;
			height: 60px;
			text-align: center;
		}
		#shop img{
			width: 80px;
			height: 80px;
		}
		#shop td{
			border: 1px solid #eee;
			width: auto;
		}
		#shop-title{
			text-align: center;
		}
		#shop-title{
			border: 1px solid #eee;
			height: 50px;
		}
		#shop-title td{
			height: 50px;
		}
		#del input{
			width:65px;
			height:30px;
		}
		.tit{
    	font-size: 30px;
    	margin-top: -5px;
    	background: #D8D8D8;
    	color: #555555;
    }
</style>
	</style>
</head>
<body>
	<div id="order" style="margin-top:5px;">
		<p class="tit">所有订单</p>
			<table>
				<tr id="shop-title">
					<td class="col-md-1">订单编号</td>
					<td class="col-md-2">商品</td>
					<td class="col-md-1">价格</td>
					<td class="col-md-1">数量</td>
					<td class="col-md-1">时间</td>
					<td class="col-md-1">收货人</td>
					<td class="col-md-1">收货地址</td>
					<td class="col-md-1">联系电话</td>
					<td class="col-md-1">邮编</td>
					<td class="col-md-1">订单状态</td>
					<td class="col-md-1">操作</td>
				</tr>
				<c:choose>
				<c:when test="${not empty requestScope.orderList}">
					<c:forEach var="o" items="${requestScope.orderList }">
						<tr id="shop">
							<td id="o_id">${o.o_id }</td>
							<td id="0_shopname" style="min-width: 250px"><img src="${pageContext.request.contextPath }/${o.si_photo }" alt="" id="shop-img" style="float: left;">
							<span id="shopname" style="float: left; margin-top: 50px">${o.u_name }</span></td>
							<td id="shopprice">${o.o_shopprice }</td>
							<td id="nums">${o.o_nums }</td>
							<td id="time">${o.o_time }</td>
							<td id="name">${o.o_name }</td>
							<td id="adress">${o.o_adress }</td>
							<td id="phone">${o.o_phone }</td>
							<td id="youbian">${o.o_youbian }</td>
							<td id="payway">
								<c:if test="${o.o_status==0 }">
									<a href="${pageContext.request.contextPath }/order?method=deliver1&o_id=${o.o_id}&nowStatus=${o.o_status }&u_id=${requestScope.userId }">付款</a>
								</c:if>	
								<c:if test="${o.o_status==1 }">
									<input type="button" value="待发货"/>		
								</c:if>
								<c:if test="${o.o_status==2 }">
									<a href="${pageContext.request.contextPath }/order?method=deliver1&o_id=${o.o_id}&nowStatus=${o.o_status }&u_id=${requestScope.userId }">确认收货</a>
								</c:if>
								<c:if test="${o.o_status==3 }">
									<input type="button" value="待评价"/>	
								</c:if>
								<c:if test="${o.o_status==4 }">
									<input type="button" value="已评价"/>	
								</c:if>	
							</td>
							<td id="del" style="min-width: 200px">
								<a href="${pageContext.request.contextPath }/order?method=delete1&o_id=${o.o_id}&u_id=${requestScope.userId }"><input type="button" value="删除" style="float:left"></a>
								<c:if test="${o.o_status==3 }">
									<a href="/cl/user/reply_add.jsp?shopid=${o.o_shopid }&orderid=${o.o_id}"><input type="button" value="评价" style="margin-left:15px"></a>	
								</c:if>
								<c:if test="${o.o_status!=3 }">
									<input type="button" value="结束" style="margin-left:15px">	
								</c:if>
							<td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>没有你的订单啊！快去买买买吧！</tr>
				</c:otherwise>
			</c:choose>
			</table>
	</div>
</body>
</html>