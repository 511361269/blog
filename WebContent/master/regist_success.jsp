<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>注册成功</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Additional fonts for this theme -->
    <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='${pageContext.request.contextPath}/css/my-blog.css' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath}/css/my-other-blog.css' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this theme -->
    <link href="${pageContext.request.contextPath}/css/clean-blog.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">

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
    <script type="text/javascript">
    	var i = 5;
    	var interval = setInterval("fun()",1000);
    	function fun(){
    		if(i == 0){
    			window.location.href="${pageContext.request.contextPath}/main.jsp";
    			clearInterval(interval);
    		}
    		document.getElementById("time").innerHTML = i;
    		i --;
    	}
    </script>
</head>

<body>

    <!-- Page Header -->
    <header class="intro-header" style="background-image: url('${pageContext.request.contextPath}/img/info.jpg');height: 350px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    <div class="page-heading">
                        <h1 style="margin-top: -100px">注册成功</h1>
                        <hr class="small">
                        <a href="${pageContext.request.contextPath}/main.jsp">页面将在<span id="time">5</span>秒后返回首页</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
               
            </div>
        </div>
    </div>

    <hr>

    <%@include file="../footer.jsp" %>

    <!-- jQuery Version 3.1.1 -->
    <script src="lib/jquery/jquery.js"></script>

    <!-- Tether -->
    <script src="lib/tether/tether.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>

</body>

</html>
