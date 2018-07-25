<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>潮流后台管理</title>
</head>
	<frameset rows="100px,*,19px" framespacing="0" border="0" frameborder="0">
		<frame src="/cl/admin/top.jsp" scrolling="no" noresize /> 
		<frameset cols="226px,*">
			<frame noresize src="/cl/admin/left.jsp" scrolling="yes" /> 
			<frame noresize name="right" src="/cl/admin/right.jsp" scrolling="yes"/> 
		</frameset>
		<frame noresize name="status_bar" scrolling="no" src="/cl/admin/bottom.jsp" />
	</frameset>
</html>