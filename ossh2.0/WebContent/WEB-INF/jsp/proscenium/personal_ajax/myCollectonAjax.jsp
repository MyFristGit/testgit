<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div  style="min-width: 1007px;max-width: 1007px;">
	   <div class="scrollContent" style="width:100%; height:100%;">
			<div class="fr_ct">
				
		        <div class="zuixin" id="myCollectionId"  >
		            <ul class="c">
		            <c:if test="${serviceList != null && fn:length(serviceList)>0}">
		           	 <c:forEach items="${serviceList}" var="service">
		                <li   serviceId="${service.serviceId}">
		                    <a class="li_top" href="#">
		                     
		                        <span>
		                            <i>
		                            	<c:if test="${service.serviceId != null}">
		                            		<img src="img.html?id=${service.serviceId}"/>
		                            	</c:if>
		                            </i>
		                            <c:choose>
										<c:when test="${fn:length(service.serviceName) > 14  }">
										<p>${fn:substring(service.serviceName,0,14)}... </p>
										</c:when>
										<c:otherwise>
										<p> ${service.serviceName}</p>
										</c:otherwise>
									</c:choose>
		                        </span>
		                      
		                    </a>
		                  
		                </li>
		                </c:forEach>
		               </c:if>
		            </ul>
		        </div>
		    </div>             	
		</div>
	       			  
</div>   
