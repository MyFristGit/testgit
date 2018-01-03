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
	<div class="indexbox mt30">
					<h2 class="comtit">
						业务直通车				
					</h2>
					<ul class="business clearfix">
					   <c:forEach items="${throughTrain}" var="tt">
						<li>
							  	<a href="${tt.url}"  target="_blank">
								<span class="icon"><img src="imgThroughTrain.html?id=${tt.id}"/></span>
								<h4>${tt.business_name}</h4>
							</a>
						</li>
					</c:forEach>
					</ul>
				</div>	
</body>
</html>