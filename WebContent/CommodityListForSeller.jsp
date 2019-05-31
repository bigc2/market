<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.bzu.dao.CommodityDAO,cn.edu.bzu.entity.Commodity"%>
<%
//     String path = request.getContextPath();
// 			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
// 					+ path + "/";
%>

<!DOCTYPE>
<html>
<head>
<style type="text/css">
img {
	width: 120px;
	height: 100px;
}
.table {
	width: 400px;
    height: 160px;
    display: table;
    margin: 0 auto;
	border-collapse:collapse;
    text-align: center;
}
td {
	border: 1px solid #000;
}
</style>
<!-- 引用jQuery -->
<script
	src="https://lib.sinaapp.com/js/jquery/2.0.2/jquery-2.0.2.min.js"></script>
<script>
	/* 插入记录 */
	function popInsert() {
		$(document).ready(function() {
			$("#layer").show();
		});
	}
	/* 更新记录 */
	function popUpdate() {
		$(document).ready(function() {
			$("#layer2").show();
		});
	}
	/* 删除记录 */
	function popDelete() {
		var id = prompt("请输入您要删除的产品id号？");
		if(!isNaN(parseInt(id))) {  // isNaN(NaN) == true
			window.location.href = "delete.jsp?id="+id;
		}else {
			return false;
		}
	}
	/* 关闭插入记录的表单 */
	function closeForm() {
		$(document).ready(function() {
			$("#layer").hide();
		});
	}
	/* 关闭更新记录的表单 */
	function closeForm2() {
		$(document).ready(function() {
			$("#layer2").hide();
		});
	}
	/* 检查表单是否填满 */
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
	}
	/* 检查表单是否填满 */
	function checkIfEmpty2() {
		for(var i=0;i<document.paper2.elements.length-1;i++)  // elements 集合可返回包含表单中所有元素的数组
        {
           if(document.paper2.elements[i].value=="")
           {
              alert("当前表单不能有空项");
              document.paper2.elements[i].focus();
              return false;
           }
        }
		return true;
	}
	/* AJAX刷新页面 */
	function updata() {
		$(document).ready(function() {
			if(!checkIfEmpty2()) {
				return false;
			};
			$.ajax({
				async: false, // Set this options to false to perform a synchronous request
				type: "POST", // The type of request to make, which can be either “POST” or “GET”
				url: '${pageContext.request.contextPath}/updateForSeller.jsp',  // A string containing the URL to which the request is sent
				data: $("#window2").serialize(),  // The data to send to the server when performing the Ajax request
				contentType: "application/x-www-form-urlencoded; charset=utf-8",  // The content type of the data sent to the server
				dataType: "text",  // The type of data expected back from the server
				success: function(msg) { // A function to be called if the request succeeds
					//alert(msg);
					$("#content").load("${pageContext.request.contextPath}/CommodityListForSeller.jsp #content");
				},
				error: function(msg) { // A function to be called if the request fails
					alert("fail");
				}
			})
		})
	}
	function returnLogin() {
		window.location.href = "login.jsp";
	}
	function sendPackage() {
		window.open("http://localhost:80/displayFormOfDB/chat.jsp");
	}
</script>
<title>CommodityListForSeller</title>
</head>
<body>
	<table id="content" class="table">
		<caption>卖家界面</caption>
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
		</tbody>
		<tfoot>
			<tr>
				<td><a href="#"><img
						src="https://tse1-mm.cn.bing.net/th?id=OIP.MeRU1-et9q_QheGz3ZsfEwHaF_&w=240&h=186&c=7&o=5&dpr=1.5&pid=1.7" />
				</a></td>
				<td><a href="#"><img
						src="https://tse1-mm.cn.bing.net/th?id=OIP.ruj2_9prmxeWIpvtoNYLXgHaHa&w=218&h=218&c=7&o=5&dpr=1.5&pid=1.7" />
				</a></td>
				<td><a href="#"><img
						src="https://tse2-mm.cn.bing.net/th?id=OIP.FkzwNaY-eHQWlVZMbFm0MAHaE7&w=292&h=194&c=7&o=5&dpr=1.5&pid=1.7" />
				</a></td>
			</tr>
			<tr>
				<td><input type="button" value="登陆界面" onclick="returnLogin()" style="width:100%" /></td>
				<td><input type="button" value="开始发货" onclick="sendPackage()" style="width:100%"/></td>
			</tr>
		</tfoot>
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
			<td><input type="button" onclick="popUpdate()" value="更新商品记录" /></td>
		</tr>
		<tr>
			<td><input type="button" onclick="popDelete()" value="删除商品记录" /></td>
		</tr>
	</table>
	<!-- 新增商品记录弹窗 -->
	<div id="layer" style="display: none;">
		<form id="window" name="paper" action="insert.jsp" method="post"
			onSubmit="return checkIfEmpty()">
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
	<!-- 更新商品记录弹窗 -->
	<div id="layer2" style="display: none;">
		<form id="window2" name="paper2" >
			<table border=1 align="center">
				<tr>
					<td>商品id：</td>
					<td><input type="text" name="id2" autocomplete="off" /></td>
				</tr>
				<tr>
					<td>商品名：</td>
					<td><input list="browsers" name="name2" autocomplete="off" /></td>
				</tr>
				<tr>
					<td>商品数量：</td>
					<td><input type="text" name="amounts2" autocomplete="off" /></td>
				</tr>
				<tr>
					<td>商品价格：</td>
					<td><input type="text" name="prices2" autocomplete="off" /></td>
				</tr>
				<tr>
					<td><input type="button" onclick="return updata()" value="更新" /></td>
					<td><input type="reset" value="重置" /></td>
					<td><input type="button" onclick="closeForm2()" value="关闭" /></td>
				</tr>
			</table>
		</form>
	</div>
	<datalist id="browsers" style="display: none;">
		<option value="clothes">
		<option value="pants">
		<option value="shoes">
	</datalist>
</body>
</html>