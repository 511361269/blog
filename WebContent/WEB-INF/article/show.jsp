<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改博文</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/article_update.action?id=${sessionScope.artEx.id}">
		博文标题：<input type="text" value="${sessionScope.artEx.title }" name="title"/><br/><br/>
		博文简介：<input type="text" value="${sessionScope.artEx.info }" name="info"/><br/><br/>
		博文内容：<textarea style="width:400px;height:200px" name="content">${sessionScope.artEx.content }</textarea><br/>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>