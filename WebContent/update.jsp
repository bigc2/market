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
		request.setCharacterEncoding("utf-8");
		String para = request.getParameter("para");
		String productNumber = request.getParameter("productNumber");
		boolean flag = false;
		PreparedStatement sql = null;
		ResultSet rs = null;
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
		sql = conn.prepareStatement("UPDATE commodity SET amounts=amounts-? WHERE id = ?");
		sql.setString(1, para);
		sql.setString(2, productNumber);
		total = sql.executeUpdate();
		sql.close();
		conn.close();
	%>
	<!-- 判断是否是正确的登录用户 -->
	<%
		if (total >= 1) {
	%>
	<jsp:forward page="CommodityList.jsp" />
	<%
		} else if (total == 0) {
			System.out.println("购买失败！");
		}
	%>
</body>
</html>