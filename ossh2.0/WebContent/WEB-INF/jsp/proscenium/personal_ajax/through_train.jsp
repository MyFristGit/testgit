<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div  style="min-width: 1007px;max-width: 1007px;">
	 <div class="cnxh c">
        <ul>
	          <c:forEach items="${throughTrain}" var="tt">
			     <li >
			     	<a href="${tt.url}"  target="_blank">
			                       <i><img src="imgThroughTrain.html?id=${tt.id}"/></i>
			                       <p>${tt.business_name}</p>
			                   </a>
				  </li>
			 </c:forEach>
         </ul>
     </div>
</div>    