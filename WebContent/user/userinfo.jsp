<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人中心</title>
</head>
	<frameset rows="50px,*," framespacing="0" border="0" frameborder="0">
		<frame src="top.jsp" scrolling="no" noresize /> 
		<frameset cols="225px,*">
			<frame noresize src="left.jsp" scrolling="yes" /> 
			<frame noresize name="right" src="${pageContext.request.contextPath }/order?method=customOrderDetail&u_id=${sessionScope.user.u_id }" scrolling="yes"/> 
		</frameset>
	</frameset>
</html>