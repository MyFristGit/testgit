<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="lzq" uri="http://www.weijia.cn/mytag"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="shortcut icon" href="${contextPath}/static/proscenium/images/xkd.ico" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    	<title>西科E站</title>
		<link href="${contextPath}/static/proscenium/css/index.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/static/proscenium/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
        <script src="${contextPath}/static/proscenium/js/jquery-1.10.2.min.js" type="text/javascript"></script>
   		<link href="./static/proscenium/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="./static/proscenium/js/jquery.pagination.js" type="text/javascript"></script>
    </head>
	<body>
    	<style>
        	.tob h4 span{width:19%;padding-left:6%;}
        	.min.c {
			    padding: 0 38px 0 21px;
			    min-width: 1007px;			   
			}
        </style>
        <div class="head_bg c">
            <div class="logo"><a href="findex.html"><img src="${contextPath}/static/proscenium/images/logo.png"></a></div>
            <div class="top_form"  style="display:none;">
                <form action="" method="post"   >
                    <input class="but" type="submit" name="button" id="search" value="">
                    <input class="text" type="text" name="text" value="" id="searchText" placeholder="搜索"/>
                </form>
            </div>
            <%@ include file="head.jsp"%> 
        </div>
        
	
	
	
        <div class="zhezhao"></div>
        <div class="min c">
            <div>
                <div style="width:100%; height:100%; overflow-y:auto;">
                	<div class="fr_ct">
						<div class="dqwz">
                        	<h4>
                            	<a href="findex.html">首页</a>
                                <span> > </span>
                                <a href="taskCenter.html">我的服务</a>
                                 <span> > </span>
                                <a href="taskCenter_sp.html" class="link">待办理</a>
                            </h4>
                            
                        
                        </div>
                        
                        <div class="pdg55">
                            <div class="yw_xq">
                            	<div class="tob">
                                	<h4>
                                        <strong>事项名称</strong>
                                        <i>&nbsp;</i>
                                        <span>状态</span>
                                        <em>更改时间</em>
                                    </h4>
                                	<ul class="tr">
                                    	<c:forEach items="${processList}" var="process">
                                    	<li>
                                        	<div class="top">
                                                <a href="${process.url}" target="_blank"><h5>${process.name}</h5></a>
                                              
                                                <span>
                                                	<div class="bord">
                                                		<strong>待办理</strong>
                                                        <em></em>
                                                    </div>
                                                </span>
                                                <i>${process.updateDate }</i>
                                            </div>
                                        </li>
                                        </c:forEach>
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
				//$(this).find('span').append("<b>评论留言</b>"); 
			}else if(thishtml=="失败"){
				$(this).find('span').addClass("hong");
			}else{};
			$(this).find('span b').click(function(){
				$('.zhezhao').show();
				$('.pinglun').show();
			});
		});
		$('.pinglun .form .but span').click(function(){
			$('.zhezhao').hide();
			$('.pinglun').hide();
		})
		
		$(".tob .tr li .top .bord").click(function(){
			$(this).parents('li').find('.bottom').slideToggle();
			$(this).toggleClass("link"); 
		})

		
		$('.left,.right').height($(window).height()-76);
	});
</script>
<script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.easing.1.3.js"></script>
<script src="${contextPath}/static/proscenium/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
    (function ($){
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
    
    
    
    /** 
     * 监听打开的弹窗，关闭后刷新页面 
     */  
    function openWin(url,text,winInfo){  
        var winObj = window.open(url,text,winInfo);  
        var loop = setInterval(function() {       
            if(winObj.closed) {      
                clearInterval(loop);      
                //alert('closed');      
                parent.location.reload();   
            }      
        }, 1);     
    }  
</script>



