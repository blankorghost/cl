<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/cl/bootstrap/bootstrap.min.css" type="text/css"/>
<style type="text/css">
body{
background-color: #828282;
}
#menu  
    {  
        width:225px;  
        height:320px;  
        background-color:RGB(216,216,216);  
        padding:0px;  
        margin:0px;  
    }  
#menu ul  
    {  
        width:225px;  
        list-style-type:none;  
        padding:0px;  
        margin:0px;  
    }  
#menu ul li  
    {  
        width:225px; 
    }  
#menu ul li a  
    {  
        display:block;            /*先转化成块级元素*/  
        color:Gray;  
        text-align:left;  
        text-decoration:none;  
        padding:10px 0px 10px 30px;    /*设置距离左侧的边栏和上边距*/  
        font-size:14px;  
    }  
#menu ul li a:hover  
    {   
        text-align:left;  
        text-decoration:none;  
        padding:10px 0px 10px 30px;  
        font-size:14px;  
    }  
    /*设置子菜单的样式*/  
#menu ul li ul  
    {  
        list-style-type:none;   
    }  
#menu ul li ul li  
    {  
        width:225px; 
    }  
#menu ul li ul li a  
    {  
        display:block;  
        padding:6px 0px 6px 60px;  
        text-align:left;  
        text-decoration:none;  
        font-size:12px;  
    }  
#menu ul li ul li a:hover  
    {  
        padding:6px 0px 6px 60px;  
        text-align:left;  
        text-decoration:none;  
        font-size:12px;  
        color:black;  
        background-color:#CD2626;  
    } 
</style>
</head>
<body onload="loadFun()">  
    <form id="form1" runat="server">  
<div id="menu">  
    <ul>  
        <li><a href="#" onclick="Show('shop')">商品管理</a>  
                <ul id="shop">  
                    <li><a target="right" href="../showall_action">查看所有商品</a></li>  
                    <li><a target="right" href="add.jsp">添加商品</a></li>  
                </ul>  
        </li>  
       <li><a href="#" onclick="Show('user')">信息管理</a>  
            <ul id="user">  
                <li><a target="right" href="${pageContext.request.contextPath }/userInfo?method=userInfoList">管理会员信息</a></li>
                <li><a target="right" href="${pageContext.request.contextPath }/admin/daleyzou/administrator.jsp">更改管理员信息</a></li> 
            </ul>  
        </li>  
        <li><a href="#" onclick="Show('order')">订单管理</a>  
            <ul id="order">  
                <li><a target="right" href="${pageContext.request.contextPath }/order?method=orderList">显示订单列表</a></li>   
            </ul>  
        </li>  
        <li><a href="#" onclick="Show('speak')">评论管理</a>  
            <ul id="speak">  
            	<li><a target="right" href="reply/reply.jsp">评论管理</a></li>  
            </ul>  
        </li> 
        <li><a href="#" onclick="Show('info')">公告管理</a>  
            <ul id="info">  
            	<li><a target="right" href="announcement/announcement.jsp">公告列表</a></li>
                <li><a target="right" href="announcement/announce_add.jsp">发布公告</a></li>  
            </ul>  
        </li>   
    </ul>  
</div>  
    </form>  
    <script>
function loadFun() {  
       //获取<ul></ul>的所有子节点<li>节点  
       var array = document.getElementsByTagName("ul").item(0).childNodes;  
       //遍历子节点  
       for (var i = 0; i < array.length; i++) {  
           //获取<li></li>标签的子节点  
           var childnodes = array[i].childNodes;  
           for (var j = 0; j < childnodes.length; j++) {  
               //如果碰到主菜单中的<ul>标签就隐藏该子菜单的下拉菜单  
               if (childnodes[j].tagName == "UL") {  
                   childnodes[j].style.display = "none";  
               }  
           }  
       }  
   }  
    var arrays = new Array("shop","user","order","info","speak");  
    function Show(tagId) {  
        for (var i = 0; i < arrays.length; i++) {  
            if (arrays[i] == tagId) {  
                //设置新的背景颜色  
                document.getElementById(arrays[i]).parentNode.style.backgroundColor = "RGB(237,237,237)";  
                document.getElementById(arrays[i]).style.display = "block";  
            }  
            else {  
                //将背景颜色还原  
                document.getElementById(arrays[i]).parentNode.style.backgroundColor = "RGB(216,216,216)";  
                document.getElementById(arrays[i]).style.display = "none";  
            }  
        }  
    } 
    </script>
</body>
</html>