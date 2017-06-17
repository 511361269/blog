<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录成功</title>
</head>
<body>
	<h2>请选择你要进行的操作</h2>
	1.<a href="${pageContext.request.contextPath}/article_list.action">查看文章列表</a>
	2.<a href="${pageContext.request.contextPath}/article_toAdd.action">添加博文</a>
</body>
</html>