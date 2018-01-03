<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<div class="scrollContent" style="width:100%; height:100%;">
	<div class="fr_ct">
		
        <div class="zuixin" id="sfqhContent">
            <ul class="c">
            <c:if test="${zHserviceList != null && fn:length(zHserviceList)>0}">
           	  <c:forEach items="${zHserviceList}" var="zh">
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
                                    <span>339</span>
                                    <strong>554</strong>
                                    <em>123</em>
                                </div> 
	                -->
	                
	                <div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="top:-20px;left:100px; display: none;">
        		         	  		<i class="jq_tips_arrow2 jq_tips_right2" style="border-right: 10px solid grey;"></i>
         		         		<div class="jq_tips_info2" style="color: rgb(255, 255, 255);background-color: grey;">评论:300条<br/>点赞:230个<br/>收藏:34个<br/></div>
        		         		</div>
	             

	           </li>
	           </c:forEach>
            </c:if>
         </ul>
        </div>
    </div>             	
</div>