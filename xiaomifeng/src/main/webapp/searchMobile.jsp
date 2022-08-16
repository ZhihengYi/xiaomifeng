<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<link rel="icon" href="pic/32.png" sizes="32x32"/>
<head><%@ include file="head.txt" %></head>
<title>查询页面</title>
<style>
   #g{font-family:华文楷体;font-size:26;color:black;}
</style>
<html>
<body bgcolor="#BBECDA" id=g>
<div align="center">
<p id=g>
查询时可以输入手机的版本号或手机名称及价格，手机名称支持模糊查询。<br>
输入价格是在2个值之间的价格，格式是：价格1-价格2。例如：897.98-10000。
</p>
<form action="searchByConditionServlet" id=g method="post" >
   <br>输入查询信息:<input type=text 		id=g name="searchMess"><br>
   <input type =radio name="radio" 		id=g value="mobile_version"/>手机版本号
   <input type =radio name="radio" 		id=g value="mobile_name" >手机名称
   <input type =radio name="radio" 	value="mobile_price" checked="ok">手机价格<br>
   <input type=submit id =g value="提交">
</form>
</div></body></html>
