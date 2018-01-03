<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="lzq" uri="http://www.weijia.cn/mytag"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<div class="tob">
<h4>
       <strong>事项名称</strong>
       <i>&nbsp;</i>
       <span>状态</span>
       <em>更改时间</em>
   </h4>
<ul class="tr">
   	<c:forEach items="${pageInfo.processList}" var="process">
   	<li>
       	<div class="top">
               <a  href="${process.url}" target="_Blank"><h5>${process.name}</h5></a>
            
               <span style="display:block; float:left; width:12%;">
               	<div class="bord">
               		<strong>完成</strong>
                   </div>
               </span>
               <i>${process.updateDate }</i>
           </div>
           <div class="bottom">
           	<ul class="c">
           	<c:forEach items="${process.actionInfoList}" var="action">
           		<c:choose>
           			<c:when test="${action.actionUser != null}">
            			<li class="c">
                     	<span>
                         	<h5>${action.name}</h5>
                         	<em><lzq:date value="${action.actionTime}"/> </em>
                             <i class="ico"></i>
                         </span>
                         <strong class="spr">${action.actionUser}&nbsp;&nbsp;&nbsp;${action.actionName}</strong>
                    	</li>	
           			</c:when>
           			<c:otherwise>
           				<li class="c">
                     	<span>
                         	<h5>${action.name}</h5>
                             <i class="ico_1"></i>
                         </span>
                         <strong class="spr">${action.assignUser}&nbsp;&nbsp;&nbsp;${action.actionName}</strong>
                   		</li>
           			</c:otherwise>
           		</c:choose>
               	
                </c:forEach>
               </ul>
           </div>
       </li>
       </c:forEach>
   </ul>
</div>



