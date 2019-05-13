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
<!-- 引用又拍云的jQuery -->
<script
	src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
<script>
	function popInsert() {
		$(document).ready(function() {
			$("#layer").show();
		});
	};
	function popDelete() {
		var id = prompt("请输入您要删除的产品id号？");
		if(!isNaN(parseInt(id))) {  // isNaN(NaN) == true
			window.location.href = "delete.jsp?id="+id;
		}else {
			return false;
		}
	};
	function closeForm() {
		$(document).ready(function() {
			$("#layer").hide();
		});
	};
	function checkIfEmpty() {
		for(var i=0;i<document.paper.elements.length-1;i++)  // elements 集合可返回包含表单中所有元素的数组
        {
           if(document.paper.elements[i].value=="")
           {
              alert("当前表单不能有空项");
              document.paper.elements[i].focus();
              return false;
           }
        }
	};
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
			<td><a href="#"><img
					src="https://tse1-mm.cn.bing.net/th?id=OIP.MeRU1-et9q_QheGz3ZsfEwHaF_&w=240&h=186&c=7&o=5&dpr=1.5&pid=1.7" />
			</a></td>
			<td><a href="#" ><img
					src="https://tse1-mm.cn.bing.net/th?id=OIP.ruj2_9prmxeWIpvtoNYLXgHaHa&w=218&h=218&c=7&o=5&dpr=1.5&pid=1.7" />
			</a></td>
			<td><a href="#"><img
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
			<td><input type="button" onclick="popInsert()" value="新增商品记录" /></td>
		</tr>
		<tr>
			<td><input type="button" onclick="" value="更新商品记录" /></td>
		</tr>
		<tr>
			<td><input type="button" onclick="popDelete()" value="删除商品记录" /></td>
		</tr>
	</table>
	<!-- 新增商品记录弹窗 -->
	<div id="layer" style="display: none;">
		<form id="window" name="paper" action="insert.jsp" method="post" onSubmit="return checkIfEmpty()">
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
					<td><input type="button" onclick="closeForm()" value="关闭" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>