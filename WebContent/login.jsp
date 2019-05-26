<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>买家登录</title>
</head>
<body bgcolor="#e3e3e3">
	<div align="center">
		<form action="checkForBuyer.jsp" method="post">
			<table>
				<caption>买家登录</caption>
				<tr>
					<td>用户名:</td>
					<td><input type="text" name="username" size="20" required="required"/></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input type="text" name="pwd" size="20" required="required"/></td>
				</tr>
				<tr>
					<td><input type="submit" value="登录" />
					<td><input type="reset" value="重置" />
				</tr>
			</table>
		</form>
		如果您还没有注册，请单击<a href="register.jsp">这里</a>注册！<br>
		如果您是卖家，请单击<a href="sellerLogin.jsp">这里</a>登陆！
	</div>
</body>
</html>