<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<link rel="icon" href="pic/32.png" sizes="32x32"/>
<jsp:useBean id="loginBean" class="save.data.Login" scope="session"/>
<head><%@ include file="head.txt" %></head>
<title>登录页面</title>
<style>
   #d{font-family:华文楷体;font-size:30;color:black;text-align:center;}
   #d2{font-family:华文楷体;font-size:30;color:black;}
</style>
<html>
<body id=d bgcolor="#BBECDA">
<div align="center">

<form action="loginServlet" method="post">
<table id=d border=1>
		<tr><th>登录</th></tr>
		<tr><td>登录名称:	<input type=text 		id=d2	name="logname">	</td></tr>
		<tr><td>输入密码:	<input type=password 	id=d2 	name="password"></td></tr>
		<tr><td><input type=submit 	id=d value="确定">	</td></tr>	
</table></form>

<table id=d border=1>
		<tr><td>登录反馈:<jsp:getProperty 	name="loginBean" property="backNews"/></td></tr>
		<tr><td>用户ID:<jsp:getProperty	name="loginBean" property="logname"/></td></tr>
</table>
—————————————————————————————————————————————
<a href="inputRegisterMess.jsp">点击注册</a>
<a href="delete.jsp">点击注销</a>
</div></body></html>
