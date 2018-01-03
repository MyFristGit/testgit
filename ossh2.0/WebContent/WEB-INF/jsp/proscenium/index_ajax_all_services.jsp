<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<ul class="c"   id="index_ajax_allServices">
  <c:forEach items="${zHserviceListAll}" var="zh">
	   <li  serviceId="${zh.serviceId}">
	       <a class="li_top" href="#">
	           <span  class="ico-bg6">
	               <i><img src="img.html?id=${zh.serviceId}"/></i>
	             
	                <c:choose>
						<c:when test="${fn:length(zh.serviceName) > 17  }">
								<p>${fn:substring(zh.serviceName,0,17)}... </p>
						</c:when>
						<c:otherwise>
						     <p>${zh.serviceName}</p>
								</c:otherwise>
					</c:choose>
	             </span>
	         </a>
	          <!--
	        <div class="li_bt">
	                           <span  title="点赞">${zh.praise_count == null ? 0:  zh.praise_count}</span>
	                           <strong  title="评论">${zh.comment_count==null ?   0: zh.comment_count}</strong>
	                           <em  title="收藏">${zh.collection_count ==  null?  0:zh.collection_count}</em>
	                       </div> 
	         -->  
	     
	        <div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">
		         	  		<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
			         		<div class="jq_tips_info2" style="">评论:${zh.comment_count==null ?   0: zh.comment_count}条<br/>点赞:${zh.praise_count == null ? 0:  zh.praise_count}个<br/>收藏:${zh.collection_count ==  null?  0:zh.collection_count}个<br/></div>
		    </div>
	   
	   </li>
   </c:forEach>
</ul>
			         
                    
              	
   
