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

    <title>留言板</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Additional fonts for this theme -->
    <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='${pageContext.request.contextPath}/css/my-blog.css' rel='stylesheet' type='text/css'>
    <link href='${pageContext.request.contextPath}/css/my-other-blog.css' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this theme -->
    <link href="${pageContext.request.contextPath}/css/clean-blog.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/contact.css" rel="stylesheet">
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
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	
</head>

<body>

    <%@include file="head.jsp" %>
    <!-- Page Header -->
    <header class="intro-header" style="background-image: url('${pageContext.request.contextPath}/img/contact-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    <div class="page-heading">
                        <h1>留言板</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                  <c:choose>
                  <c:when test="${sessionScope.master != null}">
                  <div class="control-group">
                            <textarea rows="5" name="content" class="form-control" placeholder="请输入您的留言..." id="message" required data-validation-required-message="请输入您的留言"></textarea>
                            <p id="tip" class="help-block text-danger"></p>
                    </div>
                    <br>
                    <div id="success"></div>
                        <input type="button" id="newMessage" class="btn btn-secondary" value="留言" onclick="postByAjax()">
                        </c:when>
                        <c:otherwise>
                        	游客只能浏览留言板，请先<a style="color: #0085A1" href="${pageContext.request.contextPath}/master/login.jsp">登录</a>或<a style="color: #0085A1" href="${pageContext.request.contextPath}/master/regist.jsp">注册</a>再留言哦
                        </c:otherwise>
                </c:choose>
                <ul style="list-style: none" id="ul">
                </ul>
                </div>
            </div>
        </div>
	<hr>

    <%@include file="footer.jsp" %>

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
    
    <script src="js/messageShow.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		var node = document.createElement("li");
			node.setAttribute("id", "li");
			$('ul#ul').html('');
    		$.get("${pageContext.request.contextPath}/page_message.action?date="+ new Date(),function(list){
    			var obj = JSON.parse(list);
    			for(var i = 0; i < obj.length; i++){
					$('ul#ul').append(node);
					$('li#li').append("<div class='headImage'><img src='img/"+ i +".jpg'><h6>"+obj[i].master.username + "</h6><p class='col-sm-10 info' >" +obj[i].content + "</p><span id='time' class='timeShow'>" +obj[i].adTime +"</span><span class='b_reply'><a class='reply' id='a_reply' onclick='messageshow()'>回复</a></span><div class='comment_reply' id='comment_reply'><textarea type='text' id='input_reply' placeholder='请输入您的回复内容...'></textarea><button class='comment_btn' onclick='reviewAjax("+obj[i].id+")'>评论</button></div></div><div class='messages'></div>");
				}
    		})
    	});
    
		function postByAjax(){
			var m = document.getElementById("message").value;
			var name ="${sessionScope.master.username}";
			var date = new Date();
			$.ajax({
				url: "${pageContext.request.contextPath}/page_leaveMsg.action",
				type: "GET",
				data: {content: m, time: new Date().getTime()},
				success: function(){
					$('ul#ul').prepend("<li><div class='headImage'><img src='img/1.jpg'><h6>"+ name + "</h6><p class='col-sm-10 info' >" + m + "</p><span id='time' class='timeShow'>" +date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"</span></li>");
					$('#message').val("");
				}
			});
		}
		
		function reviewAjax(id){
			$.get(
				"${pageContext.request.contextPath}/page_view.action?leaveId="+id,function(){
					alert("hello world");
				}
			)
		}
	</script>
</body>

</html>
