<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<header class="head">
			<div class="fl">
				<h1 class="logo" title="西安大学"><a href="index.html"><img src="${contextPath}/img/logo.png" alt="西安大学"/></a></h1>
				<a href="javascript:void(0);" onclick="teacher();" class="item">
					<img src="${contextPath}/img/icon1.png" class="icon"/>
					教师服务
				</a>
				<a href="javascript:void(0);" onclick="student();" class="item">
					<img src="${contextPath}/img/icon2.png" class="icon"/>
					学生服务
				</a>
			</div>
			<!--没登录-->
			<a href="javascript:" class="fr btn-login btn-c" id="btnLogin">登录</a>
			
		</header>
		<div class="h80"></div>
</body>
</html>