<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客管理</title>
</head>
<body>
	<h1>博客列表</h1>
	<table style="border: 2px;">
		<tr>
			<td>博文标题</td>
			<td>博文简介</td>
			<td>博文内容</td>
			<td>操作</td>
		</tr>
		
		<s:iterator var="article" value="#request.list">
			<tr>
			<td><s:property value="#article.title"/></td>
			<td><s:property value="#article.info"/></td>
			<td><s:property value="#article.content"/></td>
			<td><a href="${pageContext.request.contextPath}/article_show.action?id=<s:property value="#article.id"/>">修改</a></td>
			<td><a href="${pageContext.request.contextPath}/article_delete.action?id=<s:property value="#article.id"/>">删除</a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>