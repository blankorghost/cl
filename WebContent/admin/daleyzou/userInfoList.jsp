<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 包含公共的JSP代码片段 -->
	
<title>会员信息管理</title>



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
			<img border="0" width="13" height="13" src="${pageContext.request.contextPath }/admin/style/images/user.gif"/> 会员列表
		</div>
    </div>
	<div id="TitleArea_End"></div>
</div>


	<!-- 过滤条件 -->
	<div id="QueryArea">
		<form action="${pageContext.request.contextPath }/userInfo?method=search" method="post">
			<input type="text" name="searchUser" title="请输入会员名" class="mytxt">
			<input type="submit" value="搜索" class="mytxt">
		</form>
	</div>
<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
    <table class="MainArea_Content" align="center" cellspacing="0" cellpadding="0">
        <!-- 表头-->
        <thead>
            <tr align="center" valign="middle" id="TableTitle">
				<td>编号</td>
				<td>用户名</td>
				<td>联系电话</td>
				<td>邮箱</td>
				<td>操作</td>
                <td>收货地址</td>
			</tr>
		</thead>	
		<!--显示数据列表 -->
        <tbody id="TableData">
		
			
        	<c:choose>
				<c:when test="${not empty requestScope.pb.pageData}">
					<c:forEach var="user" items="${requestScope.pb.pageData }" varStatus="vs">
						<tr class="TableDetail1">
							<td>${vs.count }&nbsp;</td>
							<td>${user.u_name }&nbsp;</td>
							<td>${user.ui_phone }&nbsp;</td>
							<td>${user.ui_email }&nbsp;</td>
							<td>
								<a href="${pageContext.request.contextPath }/userInfo?method=delete&u_id=${user.u_id}"  class="FunctionButton" onClick="return delConfirm();">删除</a>				
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/userInfo?method=userInfoDetail&u_id=${user.u_id}" class="mytxt">查看详细</a>&nbsp;
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>没有相关信息哦！请添加后再来查看。。。</tr>
				</c:otherwise>
			</c:choose>
			
        
        </tbody>
    </table>
	
   <!-- 其他功能超链接 -->
	<div id="TableTail" align="center">
		<div align="center">
   			当前${pb.currentPage }/${pb.totalPage }&nbsp;&nbsp;
   			<a href="${pageContext.request.contextPath }/userInfo?method=userInfoList&currentPage=1">首页</a>&nbsp;
   			<a href="${pageContext.request.contextPath }/userInfo?method=userInfoList&currentPage=${pb.currentPage-1}">上一页</a>&nbsp;
   			<a href="${pageContext.request.contextPath }/userInfo?method=userInfoList&currentPage=${pb.currentPage+1}">下一页</a>&nbsp;
   			<a href="${pageContext.request.contextPath }/userInfo?method=userInfoList&currentPage=${pb.totalPage}">尾页</a>
   		</div>
    </div> 
</div>
</body>
</html>
