<%@ page import="java.io.*,java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<!-- 连接数据库 -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/markets?characterEncoding=utf8&serverTimezone=GMT&useSSL=false"
		user="root" password="1234" />
<title>修改数据</title>
</head>
<body>
	<!-- 接收CommodityList.jsp传来的参数value -->
	
	<%
		String para = request.getParameter("value");
	%>
	<script type="text/javascript">
		
	</script>
	<!-- 修改表中单元格数据 -->
	<c:set var="SiteId" value="3" />
	<sql:update dataSource="${db}" var="count">
  		UPDATE commodity SET amounts = 30 WHERE id = ?;
  	<sql:param value="${SiteId}" />
	</sql:update>
	<!-- 遍历表 -->
	<sql:query dataSource="${db}" var="rs">
		SELECT * from commodity;
	</sql:query>
	<table>
		<c:forEach var="row" items="${rs.rows}">
			<tr>
				<td><c:out value="${row.id}" /></td>
				<td><c:out value="${row.name}" /></td>
				<td><c:out value="${row.amounts}" /></td>
				<td><c:out value="${row.prices}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
