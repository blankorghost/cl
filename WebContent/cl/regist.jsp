<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>用户注册</title>
	<link rel="stylesheet" href="/cl/css/cl.css">
	<link rel="stylesheet" href="/cl/css/regist.css">
	<link rel="stylesheet" href="/cl/css/login.css">
</head>
<body>
	<div class="container">
		<div id="logo" style="height: auto">
		<a href="/cl/index.jsp">
			<div class="logo-img">
				<br>
				<span class="logo-span">C</span>
				<span class="logo-span">L</span>
				<br>
				<span class="logo-span-1">潮流</span>
			</div>
		</a>
		<div id="logozi" 
			style="visibility: visible;">
         	<p><span>用户注册</span></p>
        </div>
		</div>
		<hr>
		<form name="frm" action="../regist_action" method="post">
			<div id="regist-input">
				<input type="text" name="username" placeholder="用户名">
				<br>
				<input type="password" name="password"
				 placeholder="密码">
				<br>
				<input type="password" name="repass" placeholder="重复密码">
				<br>
				<input type="text" name="email" placeholder="邮箱">
				<br>
				<input type="text" name="phone" placeholder="联系号码">
				<br>
				<textarea name="adress" id="" cols="28" rows="5" placeholder="默认收货地址"
				style="font-size: 20px;"></textarea>
				<br>
				<div id="btn">
					<button type="reset" style="float: left; margin-left: 100px">重置</button>
					<button type="submit" onclick="check()">提交</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	function check(){
		if(frm.username.value==""||frm.password.value==""||frm.repass.value==""||frm.email.value==""||frm.phone.value==""||frm.adress.value==""){
			alert("不能为空!");
		}else{
			focus.submit();
		}
	}
	</script>
<div id="foot">
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