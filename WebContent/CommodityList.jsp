<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.bzu.dao.CommodityDAO,cn.edu.bzu.entity.Commodity"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
img {
	width: 100px;
	height: 100px;
}
</style>

<title>Commodity</title>
</head>

<body>
	<script type="text/javascript">
	function change() {
		var amounts;
		amounts = prompt("请选择你购买的数量：");
	};
	</script>
	<table border="1" align="center">
		<tr>
			<td align="center">id</td>
			<td align="center">name</td>
			<td align="center">amounts</td>
			<td align="center">prices</td>
		</tr>
		<%
			CommodityDAO dao = new CommodityDAO();

			List<Commodity> list = dao.readFirstTitle();
			for (Commodity tl : list) {
		%>
		<tr>
			<td><%=tl.getId()%></td>
			<td><%=tl.getName()%></td>
			<td><%=tl.getAmounts()%></td>
			<td><%=tl.getPrices()%></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td><a href="#" onclick="change()"><img
				src="https://tse1-mm.cn.bing.net/th?id=OIP.MeRU1-et9q_QheGz3ZsfEwHaF_&w=240&h=186&c=7&o=5&dpr=1.5&pid=1.7" />
				</a>
			</td>
			<td><a href="#" onclick="change()"><img
				src="https://tse1-mm.cn.bing.net/th?id=OIP.ruj2_9prmxeWIpvtoNYLXgHaHa&w=218&h=218&c=7&o=5&dpr=1.5&pid=1.7" />
				</a>
			</td>
			<td><a href="#" onclick="change()"><img
				src="https://tse2-mm.cn.bing.net/th?id=OIP.FkzwNaY-eHQWlVZMbFm0MAHaE7&w=292&h=194&c=7&o=5&dpr=1.5&pid=1.7" />
				</a>
			</td>
		</tr>
	</table>
</body>
</html>