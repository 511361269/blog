<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>我的博客</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Additional fonts for this theme -->
    <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='${pageContext.request.contextPath}/css/my-blog.css' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath}/css/my-other-blog.css' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this theme -->
    <link href="${pageContext.request.contextPath}/css/clean-blog.min.css" rel="stylesheet">

    <!-- Temporary navbar container fix until Bootstrap 4 is patched -->
    <style>
    .navbar-toggler {
        z-index: 1;
    }
    
    @media (max-width: 576px) {
        nav > .container {
            width: 100%;
        }
    }
    </style>
</head>
<body>

    <%@include file="head.jsp" %>

    <!-- Page Header -->
    <header class="intro-header" style="background-image: url('${pageContext.request.contextPath}/img/home-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    <div class="site-heading">
                        <h1>Clean Blog</h1>
                        <span class="subheading">欢迎来到我的Blog</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                <s:iterator var="article" value="#request.list">
                <div class="post-preview">
                    <a href="${pageContext.request.contextPath}/page_post.action?id=<s:property value="#article.id"/>">
                        <h2 class="post-title">
                            <s:property value="#article.title"/>
                        </h2>
                        <h3 class="post-subtitle">
                            <s:property value="#article.info"/>
                        </h3>
                    </a>
                    <p class="post-meta">Posted by <a href="about.jsp"><s:property value="#article.admin.username"/></a> on <s:property value="#article.adTime"/></p>
                </div>
                </s:iterator>
                <hr>
                
                <!-- Pager -->
                <div class="clearfix">
                    <a class="btn btn-secondary float-right" href="#">Older Posts &rarr;</a>
                </div>
            </div>
        </div>
    </div>

    <hr>

    <!-- Footer -->
    总共<b>${requestScope.page.totalPage}</b>页&nbsp&nbsp&nbsp<b>${requestScope.page.totalCount}</b>条 
    <c:choose>
    	<c:when test="${requestScope.page.hasLastPage}">
    		<a href="${pageContext.request.contextPath}/page_list?currentPage=${requestScope.page.currentPage - 1}">上一页</a>
    	</c:when>
    	<c:when test="${requestScope.page.hasNextPage}">
    		<a href="${pageContext.request.contextPath}/page_list?currentPage=${requestScope.page.currentPage + 1}">下一页</a>
    	</c:when>
    </c:choose>
    <%@include file="footer.jsp" %>

    <!-- jQuery Version 3.1.1 -->
    <script src="lib/jquery/jquery.js"></script>

    <!-- Tether -->
    <script src="lib/tether/tether.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>

</body>

</html>
