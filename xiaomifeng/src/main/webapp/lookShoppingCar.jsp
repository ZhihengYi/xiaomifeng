<%@ page import="save.data.Login" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<link rel="icon" href="pic/32.png" sizes="32x32"/>
<jsp:useBean id="loginBean" class="save.data.Login" scope="session"/>
<head><%@ include file="head.txt" %></head>
<title>查看购物车</title>
<style>
   #j{font-family:华文楷体;font-size:26;color:black}
</style>
<html><body bgcolor="#BBECDA" id=j>
<div align="center">
<%  if(loginBean==null){
        response.sendRedirect("login.jsp");//重定向到登录页面。
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
    Context  context = new InitialContext();
    Context  contextNeeded = (Context)context.lookup("java:comp/env");
    DataSource  ds = (DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
    Connection con =null;
    Statement sql; 
    ResultSet rs;
    out.print("<table border=1>");
    out.print("<tr>");
    out.print("<th id=j width=160>"+"手机标识(id)");
    out.print("<th id=j width=160>"+"手机名称");
    out.print("<th id=j width=160>"+"手机价格");
    out.print("<th id=j width=160>"+"购买数量");
    out.print("<th id=j width=160>"+"修改数量");
    out.print("<th id=j width=160>"+"删除商品");
    out.print("</tr>"); 
    try{
       con = ds.getConnection();//使用连接池中的连接。
       sql=con.createStatement(); 
       String SQL = 
      "SELECT goodsId,goodsName,goodsPrice,goodsAmount FROM shoppingForm"+
      " where logname ='"+loginBean.getLogname()+"'";
       rs=sql.executeQuery(SQL);//查shoppingForm表。
       String goodsId="";
       String name="";
       float price=0;
       int amount=0;
       String orderForm =null; //订单。
       while(rs.next()) {
          goodsId = rs.getString(1);
          name = rs.getString(2);
          price =rs.getFloat(3);
          amount =rs.getInt(4);
          out.print("<tr>");
          out.print("<td id=j>"+goodsId+"</td>"); 
          out.print("<td id=j>"+name+"</td>");
          out.print("<td id=j>"+price+"</td>");
          out.print("<td id=j>"+amount+"</td>");
          String update="<form  action='updateServlet' method = 'post'>"+
                     "<input type ='text'id=j name='update' size =3 value= "+amount+" />"+
                      "<input type ='hidden' name='goodsId' value= "+goodsId+" />"+
                     "<input type ='submit' id=j value='更新数量'  ></form>";
          String del="<form  action='deleteServlet' method = 'post'>"+
                     "<input type ='hidden' name='goodsId' value= "+goodsId+" />"+
                     "<input type ='submit' id=j value='删除该商品' /></form>";
          out.print("<td id=j>"+update+"</td>");
          out.print("<td id=j>"+del+"</td>");
          out.print("</tr>") ;
       }
       out.print("</table>");
       orderForm = "<form action='buyServlet' method='post'>"+
       "<input type ='hidden' name='logname' value= '"+loginBean.getLogname()+"'/>"+"<br>"+
       "<input type ='submit' id=j value='生成订单(同时清空购物车)'></form>";
       out.print(orderForm);
       con.close() ;//把连接返回连接池。
    }
    catch(SQLException e) { 
       out.print("<h1>"+e+"</h1>");
    }
    finally{
       try{
          con.close();
       }
       catch(Exception ee){}
    }
%>
</div></body></html>