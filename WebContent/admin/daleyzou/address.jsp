<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>用户地址详细信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/style/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/style/js/page_common.js"></script>
<link href="${pageContext.request.contextPath }/admin/style/css/common_style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/style/css/index_1.css" />

</head>
	
	<table align="center">
	<tr>
		<td><textarea name="introduce" class="TextareaStyle">${requestScope.userInfo.ui_address }</textarea></td>
	</tr>
	<tr>
		<td><a href="javascript:history.go(-1);" class="FunctionButton">返回</a></td>
	</tr>
	</table>
<body>
</body>
</html>
