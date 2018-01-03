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
			<div class="index-swiper">
			 <div class="swiper-container">
	        	<div class="swiper-wrapper">
	            	<div class="swiper-slide"><a href="" style="background-image: url(${contextPath}/img/banner1.jpg);"></a></div>
	            	<div class="swiper-slide"><a href="" style="background-image: url(${contextPath}/img/banner2.jpg);"></a></div>
	            	<div class="swiper-slide"><a href="" style="background-image: url(${contextPath}/img/banner3.jpg);"></a></div>
	           </div>
	           <div class="swiper-pagination"></div>
	        </div>       
		</div>			
</body>
</html>