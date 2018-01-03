<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
         <ul class="c">
             <c:if test="${serviceList != null && fn:length(serviceList)>0}">
            	 <c:forEach items="${serviceList}" var="service">
                 <li>
                     <a class="li_top" href="#">
                         <span>
                             <i>
                             	<c:if test="${service.serviceId != null}">
                             		<img src="img.html?id=${service.serviceId}"/>
                             	</c:if>
                             </i>
                             <p>${service.serviceName }</p>
                         </span>
                     </a>
                   
                 </li>
                 </c:forEach>
                </c:if>
             </ul>