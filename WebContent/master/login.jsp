<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>用户登录</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Additional fonts for this theme -->
    <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='${pageContext.request.contextPath}/css/my-blog.css' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath}/css/my-other-blog.css' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this theme -->
    <link href="${pageContext.request.contextPath}/css/clean-blog.min.css" rel="stylesheet">
<!--    <link href="../css/login.css" type="text/css" rel="stylesheet">-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
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

   <%@include file="../head.jsp" %>

    <!-- Page Header -->
    <header class="intro-header" style="background-image: url('${pageContext.request.contextPath}/img/contact-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    <div class="page-heading">
                        <h1>登录</h1>
                        <hr class="small">
<!--                        <span class="subheading">Have questions? I have answers (maybe).</span>-->
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
               <form id="contactForm" action="${pageContext.request.contextPath}/master_login.action" method="post">
                   <div class="control-group">
                       <div class="form-group">
                          <label class="col-sm-4">用户名</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="userName" name="username"/>
                           </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4">密&nbsp;&nbsp;&nbsp;码</label>
                            <div class="col-sm-8">
                            <input type="password" class="form-control" id="passWord" name="password"/>
                            </div>
                       </div>
                       <div class="form-group">
                             <button type="submit" id="login" class="btn btn-secondary">登录</button>
                       </div>
                       <div class="form-group">
                            <a href="${pageContext.request.contextPath}/master/regist.jsp"><button type="button" id="regist" class="btn btn-secondary">注册</button></a>
                       </div>
               </form>
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
    

    <!-- Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>

</body>

</html>
