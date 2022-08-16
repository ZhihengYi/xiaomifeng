<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<%@ page import="save.data.Login" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.*" %>
<link rel="icon" href="pic/32.png" sizes="32x32"/>
<jsp:useBean id="loginBean" class="save.data.Login" scope="session"/>
<head><%@ include file="head.txt" %></head>
<title>商品详情</title>
<style>
   #h{font-family:华文楷体;font-size:26;color:black}
</style>
<html>
<body bgcolor="#BBECDA" id=h>
<div align="center">
<%  try{ 
         loginBean = (Login)session.getAttribute("loginBean");
         if(loginBean==null){
           response.sendRedirect("login.jsp");//重定向到登录页面.
           return;
         }
         else {
           boolean b =loginBean.getLogname()==null||
                   loginBean.getLogname().length()==0;
           if(b){
              response.sendRedirect("login.jsp");//重定向到登录页面。
              return;
           }
         }
      }
      catch(Exception exp){
           response.sendRedirect("login.jsp");//重定向到登录页面。
           return;
      }
   String mobileID = request.getParameter("mobileID"); 
   if(mobileID==null) {
       out.print("没有产品号，无法查看细节");
       return;
   } 
   Context context = new InitialContext();
   Context contextNeeded = (Context)context.lookup("java:comp/env");
   DataSource ds = (DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
   Connection con = null;
   Statement sql; 
   ResultSet rs;
   try{ 
     con= ds.getConnection();//使用连接池中的连接。
     sql=con.createStatement();
     String query="SELECT * FROM mobileForm where mobile_version = '"+mobileID+"'";
     rs=sql.executeQuery(query);
     out.print("<table id=h border=2>");
     out.print("<tr>");
     out.print("<th>产品号");
     out.print("<th>名称");
     out.print("<th>制造商");
     out.print("<th>价格");
     out.print("<th>放入购物车<th>");
     out.print("</tr>");
     String picture="pic/bg1.jpg";
     String detailMess="";
     while(rs.next()){
       mobileID=rs.getString(1);
       String name=rs.getString(2);
       String maker=rs.getString(3);
       String price=rs.getString(4);
       detailMess=rs.getString(5);
       picture=rs.getString(6); 
       out.print("<tr>");
       out.print("<td>"+mobileID+"</td>");
       out.print("<td>"+name+"</td>");
       out.print("<td>"+maker+"</td>");
       out.print("<td>"+price+"</td>");
       String shopping =
       "<a href ='putGoodsServlet?mobileID="+mobileID+"'>添加到购物车</a>";
       out.print("<td>"+shopping+"</td>"); 
       out.print("</tr>");
     } 
     out.print("</table>");
     out.print("产品详情:<br>");
     out.println("<div align=center>"+detailMess+"<div>");
     String pic ="<img src='pic/"+picture+"' width=260 height=200 ></img>";
     out.print(pic); //产片图片
     con.close(); //连接返回连接池。                
  }
  catch(SQLException exp){}
  finally{
     try{
          con.close();
     }
     catch(Exception ee){}
  } 
%>
</div></body></html>
