<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
	session.invalidate();
	String casLogoutURL = "http://ids.xust.edu.cn/authserver/logout";
    String redirectURL=casLogoutURL+"?service="+URLEncoder.encode("http://ehall.xust.edu.cn");
	response.sendRedirect(redirectURL);
%>
