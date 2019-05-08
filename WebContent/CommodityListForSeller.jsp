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
.delete_right {
    display: block;
    cursor: pointer;
    width: 12px;
    height: 12px;
    position: absolute;
    top: 22px;
    right: 30px;
    background: url(../img/icons.png) -48px -96px no-repeat;
}
</style>
<!-- 引用又拍云的jQuery -->
<script
	src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<script>
	function pop() {
		$(document).ready(function() {
			$("#layer").show();
		});
	};
	function pop2() {
		var id = prompt("请输入您要删除的产品id号？");
		window.location.href = "delete.jsp?id="+id;
	}
</script>
<title>CommodityListForSeller</title>
</head>
<body>
	<table border="1" align="center">
		<caption>卖家界面</caption>
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
			<td><a href="#" onclick="change(1)"><img
					src="https://tse1-mm.cn.bing.net/th?id=OIP.MeRU1-et9q_QheGz3ZsfEwHaF_&w=240&h=186&c=7&o=5&dpr=1.5&pid=1.7" />
			</a></td>
			<td><a href="#" onclick="change(2)"><img
					src="https://tse1-mm.cn.bing.net/th?id=OIP.ruj2_9prmxeWIpvtoNYLXgHaHa&w=218&h=218&c=7&o=5&dpr=1.5&pid=1.7" />
			</a></td>
			<td><a href="#" onclick="change(3)"><img
					src="https://tse2-mm.cn.bing.net/th?id=OIP.FkzwNaY-eHQWlVZMbFm0MAHaE7&w=292&h=194&c=7&o=5&dpr=1.5&pid=1.7" />
			</a></td>
		</tr>
	</table>
	<br>
	<br>
	<!-- 功能窗口 -->
	<table border="1" align="center">
		<tr>
			<td colspan="2" align="center">金手指</td>
		</tr>
		<tr>
			<td><input type="button" onclick="pop()" value="新增商品记录" /></td>
		</tr>
		<tr>
			<td><input type="button" onclick="pop2()" value="删除商品记录" /></td>
		</tr>
	</table>
	<!-- 弹窗 -->
	<div id="layer" style="display: none;">
		<form id="window" action="insert.jsp" method="post">
			<table border=1 align="center">
				<tr>
					<td>商品id：</td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td>商品名：</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>商品数量：</td>
					<td><input type="text" name="amounts" /></td>
				</tr>
				<tr>
					<td>商品价格：</td>
					<td><input type="text" name="prices" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="添加" /></td>
					<td><input type="reset" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>