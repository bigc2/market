<%@ page language="java" import="java.sql.*"
	contentType="text/html;charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>updateForSeller</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id2 = request.getParameter("id2");
		String name2 = request.getParameter("name2");
		String amounts2 = request.getParameter("amounts2");
		String prices2 = request.getParameter("prices2");
		boolean flag = false;
		PreparedStatement sql = null;
		ResultSet rs = null;
		Connection conn = null;
		String text = "hello";
		response.getWriter().write(text);
		response.getWriter().close();
	%>
	<%	
 		String driver = "com.mysql.jdbc.Driver"; 
		String url = "jdbc:mysql://localhost/markets?characterEncoding=utf8&serverTimezone=GMT&useSSL=false"; 
 		String use = "root"; 
		String password = "1234"; 
 		Class.forName(driver); 
		conn = DriverManager.getConnection(url, use, password); 
 		sql = conn.prepareStatement("UPDATE commodity SET name=?, amounts=?, prices=? WHERE id=?"); 
 		sql.setString(1, name2); 
 		sql.setString(2, amounts2);
 		sql.setString(3, prices2);
 		sql.setString(4, id2);
 		sql.executeUpdate(); 
		sql.close(); 
 		conn.close(); 
 	%>
</body>
</html>