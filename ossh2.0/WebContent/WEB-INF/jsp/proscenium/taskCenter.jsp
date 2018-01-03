<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<html>
    <head>
    <meta charset="utf-8">
    	<title>西科E站</title>
    	<link rel="shortcut icon" href="${contextPath}/static/proscenium/images/xkd.ico" /> 
		<link href="${contextPath}/static/proscenium/css/index.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/static/proscenium/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
        <script src="${contextPath}/static/proscenium/js/jquery-1.10.2.min.js" type="text/javascript"></script>
         <link href="./static/proscenium/css/dialog.css" rel="stylesheet" type="text/css"/>
         <script src="./static/proscenium/js/commonDialog.js" type="text/javascript"></script>
         <script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.tips.js"></script>
         <style>
         
         .zuixin{
         	width:90%;
         }
         </style>
    
    </head>
	<body>
         <div class="head_bg c">
            <div class="logo"><a href="findex.html"><img src="${contextPath}/static/proscenium/images/logo.png"></a></div>
            <%@ include file="head.jsp"%> 
        </div>
        <div class="zhezhao"></div>
        <div class="min c">
        	<div class="left">
				<div class="scrollContent" style="width:100%; height:100%;">
				<div class="cnxh c">
                        <h4>服务类别</h4>
                        <ul>
                        	 <li class="leftLi  doLeftLiImg">
				              	<a href="javascript:void(0);">
                                    <i><img src="typeImg.html?id=1" onclick="subgo(1,this);"/></i>
                                    <p>全部</p>
                                </a>
					         </li>
                          <c:forEach items="${serviceTypeList}" var="st">
				              <li class="doLeftLiImg">
				              	<a href="javascript:void(0);">
                                    <i><img src="typeImg.html?id=${st.typeId}" onclick="subgo(${st.typeId},this);"/></i>
                                    <p>${st.typeName}</p>
                                </a>
					         </li>
				       	   </c:forEach>
							       
                        </ul>
                    </div>
                    
                    <script>
                       $(function(){
                    	   $(".doLeftLiImg").click(function(){
                    		   $(this).find("img").trigger("click");
                    		   
                    	   });
                    	   $(".doLeftLiImg img").click(function(){
                    		   return false;
                    		   
                    	   });
                    	   
                       });
                    </script>
                    
                    <div class="cnxh c">
                        <h4>业务直通车</h4>
                        <ul>
                          <c:forEach items="${throughTrain}" var="tt">
				              <li >
				              	<a href="${tt.url}" target="_blank">
                                    <i><img src="imgThroughTrain.html?id=${tt.id}"/></i>
                                    <p>${tt.business_name}</p>
                                </a>
					         </li>
				       	   </c:forEach>
							       
                        </ul>
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="scrollContent" style="width:100%; height:100%;">
                	<div class="fr_ct">
                		<div class="dqwz">
                        	<h4>
                            	<a href="findex.html">首页</a>
                                <span> > </span>
                                <a href="taskCenter.html" class="link">我的服务</a>
                            </h4>
                        </div>
                        <div class="pdg55">
                         <div class="head">
                                <div class="sosu">
                                        <input class="text" type="text" name="text" value="" placeholder="请输入服务名称" id="search_taskCenter2">
                                        <input class="but" type="text" name="button" id="searchCenterText2" value="">
                                </div>
                                <script>
                                $(document).ready(function() { 
                            		$("#searchCenterText2").click(function(){
                            			var name = $("#search_taskCenter2").val();
                            			if($.trim(name)==""){
                            				$("#search_taskCenter2").tips({
                            					side : 1,
                            					msg : "输入不可为空",
                            					bg : '#FF5080',
                            					time : 3
                            				});
                            				return;
                            			}
                            			$.post('searchOnlyOne.html?name='+name, function(data) {
                            				$('#serviceContent').html(data);
                            				dialogAddEvent();
                            			});
                            		});
                            	});
                                
                                </script>
                                <div class="youbian">
                                	<span>您是：</span>
                                    <a href="javascript:void(0);" id="sqr" class="link">申请人</a>
                                    <a href="javascript:void(0);" id="shr" >审批人</a>
                                </div>
                                <div class="zhongjian">
                                	<a id="sqr_dbl" href="sqr_to_dbl.html">待办理</a>
                                    <a id="sqr_slz" href="sqr_to_slz.html">受理中</a>
                                    <a id="sqr_wc" href="sqr_to_wc.html">完成</a>
                                </div>
                                
                            </div>
                            </div>
	                      <div  id="serviceContent">
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
                </div>
            </div>
        </div>
     	
     
    </body>
</html>
<script>
	$(function(){
		$('.grzx .ico').each(function(){/*遍历数字*/
			var thishtml=parseInt(($(this).find('p').html()));
			if(thishtml>=1){
				$(this).find('p').show();
			}	
		});
		$('.denglu').hover(function(){
			$('.xiala').show();
		},function(){
			$('.xiala').hide();
		});
		$('.top_right > .denglu').click(function(){
			$('.zhezhao').show();
			$('.zz_denglu').show();
		})
		$('.guanbi').click(function(){
			$('.zhezhao').hide();
			$('.zz_denglu').hide();
		})
		
		$(".zz_denglu .form input").focus(function(){
			$(this).parent().addClass("link");
		});
		$(".zz_denglu .form input").blur(function(){
			var thisval = $(this).val();
			if(thisval==""){
				$(this).parent().removeClass("link");
			};
		});
		
		$('.left,.right').height($(window).height()-76);
	});
</script>
<script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.easing.1.3.js"></script>
<script src="${contextPath}/static/proscenium/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${contextPath}/static/proscenium/js/login.js"></script>
<script src="${contextPath}/static/proscenium/js/taskCenter.js"></script>

<script>

$(function(){
    //点击图标后弹出服务框
    dialogAddEvent();
});


//给service服务添加弹出对话框处理
function  dialogAddEvent(){	
	$("  .zuixin ul").delegate("li","click",function(e){
		openDialogBySrc({src:"./serviceWelcome.html?id="+$(this).attr("serviceId")});
  	e.stopPropagation();
	});
}

//左侧菜单点击后
function subgo2(id,me){
	$(".left a").removeClass("aActive");
	$(me).addClass("aActive");
	$.post('serviceByMyType.html?id='+id, function(data) {
		$('#sfqhContent').html(data);
		dialogAddEvent();	
	});
}



</script>


