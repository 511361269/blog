<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="ck" uri="http://ckeditor.com"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加博文</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/article_add.action" method="post">
		博文标题：<input type="text" name="title"/><br/><br/>
		博文简介：<input type="text" name="info"/><br/><br/>
		博文内容：<textarea id="my_txt" style="width:400px;height:200px" name="content"></textarea><br/>
		<ck:replace replace="my_txt" basePath="${pageContext.request.contextPath}/ckeditor"></ck:replace>
		<input type="submit" value="发表"/>
	</form>
</body>
</html>