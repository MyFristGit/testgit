<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<title>index</title>
		<meta name="Author" content="网页作者" /> 
        <meta name="keywords" content="网站关键字" />
        <meta name="description" content="网站描述" />
        <link rel="Shortcut Icon" href="网站.ico图标路径" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/common.css"/>	
	</head>
	<body>
		
		<!--登录开始-->
		<%@include file="login.jsp" %>
		<!--登录结束-->
		
		<!-- serviceWelcome -->
		<%@include file="serviceWelcome.jsp" %>
		
		<!--头部开始-->
		<%@include file="head.jsp" %>
		<!--头部结束-->
		
		<!--轮播图开始-->
		<%@include file="banner.jsp" %>
		<!--轮播图结束-->
		
		<!--导航开始-->
		<%@include file="nav.jsp" %>
		<!--导航结束-->
		
		<div class="index-mian">
			<div class="container">
				
				<div class="searchbox clearfix">
						<input type="text" class="form-txt" id="searchText" placeholder="请输入关键词进行检索"/>
						<input type="submit" value="搜索" id="search" class="btn-green btn-sub"/>
				</div>
				
				
				<!--服务-->
				<div class="indexbox">
					<h2 class="comtit">
						<span id="titType">全部服务</span>
									
						<div class="tab fr">
							<ul class="list clearfix">
								<li class="active"><a href="javascript:void(0);" onclick="zx();">最新</a></li>
								<li><a href="javascript:void(0);" onclick="zh();">最热</a></li>
								<li><a href="javascript:void(0);" onclick="qb();">全部</a></li>
							</ul>
						</div>
					</h2>
					<div id="serviceContent">
						<div class="teacher-swiper">
							<a href="javascript:" class="btn-arrow btn-left"></a>
							<a href="javascript:" class="btn-arrow btn-right"></a>
							<div class="swiper-container">
					        	<div class="swiper-wrapper">
						            	<div class="swiper-slide clearfix">		
						            	<c:forEach items="${zXserviceList}" var="zx">		            		
						            		<div class="item">
						            			<a href="javascript:">
						            				<span class="icon"><img src="img.html?id=${zx.serviceId}"/></span>
						            				<h4>${zx.serviceName}</h4>
						            			</a>
						            		</div>						            		
						            		</c:forEach>
						            	</div>
					        	</div>
				            </div>
						</div>
					</div>
				</div>
		
				<!--业务直通车-->
				<%@include file="throughtrain.jsp" %>
			</div>
		</div>
		
		
		<%@include file="footer.jsp" %>
	</body>
	<script src="${contextPath}/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="${contextPath}/js/all.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${contextPath}/js/common.js" type="text/javascript" charset="utf-8"></script>
	<script src="${contextPath}/js/index/index.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
				var i = 0;
				$('.teacher-swiper .item').each(function(){
					$(this).attr('data-ids',i);
					i++
				})
				$('.teacher-swiper .item').on('click',function(){
					if($(this).hasClass('no')){
						return ;
					}
					var ids = $(this).attr('data-ids');				
			  		$('#funWin').show().attr('data-ids',ids);
			  	})
  				
  				$('.winright .btn-tips').on('click',function(){
  					var ids = $('#funWin').attr('data-ids');
  					$('.teacher-swiper .item[data-ids="'+ids+'"]').addClass('no');
  					$('#funWin').hide();
  				})
  				
  				
  				
  				$('#funWin .winleft .btn-sub').click(function(){
  					$('#funWin').hide();
  					$('#loginWin').show()
  				})
  				
  				
  				
  				var titType = $('#titType');
  				$('.head .item').click(function(){
  					titType.html($(this).text())
  				})  				
		})
	</script>
</html>