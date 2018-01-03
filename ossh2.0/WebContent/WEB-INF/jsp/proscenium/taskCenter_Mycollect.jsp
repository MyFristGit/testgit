<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>西科E站</title>
    	 <link rel="shortcut icon" href="${contextPath}/static/proscenium/images/xkd.ico" /> 
		<link href="${contextPath}/static/proscenium/css/index.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/static/proscenium/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
        <script src="${contextPath}/static/proscenium/js/jquery-1.10.2.min.js" type="text/javascript"></script>
         <link href="./static/proscenium/css/dialog.css" rel="stylesheet" type="text/css"/>
         <script src="./static/proscenium/js/commonDialog.js" type="text/javascript"></script>
   
    </head>
	<body>
         <div class="head_bg c">
            <div class="logo"><a href="findex.html"><img src="${contextPath}/static/proscenium/images/logo.png"></a></div>
            <div class="top_form">
                    <input class="but" type="submit" name="button" id="search_taskCenter" value="">
                    <input class="text" type="text" name="text" value="" id="searchCenterText" placeholder="搜索"/>
            </div>
            <%@ include file="head.jsp"%> 
        </div>
        <div class="zhezhao"></div>
        <div class="min c">
        	<div class="left">
				<div class="scrollContent" style="width:100%; height:100%;">
				<div class="nav">
				<h4>服务类别</h4>
       				 <ul>
                       <c:if test="${serviceTypeList != null && fn:length(serviceTypeList)>0}">
                        <c:forEach items="${serviceTypeList}" var="st">
                            <li>
                               <a style="background: url(typeImg.html?id=${st.typeId}) no-repeat 10px center;" href="javascript:void(0);" onclick="subgoMyCollect(${st.typeId},this);"><span>${st.typeName}</span></a>
                            </li>
                        </c:forEach>    
                        </c:if>
                      </ul>
                  </div>
                    
                </div>
            </div>
            <div class="right">
                  <%@ include file="taskCenter_common.jsp"%> 
            </div>
        </div>
    </body>
</html>
<script>
/*
	$(function(){
		$('.zuixin ul li').click(function(){
			$('.zhezhao').show();
			$('.cgsp').show();
		})
		$('.guanbi').click(function(){
			$('.zhezhao').hide();
			$('.cgsp').hide();
		})
	});
	*/
</script>
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
<script>
var autoLb = false;          //autoLb=true为开启自动轮播
var autoLbtime = 1;         //autoLbtime为轮播间隔时间（单位秒）
var touch = true;           //touch=true为开启触摸滑动
var slideBt = true;         //slideBt=true为开启滚动按钮


var slideNub;               //轮播图片数量




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
function subgoMyCollect(id,me){
	$(".left a").removeClass("aActive");
	$(me).addClass("aActive");
	$.post('serviceByMyCollectType.html?id='+id, function(data) {
		$('#sfqhContent').html(data);
		dialogAddEvent();
		
	});
}

//右滑动
function right(){
    var fy = new Array();
    for(i=0;i<slideNub;i++){
        fy[i]=$(".slide .img[data-slide-imgId="+i+"]").attr("class");
    }
    for(i=0;i<slideNub;i++){
        if(i==0){
            $(".slide .img[data-slide-imgId="+i+"]").attr("class",fy[slideNub-1]);
        }else{
           $(".slide .img[data-slide-imgId="+i+"]").attr("class",fy[i-1]); 
        }
    }
    imgClickFy();
    slideLi();
}


//左滑动
function left(){
    var fy = new Array();
    for(i=0;i<slideNub;i++){
        fy[i]=$(".slide .img[data-slide-imgId="+i+"]").attr("class");
    }
    for(i=0;i<slideNub;i++){
        if(i==(slideNub-1)){
            $(".slide .img[data-slide-imgId="+i+"]").attr("class",fy[0]);
        }else{
           $(".slide .img[data-slide-imgId="+i+"]").attr("class",fy[i+1]); 
        }
    }
    imgClickFy();
    slideLi();
}


//轮播图片左右图片点击翻页
function imgClickFy(){
    $(".slide .img").removeAttr("onclick");
    $(".slide .img2").attr("onclick","left()");
    $(".slide .img4").attr("onclick","right()");
}


//修改当前最中间图片对应按钮选中状态
function slideLi(){
    var slideList = parseInt($(".slide .img3").attr("data-slide-imgId")) + 1;
    $(".slide-bt span").removeClass("on");
    $(".slide-bt span[data-slide-bt="+slideList+"]").addClass("on");
}


//轮播按钮点击翻页
function tz(id){
    var tzcs = id - (parseInt($(".slide .img3").attr("data-slide-imgId")) + 1);
    if(tzcs>0){
        for(i=0;i<tzcs;i++){
            setTimeout(function(){
              right();  
            },1);
        }
    }
    if(tzcs<0){
        tzcs=(-tzcs);
        for(i=0;i<tzcs;i++){
            setTimeout(function(){
              left();  
            },1);
        }
    }
    slideLi();
}


//触摸滑动模块
function k_touch() {
    var _start = 0, _end = 0, _content = document.getElementById("slide");
    _content.addEventListener("touchstart", touchStart, false);
    _content.addEventListener("touchmove", touchMove, false);
    _content.addEventListener("touchend", touchEnd, false);
    function touchStart(event) {
        var touch = event.targetTouches[0];
        _start = touch.pageX;
    }
    function touchMove(event) {
        var touch = event.targetTouches[0];
        _end = (_start - touch.pageX);
    }

    function touchEnd(event) {
        if (_end < -100) {
            left();
            _end=0;
        }else if(_end > 100){
            right();
            _end=0;
        }
    }
}

</script>


