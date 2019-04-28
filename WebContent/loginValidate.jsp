<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8"></fmt:requestEncoding>
 
 
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证页面</title>
 
 
<%
 
//获取登录时提交的用户名密码,web
String id = request.getParameter("username1");
String pwd = request.getParameter("password1");
request.setAttribute("username1",id);
/* 解决问题，先要研究问题，URL传中文参数为什么会出现乱码？
 
原因：Http请求传输时将url以ISO-8859-1编码，服务器收到字节流后默认会以ISO-8859-1编码来解码成字符流（造成中文乱码）
 
解决办法：我们需要把request.getParameter(“参数名”)获取到的字符串先用ISO-8859-1编码成字节流，然后再将其用utf-8解码成字符流 */
 
String driver = "com.mysql.jdbc.Driver";
 
//URL指向要访问的数据库名javaweb
 
String url = "jdbc:mysql://localhost:3306/javaweb?characterEncoding=utf8&serverTimezone=GMT&useSSL=false";
 
//MySQL配置时的用户名
 
String user = "root";
 
//Java连接MySQL配置时的密码
 
String password = "1234";
 
try {
 
//1 加载驱动程序
 
    Class.forName(driver);
 
//2 连接数据库
 
    Connection conn = DriverManager.getConnection(url, user, password);
 
//3 用来执行SQL语句
 
    Statement statement = conn.createStatement();
 
//要执行的SQL语句
 
    String sql = "select * from login";
 
    ResultSet rs = statement.executeQuery(sql);
    String u = null;
    String p = null;
    while(rs.next()) {
        u = rs.getString("userName");
        p = rs.getString("passWord");
        if(u.equals(id) && p.equals(pwd)) {
            String CommodityList="CommodityList.jsp?username1="+URLEncoder.encode(id,"utf-8");
            out.println("登陆成功！5s后跳转跳转到<a href="+CommodityList+">首页</a>");
            response.addHeader ("refresh", "5;URL=CommodityList.jsp?username1="+URLEncoder.encode(id,"utf-8"));
            //response.sendRedirect("index.jsp?username1="+URLEncoder.encode(id,"utf-8"));
            rs.close();
            conn.close();
            return;
        }
    }
    rs.close();
    conn.close();
    out.println("用户名或密码错误！");
}  catch (ClassNotFoundException e) {
    System.out.println("Sorry,can`t find the Driver!");
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
} catch (Exception e) {
    e.printStackTrace();
}
%>
<form>
<input type="hidden" name="username1" value="${param.username1}">
<input type="button" value="重新登陆" onclick="this.form.action='login.jsp';this.form.submit();">
</form>