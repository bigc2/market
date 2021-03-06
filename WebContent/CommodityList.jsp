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
	<script language="javascript" type="text/javascript">
		function change(productNumber) {
			var value;
			var value2;

			if (productNumber == 1) {
				value = parseInt(value2 = prompt("请输入购买数量："));
				if (isNaN(value2)) {
					alert("请输入数字！");
				}
				checkValue(value, productNumber);
			} else if (productNumber == 2) {
				value = parseInt(prompt("请输入购买数量："));
				checkValue(value, productNumber);
			} else if (productNumber == 3) {
				value = parseInt(prompt("请输入购买数量："));
				checkValue(value, productNumber);
			}
		};
		function checkValue(value, productNumber) {
			if (isNaN(value)) {
				return false;
			} else {
				window.location.href = "update.jsp?para=" + value
						+ "&productNumber=" + productNumber;
			}
		};
		function returnLogin() {
			window.location.href = "login.jsp";
		}
		function sendMsg() {
			window.open("http://localhost:80/displayFormOfDB/chat.jsp");
		}
	</script>
	<table  id="content" border="1" align="center">
		<caption>买家界面</caption>
		<thead>
			<tr>
				<td align="center">id</td>
				<td align="center">name</td>
				<td align="center">amounts</td>
				<td align="center">prices</td>
			</tr>
		</thead>
		<tbody>
			<%
			    CommodityDAO dao = new CommodityDAO();
			    List<Commodity> list = dao.readFirstTitle(); 
			    for (Commodity tl : list) { // for (循环变量类型 循环变量名称 : 要被遍历的对象)
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
		</tbody>
		<tfoot>
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
			<tr>
				<td><input type="button" value="登陆界面" onclick="returnLogin()" style="width:100%" /></td>
				<td><input type="button" value="提醒发货" onclick="sendMsg()" style="width:100%" /></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>