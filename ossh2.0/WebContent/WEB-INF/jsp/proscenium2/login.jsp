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
<div class="mask-bg" id="loginWin">
			<form action="" method="post">						
				<div class="loginbox win">
					<div class="wintop">
						<div class="winlogo"><img src="${contextPath}/img/logo.png"/></div>
						<a href="javascript:" class="btn-no"></a>
					</div>
					<div class="cont">
						<input type="text" placeholder="用户名" class="form-txt"/>
						<input type="password" placeholder="密码" class="form-txt"/>
						<div class="tr clearfix"><a href="">忘记密码</a></div>
						<!--<input type="submit" value="登录" class="btn-green btn-sub"/>-->
						<a href="indexUser.html" class="btn-sub btn-green">登录</a>
					</div>					
				</div>			
			</form>
		</div>
</body>
</html>