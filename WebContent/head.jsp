<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Navigation -->
    <nav class="navbar fixed-top navbar-toggleable-md navbar-light" id="mainNav">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                菜单 <i class="fa fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="${pageContext.request.contextPath}/main.jsp">主页</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="${pageContext.request.contextPath}/about.jsp">关于我</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="${pageContext.request.contextPath}/page_top.action">头条</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="${pageContext.request.contextPath}/message.jsp">留言板</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>