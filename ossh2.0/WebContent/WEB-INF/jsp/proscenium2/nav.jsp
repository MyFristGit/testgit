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
	<nav class="index-nav">
			<ul class="list clearfix">
			 <c:forEach items="${serviceTypeList}" var="st">
				<li>
					<a href="javascript:void(0);">
						<span class="icon">
							<img src="typeImg.html?id=${st.typeId}" onclick="subgo(${st.typeId});"/>
						</span>
						<h3>${st.typeName}</h3>
					</a>
				</li>
			</c:forEach>
			</ul>
		</nav>
</body>
</html>