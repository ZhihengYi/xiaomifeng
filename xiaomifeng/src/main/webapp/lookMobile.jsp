<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<link rel="icon" href="pic/32.png" sizes="32x32"/>
<head><%@ include file="head.txt" %></head>
<title>浏览手机页面</title>
<style>
   #e{font-family:华文楷体;font-size:26;color:black;}
</style>
<html>
<body id=e bgcolor="#BBECDA">
<div align="center">
选择某类手机,分页显示这类手机。
<% Connection con=null; 
   Statement sql;
   ResultSet rs;
   Context context = new InitialContext();
   Context contextNeeded=(Context)context.lookup("java:comp/env");
   DataSource ds=(DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
   try {
      con= ds.getConnection();//使用连接池中的连接。
      sql=con.createStatement();
      //读取mobileClassify表，获得分类：  
      rs=sql.executeQuery("SELECT * FROM mobileClassify");
      out.print("<form action='queryServlet' id=e method ='post'>") ;
      out.print("<select id=e name='fenleiNumber'>") ;
      while(rs.next()){
         int id = rs.getInt(1);
         String mobileCategory = rs.getString(2);
         out.print("<option value ="+id+">"+mobileCategory+"</option>");
      }  
      out.print("</select>");
      out.print("<input type ='submit' id=e value ='提交'>");  
      out.print("</form>");
      rs.close();
      con.close();//连接返回连接池。
   }
   catch(SQLException e){ 
      out.print(e);
   }
   finally{
     try{
        con.close();
     }
     catch(Exception ee){}
   } 
%>
</div></body></html>
