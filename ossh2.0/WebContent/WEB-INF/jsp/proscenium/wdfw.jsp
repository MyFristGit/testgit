<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<html>
    <head>
    <meta charset="utf-8">
    <title>西科大 · 一站式服务大厅</title>
		<link href="${contextPath}/static/proscenium/css/index.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/static/proscenium/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
        <script src="${contextPath}/static/proscenium/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>
	<body>
        <div class="head_bg c">
            <div class="logo"><a href="index.html"><img src="${contextPath}/static/proscenium/images/logo.png"></a></div>
          
            <div class="top_right">
            	
                <!--登录后样式 这里在css里被隐藏了-->
                <div class="grzx c">
                	<div class="ico">
                    	<a class="ico_1" href="#"></a>
                        <p>0</p>
                    </div>
                	<div class="ico">
                    	<a class="ico_2" href="#"></a>
                        <p>2</p>
                    </div>
                    <div class="denglu">
                        <i><img src="${contextPath}/static/proscenium/images/touxiang_1.png"></i>
                        <p>李磊</p>
                        <span></span>
                        <div class="xiala">
                            <ul>
                            	<li>
                                	<a class="ico1" href="#">我的服务</a>
                                </li>
                            	<li>
                                	<a class="ico2" href="#">我的收藏</a>
                                </li>
                            	<li>
                                	<a class="ico3" href="#">个人中心</a>
                                </li>
                            </ul>
                            <strong>退出</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="zhezhao"></div>
       
        <div class="min c">
        	<div class="left">
                <div class="scrollContent" style="width:100%; height:100%;">
                    <div class="nav">
                        <h4>服务类别</h4>
                        <ul>
                            <li>
                                <a class="ico_1 link" href="#">公共服务</a>
                            </li>
                            <li>
                                <a class="ico_2" href="#">学生服务</a>
                            </li>
                            <li>
                                <a class="ico_3" href="#">教师服务</a>
                            </li>
                            <li>
                                <a class="ico_4" href="#">科研服务</a>
                            </li>
                            <li>
                                <a class="ico_5" href="#">人事服务</a>
                            </li>
                            <li>
                                <a class="ico_6" href="#">生活服务</a>
                            </li>
                            <li>
                                <a class="ico_7" href="#">后勤服务</a>
                            </li>
                        </ul>
                    </div>
                    <div class="cnxh c">
                        <h4>猜你喜欢</h4>
                        <ul>
                            <li>
                                <a href="#">
                                    <i><img src="${contextPath}/static/proscenium/images/cnxh_1.jpg"></i>
                                    <p>校园安全</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="${contextPath}/static/proscenium/images/cnxh_2.jpg"></i>
                                    <p>多彩园区</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="${contextPath}/static/proscenium/images/cnxh_3.jpg"></i>
                                    <p>招聘信息</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="${contextPath}/static/proscenium/images/cnxh_4.jpg"></i>
                                    <p>吃货指南</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="foot c">
                    	<span>猜对了吗</span>
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="scrollContent" style="width:100%; height:100%;">
                	<div class="fr_ct">
						<div class="dqwz">
                        	<h4>
                            	<a href="#">服务大厅</a>
                                <span> > </span>
                                <a href="#">我的服务</a>
                            </h4>
                        </div>
                        <div class="pdg55">
                        	<div class="head">
                                <div class="sosu">
                                    <form action="" method="post">
                                        <input class="text" type="text" name="text" value="" placeholder="请输入事项类型或名称">
                                        <input class="but" type="submit" name="button" id="button" value="">
                                    </form>
                                </div>
                                <div class="youbian">
                                	<span>您是：</span>
                                    <a href="javascript:void(0);" onclick="sfqh(1);" class="link">申请人</a>
                                    <a href="javascript:void(0);" onclick="sfqh(2);">审批人</a>
                                </div>
                            </div>
                            <div class="kuang c" id="sfqhContent">
                            	<ul>
                                	<li>
                                    	<a href="#">
                                        	<i class="ico_1">教学文具采购</i>
                                            <span>
                                            	<strong>
                                                	<p>已审批</p>
                                                    <em>320</em>
                                                </strong>
                                            	<strong>
                                                	<p>待审批</p>
                                                    <em>20</em>
                                                </strong>
                                            </span>
                                        </a>
                                    </li>
                                	<li>
                                    	<a href="#">
                                        	<i class="ico_2">教学文具采购</i>
                                            <span>
                                            	<strong>
                                                	<p>已审批</p>
                                                    <em>320</em>
                                                </strong>
                                            	<strong>
                                                	<p>待审批</p>
                                                    <em>20</em>
                                                </strong>
                                            </span>
                                        </a>
                                    </li>
                                	<li>
                                    	<a href="#">
                                        	<i class="ico_3">教职工因公短期出国申请审批</i>
                                            <span>
                                            	<strong>
                                                	<p>已审批</p>
                                                    <em>320</em>
                                                </strong>
                                            	<strong>
                                                	<p>待审批</p>
                                                    <em>20</em>
                                                </strong>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                    	<a href="#">
                                        	<i class="ico_3">教职工因公短期出国申请审批</i>
                                            <span>
                                            	<strong>
                                                	<p>已审批</p>
                                                    <em>320</em>
                                                </strong>
                                            	<strong>
                                                	<p>待审批</p>
                                                    <em>20</em>
                                                </strong>
                                            </span>
                                        </a>
                                    </li>
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
<script>
    (function ($) {
        $(window).load(function () {
            $(".scrollContent").mCustomScrollbar({
                theme: "#004e90", //主题颜色
                scrollButtons: {
                    enable: true //是否使用上下滚动按钮
                },
                autoHideScrollbar: true, //是否自动隐藏滚动条
                scrollInertia:300,//滚动延迟
                horizontalScroll: false,//水平滚动条
            });
        });
    })(jQuery);
</script>




