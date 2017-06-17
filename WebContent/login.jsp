<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/user_login.action">
		<input type="hidden" name="mode" value="login">
		用户名：<input type="text" id="username" name="username"/><br/><br/>
		密&nbsp&nbsp&nbsp&nbsp码：<input type="password" id="username" name="password"><br/><br/>
		<input type="submit" value="登录">
	</form>
</body>
</html>