<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员注册</title>
</head>
<body>
	<form method="post" action="user_regist.action">
		<input type="hidden" name="mode" value="regist">
		用户名：<input type="text" id="username" name="username"/><br/><br/>
		密&nbsp&nbsp&nbsp&nbsp码：<input type="password" id="username" name="password"><br/><br/>
		<input type="submit" value="注册">
	</form>
</body>
</html>