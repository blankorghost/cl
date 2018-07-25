<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <!-- 包含公共的JSP代码片段 -->
	
<title>订单信息</title>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/style/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/style/js/page_common.js"></script>
<link href="${pageContext.request.contextPath }/admin/style/css/common_style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/style/css/index_1.css" />
</head>
<body>

<!-- 页面标题 -->
<div id="TitleArea">
	<div id="TitleArea_Head"></div>
	<div id="TitleArea_Title">
		<div id="TitleArea_Title_Content">
			
				
					<img border="0" width="13" height="13" src="${pageContext.request.contextPath }/admin/style/images/title_arrow.gif"/> 查看订单详情
				
				
			
		</div>
    </div>
	<div id="TitleArea_End"></div>
</div>

<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
	<!-- 表单内容 -->
	<form action="#" method="post" enctype="multipart/form-data">
		<!-- 本段标题（分段标题） -->
		<div class="ItemBlock_Title">
        	<img width="4" height="7" border="0" src="${pageContext.request.contextPath }/admin/style/images/item_point.gif"> 订单详情&nbsp;
        </div>
		<!-- 本段表单字段 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
				<div class="ItemBlock2">
					<table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
							<td width="80px">商品详情</td>
							<td>
								
									<img style='max-width:68px;width:68px;width:expression(width>68?"68px":width "px");max-width: 68px;' 
									src="${pageContext.request.contextPath }/${requestScope.shop.si_photo}">
									<input type="hidden" name="image" value="baizhuoxia.jpg">
								
								<input type="text" value="${requestScope.shop.si_name}" style="width:225px;"/> *
							</td>
						</tr>
						<tr>
							<td width="80px">商品数量</td>
							<td><input type="text" name="foodName" class="InputStyle" value="${requestScope.order.o_nums}"/> *</td>
						</tr>
						<tr>
							<td>下单人</td>
							<td><input type="text" name="foodName" class="InputStyle" value="${requestScope.order.u_name}"/> *</td>
						</tr>
						<tr>
							<td>下单时间</td>
							<td><input type="text" name="foodName" class="InputStyle" value="${requestScope.order.o_time}"/> *</td>
						</tr>
						<tr>
							<td>订单编号</td>
							<td><input type="text" name="foodName" class="InputStyle" value="${requestScope.order.o_id}"/> *</td>
						</tr>
						<tr>
							<td>收件人</td>
							<td><input type="text" name="foodName" class="InputStyle" value="${requestScope.order.o_name}"/> *</td>
						</tr>
						<tr>
							<td>电话</td>
							<td><input type="text" name="foodName" class="InputStyle" value="${requestScope.order.o_phone}"/> *</td>
						</tr>
						<tr>
							<td>邮编</td>
							<td><input type="text" name="price" class="InputStyle" value="${requestScope.order.o_youbian}"/> *</td>
						</tr>
                        <tr>
							<td>备注</td>
							<td><textarea name="introduce" class="TextareaStyle1">${requestScope.order.o_memo}</textarea></td>
						</tr>
						
						<tr>
							<td>收货地址</td>
							<td><textarea name="introduce" class="TextareaStyle1">${requestScope.order.o_adress}</textarea></td>
						</tr>
					</table>
				</div>
            </div>
        </div>
		
		
		<!-- 表单操作 -->
		<div id="InputDetailBar">
            <a href="javascript:history.go(-1);" class="FunctionButton">返回</a>
        </div>
	</form>
</div>
</body>
</html>
