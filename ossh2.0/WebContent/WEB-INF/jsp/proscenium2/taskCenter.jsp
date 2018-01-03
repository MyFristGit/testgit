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
		<!--[if lt IE 9]>
	       <script src="${contextPath}/js/iebug.js"></script>
	    <![endif]-->
	</head>
	<body>
		<!-- serviceWelcome -->
		<%@include file="serviceWelcome.jsp" %>
		
		
		<!--头部开始-->
		<header class="head">
			<div class="fl">
				<h1 class="logo" title="西安大学"><a href="index.html"><img src="${contextPath}/img/logo.png" alt="西安大学"/></a></h1>
				<a href="javascript:" class="item">
					<img src="${contextPath}/img/icon1.png" class="icon"/>
					教师服务
				</a>
				<a href="javascript:" class="item">
					<img src="${contextPath}/img/icon2.png" class="icon"/>
					学生服务
				</a>
			</div>
			<!--没登录-->
			<!--<a href="javascript:" class="fr btn-login btn-c" id="btnLogin">登录</a>-->
			<!--登录-->
			<div class="fr info">
				<a href="" class="icon-item" title="信息">
					<em class="tips"></em>
					<img src="${contextPath}/img/icon41.png"/>
				</a>
				<a href="" class="icon-item" title="邮件">
					<img src="${contextPath}/img/icon42.png"/>
				</a>
				<div class="author">
					<div class="authortop">
						<a href=""><img src="${contextPath}/img/author.png" class="authorimg"/></a>
						<div class="author-box">
							<div class="name txt-hide">用户名：6位字符</div>
							<div class="txt">学生</div>
							<img src="${contextPath}/img/arrow_t.png" class="arrow" alt="" />
						</div>
					</div>
					<div class="author-cont">
						<ul class="list">
							<li>
								<a href="">
									<div class="imgbox">
										<span>
											<img src="${contextPath}/img/icon37.png"/>
											<img src="${contextPath}/img/icon37_b.png"/>
										</span>
									</div>
									我的服务
								</a>
							</li>
							<li>
								<a href="">
									<div class="imgbox">
										<span>
											<img src="${contextPath}/img/icon38.png"/>
											<img src="${contextPath}/img/icon38_b.png"/>
										</span>
									</div>
									我的收藏
								</a>
							</li>
							<li>
								<a href="">
									<div class="imgbox">
										<span>
											<img src="${contextPath}/img/icon39.png"/>
											<img src="${contextPath}/img/icon39_b.png"/>
										</span>
									</div>
									个人中心
								</a>
							</li>
							<li>
								<a href="">
									<div class="imgbox">
										<span>
											<img src="${contextPath}/img/icon40.png"/>
											<img src="${contextPath}/img/icon40_b.png"/>
										</span>
									</div>
									修改密码
								</a>
							</li>
						</ul>
						<a href="index.html" class="btn-login btn-c">退出登录</a>
					</div>
				</div>
			</div>
		</header>
		<div class="h80"></div>
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
					<form action="" method="post">
						<input type="text" class="form-txt" placeholder="请输入关键词进行检索"/>
						<input type="submit" value="搜索" class="btn-green btn-sub"/>
					</form>
				</div>
				
				
				<!--教师服务-->
				<div class="indexbox">
					<div class="identity">
						<ul class="clearfix">
							<li class="active"><a href="javascript:">我是申请人</a></li>
							<li><a href="javascript:">我是审批人</a></li>
						</ul>
					</div>
					<h2 class="comtit">
						<span id="titType">全部服务</span>			
						<div class="tab fr">
							<ul class="list clearfix">
								<li class="active"><a href="javascript:">待办理</a></li>
								<li><a href="javascript:">办理中</a></li>
								<li><a href="javascript:">完成</a></li>
							</ul>
						</div>
					</h2>
					
					<div class="teacher-swiper">
						<!--<a href="javascript:" class="btn-arrow btn-left"></a>
						<a href="javascript:" class="btn-arrow btn-right"></a>-->
						<div class="swiper-container">
				        	<div class="swiper-wrapper">
				        		
				            	<div class="swiper-slide clearfix">				            		
				            		<div class="item">
				            			<a href="javascript:">
				            				<span class="icon"><img src="${contextPath}/img/icon14.png"/></span>
				            				<h4>教学工作量查询</h4>
				            			</a>
				            		</div>						            		
				            		<div class="item">
				            			<a href="javascript:">
				            				<span class="icon"><img src="${contextPath}/img/icon15.png"/></span>
				            				<h4>个人数据中心</h4>
				            			</a>
				            		</div>		
				            		<div class="item">
				            			<a href="javascript:">
				            				<span class="icon"><img src="${contextPath}/img/icon16.png"/></span>
				            				<h4>家庭经济困难学生认定申请表</h4>
				            			</a>
				            		</div>		
				            		<div class="item">
				            			<a href="javascript:">
				            				<span class="icon"><img src="${contextPath}/img/icon17.png"/></span>
				            				<h4>学费和国家助学贷款代信申请表</h4>
				            			</a>
				            		</div>		
				            		<div class="item">
				            			<a href="javascript:">
				            				<span class="icon"><img src="${contextPath}/img/icon18.png"/></span>
				            				<h4>学生学费减免审批表</h4>
				            			</a>
				            		</div>		
				            		<div class="item">
				            			<a href="javascript:">
				            				<span class="icon"><img src="${contextPath}/img/icon19.png"/></span>
				            				<h4>科研用印申请</h4>
				            			</a>
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
			
			
			
  			var titType = $('#titType');
			$('.head .item').click(function(){
				titType.html($(this).text())
			})
		})
	</script>
</html>