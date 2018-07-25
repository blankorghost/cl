<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员信息修改</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/style/css/style.css">

</head>
<body>
<br>
<!-- 代码 开始 -->
<div class="form-div">
    <form  action="${pageContext.request.contextPath }/userInfo?method=administrator" method="post">

        <table>
            <tr>
                <td>用户名</td>
                <td><input name="uid" type="text" id="uid" readonly="readonly" value="${sessionScope.admin.name }" easytip="disappear:lost-focus;theme:blue;">
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input name="psw1" type="password" easytip="disappear:lost-focus;theme:blue;"></td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td><input name="psw2" type="password"  easytip="disappear:lost-focus;theme:blue;"></td>
            </tr>
            <tr><p style="color: red;">${message }</p></tr>
                      
        </table>

		<div class="buttons">
			<input value="修 改" type="submit" style="margin-right:20px; margin-top:20px;">
        </div>
		
       
    </form>
</div>


</body>
</html>
