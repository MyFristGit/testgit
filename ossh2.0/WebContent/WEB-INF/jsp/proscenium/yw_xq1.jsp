<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!doctype html>
<html>
    <head>
    <meta charset="utf-8">
    	<title>无标题文档</title>
		<link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>
	<body>
        <div class="head_bg c">
            <div class="logo"><a href="index.html"><img src="images/logo.png"></a></div>
            <div class="top_form">
                <form action="" method="post">
                    <input class="but" type="submit" name="button" id="button" value="">
                    <input class="text" type="text" name="text" value="" placeholder="搜索">
                </form>
            </div>
            <div class="top_right">
            	<!--登录样式  这里默认显示-->
            	<div class="denglu c">
                	<i><img src="images/touxiang_1.png"></i>
                    <p>登录</p>
                </div>
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
                        <i><img src="images/touxiang_1.png"></i>
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
        <div class="zz_denglu">
        	<span class="guanbi"></span>
            <h4 class="bt">登录</h4>
            <p class="wenben">您好，请用西科大校园账户登录系统</p>
            <div class="form">
                <form action="" method="post">
                    <div class="youxiang">
                    	<i>邮箱</i>
                    	<input class="text" type="text" name="text" value="">
                        <strong>@xust.edu</strong>
                    </div>
                    <div class="mima">
                    	<i>密码</i>
                    	<input class="text" type="password" name="text" value="">
                        <a href="#">忘了？</a>
                    </div>
                    <input class="but" type="submit" name="button" id="button" value="登录">
                </form>
            </div>
            <span class="foot">
            	<a href="#" style="color:#b6b6b6;">忘记科大邮箱？</a>
                <a href="#" style="color:#3fc0f1;">进入xxx服务找回密码</a>
            </span>
        </div>
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
                                    <i><img src="images/cnxh_1.jpg"></i>
                                    <p>校园安全</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="images/cnxh_2.jpg"></i>
                                    <p>多彩园区</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="images/cnxh_3.jpg"></i>
                                    <p>招聘信息</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="images/cnxh_4.jpg"></i>
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
                            	<a href="#">业务大厅</a>
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
                                    <a href="#">申请人</a>
                                    <a href="#" class="link">审批人</a>
                                </div>
                                <div class="zhongjian">
                                	<a href="#" class="link">全部</a>
                                    <a href="#">受理中</a>
                                    <a href="#">完成</a>
                                </div>
                                
                            </div>
                            <div class="yw_xq">
                            	<div class="tob">
                                	<h4>
                                        <strong>事项名称</strong>
                                        <i>申请人</i>
                                        <span>状态</span>
                                        <em>更改时间</em>
                                    </h4>
                                	<ul class="tr">
                                    	<li>
                                        	<div class="top">
                                                <h5>羽毛球馆预定</h5>
                                                <p>李磊</p>
                                                <span><strong>受理中</strong><em></em></span>
                                                <i>2017-04-10</i>
                                            </div>
                                        </li>
                                    	<li>
                                        	<div class="top">
                                                <h5>羽毛球馆预定</h5>
                                                <p>李磊</p>
                                                <span><strong>完成</strong><em></em></span>
                                                <i>2017-04-10</i>
                                            </div>
                                        </li>
                                    	<li>
                                        	<div class="top">
                                                <h5>羽毛球馆预定</h5>
                                                <p>李磊</p>
                                                <span><strong>失败</strong><em></em></span>
                                                <i>2017-04-10</i>
                                            </div>
                                        </li>
                                    	<li>
                                        	<div class="top">
                                                <h5>羽毛球馆预定</h5>
                                                <p>李磊</p>
                                                <span><strong>受理中</strong><em></em></span>
                                                <i>2017-04-10</i>
                                            </div>
                                        </li>
                                    	<li>
                                        	<div class="top">
                                                <h5>羽毛球馆预定</h5>
                                                <p>李磊</p>
                                                <span><strong>完成</strong><em></em></span>
                                                <i>2017-04-10</i>
                                            </div>
                                        </li>
                                    	<li>
                                        	<div class="top">
                                                <h5>羽毛球馆预定</h5>
                                                <p>李磊</p>
                                                <span><strong>失败</strong><em></em></span>
                                                <i>2017-04-10</i>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
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
		$('.tr li .top').each(function(){
			var thishtml=$(this).find('span strong').text();
			if(thishtml=="受理中"){
				$(this).find('span').addClass("huang");
			}else if(thishtml=="完成"){
				$(this).find('span').addClass("lue");
			}else if(thishtml=="失败"){
				$(this).find('span').addClass("hong");
			}else{};
		});
		$('.left,.right').height($(window).height()-76);
	});
</script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
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



