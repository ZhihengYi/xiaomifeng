<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<link rel="icon" href="pic/32.png" sizes="32x32"/>
<jsp:useBean id="userBean" class="save.data.Register" scope="request"/>
<jsp:useBean id="loginBean" class="save.data.Login" scope="session"/>
<head><%@ include file="head.txt" %></head>
<title>注册页面</title>
<style>
	#c{font-family:华文楷体;font-size:30;color:black;}
</style>
<html>
<body id=ok bgcolor="#BBECDA">
<div align="center">
<form action="registerServlet" method="post">
<table id=c>
<p id=c>用户名由字母、数字、下划线构成，*注释的项必须填写。</p>
   <tr><td>*用户名称:</td>		<td><input type=text 		id=c	name="logname"/>			</td>
       <td>*用户密码:</td>		<td><input type=password 	id=c	name="password">			</td></tr>
   <tr><td>*重复密码:</td>		<td><input type=password 	id=c	name="again_password">		</td>
       <td>联系电话:</td>		<td><input type=text 		id=c	name="phone"/>				</td></tr>
   <tr><td>邮寄地址:</td>		<td><input type=text 		id=c	name="address"/>			</td>
       <td>真实姓名:</td>		<td><input type=text 		id=c	name="realname"/>			</td>
       						<td><input type=submit  	id=c	value="提交">					</td></tr>
</table>
</form>
<p id=c>注册反馈：</p>
<jsp:getProperty name="userBean"  property="backNews" />
<table id=c border=3>
     <tr><td>ID:</td>		<td><jsp:getProperty name="userBean" property="logname"/>	</td></tr>
     <tr><td>姓名:</td>		<td><jsp:getProperty name="userBean" property="realname"/>	</td></tr>
     <tr><td>地址:</td>		<td><jsp:getProperty name="userBean" property="address"/>	</td></tr>
     <tr><td>电话:</td>		<td><jsp:getProperty name="userBean" property="phone"/>		</td></tr>
</table>
</div ></body></html>

