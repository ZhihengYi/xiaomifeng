<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<link rel="icon" href="pic/32.png" sizes="32x32"/>
<jsp:useBean id="userBean" class="save.data.Register" scope="request"/>
<head><%@ include file="head.txt" %></head>
<title>注销用户</title>
<style>
	#c{font-family:华文楷体;font-size:30;color:black;text-align:center;}
	#c2{font-family:华文楷体;font-size:30;color:black;}
</style>
<html>
<body id=ok bgcolor="#BBECDA">

<div align="center">

<form action="deleteServlet2" method="post">
<table id=c border=1>
		<tr><th>注销用户</th></tr>
		<tr><td>用户名称:	<input type=text id=c2	name="logname">	</td></tr>
		<tr><td><input type=submit 	id=c value="确定">	</td></tr>	
</table></form>

</div ></body></html>