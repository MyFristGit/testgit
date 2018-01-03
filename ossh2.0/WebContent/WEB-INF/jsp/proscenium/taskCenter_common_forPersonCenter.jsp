<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<div class="scrollContent" style="width:100%; height:100%;">
	<div class="fr_ct">
		
        <div class="zuixin" id="sfqhContent">
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
								<c:when test="${fn:length(service.serviceName) > 17  }">
								<p>${fn:substring(service.serviceName,0,17)}... </p>
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
