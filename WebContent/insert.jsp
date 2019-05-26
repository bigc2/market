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
<title>My JSP 'check.jsp' starting page</title>
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
		request.setCharacterEncoding("utf-8"); //用指定的utf-8编码，request.getParameter时就用utf-8解码获取中文参数
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String amounts = request.getParameter("amounts");
		String prices = request.getParameter("prices");
		PreparedStatement sql = null;
		Connection conn = null;
		int total = 0; //update成功的记录条数
	%>
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/markets?characterEncoding=utf8&serverTimezone=GMT&useSSL=false";
		String use = "root";
		String password = "1234";
		Class.forName(driver);
		conn = DriverManager.getConnection(url, use, password);
		sql = conn.prepareStatement("INSERT INTO commodity(id, name, amounts, prices) VALUES(?, ?, ?, ?)");
		sql.setString(1, id);
		sql.setString(2, name);
		sql.setString(3, amounts);
		sql.setString(4, prices);
		total = sql.executeUpdate();
		sql.close();
		conn.close();
	%>
	<!-- 判断是否是成功插入 -->
	<%
		if (total >= 1) {
	%>
	<jsp:forward page="CommodityListForSeller.jsp" />
	<%
		} else if (total == 0) {
			System.out.println("添加失败！");
		}
	%>
</body>
</html>