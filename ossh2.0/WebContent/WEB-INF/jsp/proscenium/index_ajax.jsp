<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <div class="zuixin">
                            <h4>
                                <span  class="active showDown">最新</span>
                               	<span class="showDown">最热</span>
                                <span class="showDown">全部</span> 
                            </h4>
                            <div  class="showBottom">
                               <div class="tab">
                               		<ul class="c"   id="subServices">
		                             <c:forEach items="${zXserviceList}" var="zx">
							              <li  serviceId="${zx.serviceId}">
								               <a class="li_top" href="#">
								                   <span  class="ico-bg1">
								                       <i><img src="img.html?id=${zx.serviceId}"></i>
								                       <c:choose>
															<c:when test="${fn:length(zx.serviceName) > 17  }">
																	<p>${fn:substring(zx.serviceName,0,17)}... </p>
															</c:when>
															<c:otherwise>
															   <p>${zx.serviceName}</p>
															</c:otherwise>
													   </c:choose>
								                   </span>
								               </a>
								                <!-- 
								               <div class="li_bt">
			                                        <span  title="点赞">${zx.praise_count == null ? 0:  zx.praise_count}</span>
			                                        <strong  title="评论">${zx.comment_count==null ?   0: zx.comment_count}</strong>
			                                        <em  title="收藏">${zx.collection_count ==  null?  0:zx.collection_count}</em>
			                                    </div>
			                                    -->
			                                   <div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">

				           		         	  		<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
					           		         		<div class="jq_tips_info2" style="">

					           		         		评论:${zx.comment_count==null ?   0: zx.comment_count}条<br/>点赞:${zx.praise_count == null ? 0:  zx.praise_count}个<br/>收藏:${zx.collection_count ==  null?  0:zx.collection_count}个<br/></div>
				           		         		</div>
								           </li>
							          </c:forEach>
		                            </ul>                           
		                            	 <!-- <a href="#"  class="more">》更多</a> --> 
                               </div>
                               <div  class="tab" style="display:none;">
                               		  <ul class="c"   id="subServicesByHot">
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
			                             <!--  <a href="#"  class="more">》更多</a> -->
                           
                               		
                               </div>
                               
                               <div  class="tab" style="display:none;"  id="delayLoad3"  ajaxUrl="allService.html"  delayLoad="true">
                               		<i class="fa fa-spinner fa-spin"   style="font-size:50px;color:blue;margin:20px;"></i>
                               		
                               </div>
                               
                            
                            </div>
                            
                            	
                        </div>
