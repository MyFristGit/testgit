<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="mask-bg" id="funWin">
			<div class="win funbox">
				<div class="wintop">
					<div class="winlogo"><img src="${contextPath}/img/icon15.png"/></div>
					<div class="info">
						<div class="name">云计算资源使用申请</div>
						<div class="txt">办理时间： 星期一到星期五（上午09:00～11:30；下午13:00～17:30）</div>
					</div>
					<a href="javascript:" class="btn-no"></a>
				</div>
				<div class="cont clearfix">
					<div class="winleft">
						<h3 class="tit">服务类型：教师服务</h3>
						<ul class="menu">
							<li>
								<span class="fl">4人点赞</span>
								<span class="icon icon-goods"></span>							
							</li>
							<li>
								<span class="fl">加入收藏</span>
								<span class="icon icon-love"></span>							
							</li>
							<li>
								<a href="javascript:">
									<span class="fl col">简介</span>
									<img src="${contextPath}/img/icon45.png" style="margin-top: 14px"/>
								</a>								
							</li>
							<li>
								<a href="javascript:">
									<span class="fl">评论（199）</span>
									<img src="${contextPath}/img/icon46.png"/>
								</a>								
							</li>
						</ul>
						<div class="tips">您没有权限办理</div>
						<a href="javascript:" class="btn-c btn-login btn-sub">开始办理</a>
					</div>
					<div class="winright">
						<h3 class="tit">服务简介</h3>
						<div class="det">
							<p class="p1">文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。</p>
							<img src="${contextPath}/img/banner1.jpg" width="100%" />
							<p class="p1">文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。文字内容，后台修改。</p>
						</div>
						<div class="end">
							<h3 class="tit">推荐服务</h3>
							<div class="clearfix fun-list">
								<div class="fun-item">
									<a href="javascript:">
										<span class="icon"><img src="${contextPath}/img/icon16.png"/></span>
										<div class="txt">家庭经济困难学生认定申请表</div>
									</a>
								</div>
								<div class="fun-item">
									<a href="javascript:">
										<span class="icon"><img src="${contextPath}/img/icon16.png"/></span>
										<div class="txt">家庭经济困难学生认定申请表</div>
									</a>
								</div>
								<a href="javascript:" class="btn-tips">不再提示</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>