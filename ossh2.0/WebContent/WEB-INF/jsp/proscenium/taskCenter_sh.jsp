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
    </head>
	<body>
         <div class="head_bg c">
            <div class="logo"><a href="index.html"><img src="${contextPath}/static/proscenium/images/logo.png"></a></div>
            <%@ include file="head.jsp"%> 
        </div>
        <div class="zhezhao"></div>
        <div class="min c">
             <div class="left">
                <div class="scrollContent" style="width:100%; height:100%;">
                    <div class="nav">
                        <h4>服务类别</h4>
                        <ul>
                          <c:forEach items="${serviceTypeList}" var="st">
                            <li  class="leftLi">
                                <a style="background: url(typeImg.html?id=${st.typeId}) no-repeat 10px center;background-size:contain;" href="javascript:void(0);" onclick="subgo(${st.typeId},this);"><span>${st.typeName}</span></a>
                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                    <div class="cnxh c">
                        <h4>业务直通车</h4>
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
            </div>
            <div class="right">
                <div class="scrollContent" style="width:100%; height:100%;">
                	<div class="fr_ct">
                		<div class="dqwz">
                        	<h4>
                            	<a href="findex.html">首页</a>
                                <span> > </span>
                                <a href="taskCenter.html">我的服务</a>
                            </h4>
                        </div>
                        <div class="pdg55">
                         <div class="head">
                                <div class="sosu">
                                        <input class="text" type="text" name="text"  id="" placeholder="请输入事项类型或名称"/>
                                        <input class="but" type="text" name="button" id="" />
                                </div>
                                <div class="youbian">
                                	<span>您是：</span>
                                    <a href="javascript:void(0);" id="sqr" >申请人</a>
                                    <a href="javascript:void(0);" id="shr" class="link">审批人</a>
                                </div>
                            </div>
                            </div>
                        <div class="zuixin" id="sfqhContent">
                        	<ul class="c" id="s">
                        	<c:forEach var="bl" items="${blsList}">
							     <li>
							         <a class="li_top" href="taskCenter_sp.html?code=${bl.code}">
							             <span  class="ico-bg1">
							                 <i><img src="img_name.html?name=${bl.appname}"></i>
							             </span>
							              <c:choose>
												<c:when test="${fn:length(bl.appname) > 17  }">
												<p>${fn:substring(bl.appname,0,17)}... </p>
												</c:when>
												<c:otherwise>
													<p> ${bl.appname}</p>
												</c:otherwise>
											</c:choose>
							         </a>
							         <div class="li_sp">
							             <span>
							              	<strong>
							                  	<p>已审批 ${bl.donecount}</p>
							                  </strong>
							              	<strong>
							                  	<p>待审批 ${bl.backlogcount}</p>
							                  </strong>
							              </span>
							         </div>
							     </li>
    						 </c:forEach>
 							</ul>
                        </div>
                    </div>             	
                </div>
            </div>
        </div>
        <div class="zhezhao" style=" padding:10% 5%;">
        </div>	
        <div class="cgsp c">
            <span class="guanbi" style="z-index:99999;"></span>
            <div class="fl">
                <div class="conter">
                    <div class="top_img"><img src="${contextPath}/static/proscenium/images/cgsp_img.jpg"></div>
                    <div class="sydx">
                        <span>适用对象</span>
                        <i>教师</i>
                    </div>
                    <div class="fenxiang">
                        <ul>
                            <li class="ico_1">
                                <span>赞？</span>
                                <i>6 likes</i>
                            </li>
                            <li class="ico_2">
                                <span>49浏览</span>
                            </li>
                            <li class="ico_3">
                                <span>分享</span>
                            </li>
                            <li class="ico_4">
                                <span>收藏</span>
                            </li>
                            <li class="ico_5">
                                <span>评论</span>
                            </li>
                        </ul>
                        <a href="#">跳转至服务</a>
                    </div>
                </div>
            </div>
            <div class="fr">
                <div class="conter">
                    <div class="text_top">
                        <span>最新服务</span>
                        <h4>
                            <span>教职工因公短期出国申请审批</span>
                            <i>办理时间</i>
                            <i>周一至周五</i>
                            <i>早9点至下午5点</i>
                        </h4>
                        <h5>服务简介</h5>
                        <p>
                            为所有教职工（出科教人员）提供短期出国申请，经过国合处初审后单位初审公示，由经管部门初审，经费主管部门审核，提交财务部审批，单位出示公示后经单位审批，在																 							根据所在行政级别有组织不审批，分管校领导神品后，最终提交国合出审批，外交主管校领导审批，校长审批，校办秘书审批，校长书记审批后最终由国合处制作批文。
                        </p>
                    </div>
                    <div class="liucheng">
                        <img src="${contextPath}/static/proscenium/images/liucheng_img.jpg">
                    </div>
                    <div class="foot">
                        <h5>类似服务</h5>
                        <ul>
                            <li>
                                <a href="#">
                                    <i><img src="${contextPath}/static/proscenium/images/foot_img1.jpg"></i>
                                    <p>招聘信息</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="${contextPath}/static/proscenium/images/foot_img2.jpg"></i>
                                    <p>多彩园区</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="${contextPath}/static/proscenium/images/foot_img3.jpg"></i>
                                    <p>吃货指南</p>
                                </a>
                            </li>
                        </ul>
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
<script src="${contextPath}/static/proscenium/js/taskCenter.js"></script>
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
<script>
var autoLb = false;          //autoLb=true为开启自动轮播
var autoLbtime = 1;         //autoLbtime为轮播间隔时间（单位秒）
var touch = true;           //touch=true为开启触摸滑动
var slideBt = true;         //slideBt=true为开启滚动按钮


var slideNub;               //轮播图片数量




$(function(){

    slideNub = $(".slide .img").size();             //获取轮播图片数量
    for(i=0;i<slideNub;i++){
        $(".slide .img:eq("+i+")").attr("data-slide-imgId",i);
    }


    //根据轮播图片数量设定图片位置对应的class
    if(slideNub==1){
        for(i=0;i<slideNub;i++){
            $(".slide .img:eq("+i+")").addClass("img3");
        }
    }
    if(slideNub==2){
        for(i=0;i<slideNub;i++){
            $(".slide .img:eq("+i+")").addClass("img"+(i+3));
        }
    }
    if(slideNub==3){
        for(i=0;i<slideNub;i++){
            $(".slide .img:eq("+i+")").addClass("img"+(i+2));
        }
    }
    if(slideNub>3&&slideNub<6){
        for(i=0;i<slideNub;i++){
            $(".slide .img:eq("+i+")").addClass("img"+(i+1));
        }
    }
    if(slideNub>=6){
        for(i=0;i<slideNub;i++){
            if(i<5){
               $(".slide .img:eq("+i+")").addClass("img"+(i+1)); 
            }else{
                $(".slide .img:eq("+i+")").addClass("img5"); 
            }
        }
    }


    //根据轮播图片数量设定轮播图按钮数量
    if(slideBt){
        for(i=1;i<=slideNub;i++){
            $(".slide-bt").append("<span data-slide-bt='"+i+"' onclick='tz("+i+")'></span>");
        }
        $(".slide-bt").width(slideNub*34);
        $(".slide-bt").css("margin-left","-"+slideNub*17+"px");
    }


    //自动轮播
    if(autoLb){
        setInterval(function(){
        right();
    }, autoLbtime*1000);
    }


    if(touch){
        k_touch();
    }
    slideLi();
    imgClickFy();
})


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


