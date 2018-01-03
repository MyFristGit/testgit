<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="teacher-swiper">
	<a href="javascript:" class="btn-arrow btn-left"></a>
	<a href="javascript:" class="btn-arrow btn-right"></a>
	<div class="swiper-container">
      	<div class="swiper-wrapper">
           	<div class="swiper-slide clearfix">		
           		<c:forEach items="${zXserviceList}" var="zx">		            		
	           		<div class="item">
	           			<a href="javascript:">
	           				<span class="icon"><img src="img.html?id=${zx.serviceId}"/></span>
	           				<h4>${zx.serviceName}</h4>
	           			</a>
	           		</div>						            		
           		</c:forEach>
            </div>
       	</div>
     </div>
</div>
