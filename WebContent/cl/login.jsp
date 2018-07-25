<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>会员登录</title>
	<link rel="stylesheet" href="/cl/css/cl.css">
	<link rel="stylesheet" href="/cl/css/login.css">
	<link rel="stylesheet" href="/cl/bootstrap/bootstrap.min.css">
	<script src="/cl/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript">
    
         window.onload = function(){
             var oTab = document.getElementById("login-text");
             var oUl = oTab.getElementsByTagName("ul")[0];
             var oLis = oUl.getElementsByTagName("li");
             var oDivs= oTab.getElementsByTagName("div");

             for(var i= 0,len = oLis.length;i<len;i++){
                 oLis[i].index = i;
                 oLis[i].onclick = function() {
                     for(var n= 0;n<len;n++){
                         oLis[n].className = "";
                         oDivs[n].className = "hide";
                     }
                     this.className = "on";
                     oDivs[this.index].className = "";
                 }
             };
         }
    </script>
</head>
<body background="">
	<div class="container">
		<div id="login-top">
			<a href="/cl/index.jsp">
				<div class="logo-img">
					<br>
					<span class="logo-span">C</span>
					<span class="logo-span">L</span>
					<br>
					<span class="logo-span-1">潮流</span>
				</div>
			</a>
			<div id="logozi" style="visibility: visible;">
         		<p><span>潮流 有你想要</span></p>
        	</div>
		</div>
		<div>
        	<hr>
        </div>
		<div id="login-main">
			<div id="login-text">
			    <ul>
			        <li class="on">会员登录</li>
			        <li>管理员登录</li>
			    </ul>
			    <div>
					<form name="frm" action="<%=request.getContextPath()%>/userLoginAction" method="post" >
						<input id="username" type="text" placeholder="用户名"  name="username">
						<br>
						<br>
						<input id="password" type="password" placeholder="密码"  name="password">
						<br>
						<br>
						<button  class="btn" style="float: left" type="submit">登录</button>
					</form>
					<form action="regist.jsp" method="post">
						<button class="btn" style="margin-left: 125px;">注册</button>
					</form>
				</div>
			    <div class="hide">
			        <form  name="frm1" action="<%=request.getContextPath()%>/adminLoginAction" method="post" >
						<input id="username" type="text" placeholder="管理员"  name="username">
						<br>
						<br>
						<input  id="password" type="password" placeholder="密码"  name="password">
						<br>
						<br>
						<button  class="btn" style="margin-left: 100px;" onclick="check1();">登录</button>
					</form>
			    </div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function check1(){
		if(frm1.username.value==""||frm1.password.value==""){
			alert("不能为空!");
		}else{
			frm1.submit();
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