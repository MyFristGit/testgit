<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div  style="min-width: 1007px;max-width: 1007px;">
	    <div class="scrollContent" style="width:100%; height:100%;">  
           <div class="pdg55">
            <div class="head">
                 
                   <div class="youbian">
                   	<span>您是：</span>
                       <a href="taskCenter.html"  class="link" target="_blank">申请人</a>
                       <a href="taskCenter_sh.html"   target="_blank">审批人</a>
                   </div>
                   <div class="zhongjian">
                   	<a id="sqr_dbl" href="sqr_to_dbl.html" target="_blank">待办理</a>
                       <a id="sqr_slz" href="sqr_to_slz.html" target="_blank">受理中</a>
                       <a id="sqr_wc" href="sqr_to_wc.html" target="_blank">完成</a>
                   </div>
                   
             </div>
           </div>
           <div class="zuixin" id="myServiceAjaxDiv">
              	 <ul class="c">
             	  <c:if test="${serviceListInTask != null && fn:length(serviceListInTask)>0}">
              	 <c:forEach items="${serviceListInTask}" var="service">
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
