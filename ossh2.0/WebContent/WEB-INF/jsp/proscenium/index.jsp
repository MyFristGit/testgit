<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.udata.osp.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="shortcut icon" href="${contextPath}/static/proscenium/images/xkd.ico" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    	<title>西科E站</title>
    	<link href="${contextPath}/static/proscenium/css/awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
		<link href="${contextPath}/static/proscenium/css/index.css" rel="stylesheet" type="text/css"/>
        <!-- <link href="${contextPath}/static/proscenium/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />  -->
        <script src="${contextPath}/static/proscenium/js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="${contextPath}/static/proscenium/js/servicesUl.js" type="text/javascript"></script>
        <link href="${contextPath}/static/proscenium/css/dialog.css" rel="stylesheet" type="text/css"/>
        <script src="${contextPath}/static/proscenium/js/commonDialog.js" type="text/javascript"></script>
        <script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.easing.1.3.js"></script>
		<!-- <script src="${contextPath}/static/proscenium/js/jquery.mCustomScrollbar.concat.min.js"></script> -->
		<script src="${contextPath}/static/proscenium/js/login.js"></script>
		<script src="${contextPath}/static/proscenium/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.tipsStatic2.js"></script>
		<script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.tabs.js"></script>
		        
<style>         	
				/*内部提示*/			
			   .jq_tips_box2{
			  	 padding:10px;position:absolute;overflow:hidden;display:inline;z-index:10176523;
			   }
			   .jq_tips_arrow2{
			   	display:block;width:0px;height:0px;position:absolute;
			   }
			   .jq_tips_top2{
			   	border-left:10px solid transparent;left:20px;bottom:0px;
			   }
			  .jq_tips_left2{
			    	border-top:10px solid transparent;right:0px;top:18px;
			  }
			   .jq_tips_bottom2{
			  	 	border-left:10px solid transparent;left:20px;top:0px;
			  	 }
			   .jq_tips_right2{
			  	 border-top:10px solid transparent;left:0px;top:18px;
			  	 }
			   .jq_tips_info2{
				   word-wrap: break-word;word-break:normal;
				   border-radius:4px;padding:5px 8px;max-width:130px;
				   overflow:hidden;box-shadow:1px 1px 1px #999;
				   font-size:12px;cursor:pointer;
				   min-width: 100px;
			   }
			   
			   
			   .TipRight{
			        top:-30px;left:110px; 
			   }
			   
			   .TipRight   .jq_tips_right2{
			        border-right: 10px solid #0b93a9;top:50px;left:0px;	right:auto;	
			   }
			   
			   
			   .TipRight   .jq_tips_info2{
			       background-color:#0b93a9;border:3px solid #0b93a9;color: rgb(255, 255, 255);	
			   }
			   
			   
			    .TipLeft{
			        top:-30px;right:110px; 
			   }
			   
			   .TipLeft   .jq_tips_right2{
			        border-left: 10px solid #0b93a9;top:50px;right:0px;	left:auto;	
			   }
			   
			   
			   .TipLeft   .jq_tips_info2{
			       background-color:#0b93a9;border:3px solid #0b93a9;color: rgb(255, 255, 255);	
			   }
			   
			   
			   
			   	   
         </style>
   
   
    </head>
	<body>
	
	<c:choose>
		<c:when test="${sessionScope.user == null }">
			<div class="head_bg c">
		      	<div class="logo"><a href="findex.html"><img src="${contextPath}/static/proscenium/images/logo.png"  style="width: 113px;height:33px;"  /></a></div>
			      <div class="top_form">
			              <input class="but" type="submit" name="button" id="search" value=""/>
			              <input class="text" type="text" name="text" id="searchText" placeholder="搜索"/>
			      </div>
			     <%@ include file="head_index.jsp"%> 
			 </div>
		</c:when>
		<c:otherwise>
		 
		 <div class="head_bg c">
            <div class="logo"><a href="findex.html"><img src="${contextPath}/static/proscenium/images/logo.png"  style="width: 113px;height:33px;"  /></a></div>
            <div class="top_form">
                    <input class="but" type="submit" name="button" id="search" value="">
                    <input class="text" type="text" name="text" value="" id="searchText" placeholder="搜索"/>
            </div>
            <%@ include file="head.jsp"%> 
        </div>
		</c:otherwise>
	</c:choose>
	
	
  
        <div class="zhezhao"></div>
        <div class="zz_denglu">
        	<span class="guanbi"></span>
            <h4 class="bt">登录</h4>
            <div id="loginbox" class="form">
            	<form id="signupForm">
                    <div class="youxiang">
                    	<input class="text" type="text" id="username" name="username" value="" placeholder="请输入用户名" />
                    </div>
                    <div class="mima">
                    	<input class="text" type="password" id="password" name="password" value="" placeholder="请输入密码"/>
                        <a href="#">忘了？</a>
                    </div>
                    <input class="but" id="login" value="登录" onclick="severCheck();"  />
               </form>
            </div>
           
        </div>
        <div class="min c" id="content">
        	<div class="left">
                <div class="scrollContent  testScroll" style="width:100%; height:100%;">
                      <div class="cnxh c">
                        <h4>服务类别</h4>
                        <ul>
                        	 <li class="leftLi   doLeftLiImg"  >
				              	<a href="javascript:void(0);">
                                    <i><img src="typeImg.html?id=1" onclick="subgo(1,this);"/></i>
                                    <p>全部</p>
                                </a>
					         </li>
                          <c:forEach items="${serviceTypeList}" var="st">
				              <li  class="doLeftLiImg">
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
                <div class="scrollContent   " style="width:100%; height:100%;">
                	<div class="fr_ct">
                        <div class="container">
                            <div id="slide" class="slide" class="index-slide" alt="star">
                                <!-- 轮播图片数量可自行增减 -->
                               
                                <c:forEach items="${bannerList}" var="tt">
                                	<c:choose>
                                		<c:when test="${tt.banner_id == 26}">
                                			<a href="http://www.xust.edu.cn/info/1065/17630.htm" target="_blank">
                                				<div class="img"><img src="imgBanner.html?id=${tt.banner_id}" /></div>
                                			</a>
                                		</c:when>
                                		<c:otherwise>
                                		       <a href="#">
                                		       	<div class="img"><img src="imgBanner.html?id=${tt.banner_id}"/></div>
                                		       </a>
                                		</c:otherwise>
                                	</c:choose>
					       	   </c:forEach>
                                
                                <div class="slide-bt"></div>
                            </div>
                        </div>

                        <div class="fr_nav" >
                            <ul  id="servicesUl">
                                
                                
                                
                               
                            </ul>
                        </div>
                        <div id="serviceContent">
                        <div class="zuixin">
                            <h4>
                                <span  class="active showDown">最新</span>
                               	<span class="showDown">最热</span>
                                <span class="showDown">全部</span> 
                            </h4>
                            <div  class="showBottom">
                               <div class="tab">
                               		<ul class="c"   id="subServices">
		                             <c:forEach items="${zXserviceList}" var="zx">
							              <li  serviceId="${zx.serviceId}">
								               <a class="li_top" href="#">
								                   <span  class="ico-bg1">
								                       <i><img src="img.html?id=${zx.serviceId}"></i>
								                       <c:choose>
															<c:when test="${fn:length(zx.serviceName) > 17  }">
																	<p>${fn:substring(zx.serviceName,0,17)}... </p>
															</c:when>
															<c:otherwise>
															   <p>${zx.serviceName}</p>
															</c:otherwise>
													   </c:choose>
								                   </span>
								               </a>
								                <!-- 
								               <div class="li_bt">
			                                        <span  title="点赞">${zx.praise_count == null ? 0:  zx.praise_count}</span>
			                                        <strong  title="评论">${zx.comment_count==null ?   0: zx.comment_count}</strong>
			                                        <em  title="收藏">${zx.collection_count ==  null?  0:zx.collection_count}</em>
			                                    </div>
			                                    -->
			                                   <div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">

				           		         	  		<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
					           		         		<div class="jq_tips_info2" style="">

					           		         		评论:${zx.comment_count==null ?   0: zx.comment_count}条<br/>点赞:${zx.praise_count == null ? 0:  zx.praise_count}个<br/>收藏:${zx.collection_count ==  null?  0:zx.collection_count}个<br/></div>
				           		         		</div>
								           </li>
							          </c:forEach>
		                            </ul>                           
		                            	 <!-- <a href="#"  class="more">》更多</a> --> 
                               </div>
                               <div  class="tab" style="display:none;">
                               		  <ul class="c"   id="subServicesByHot">
			                              <c:forEach items="${zHserviceList}" var="zh">
								             <li  serviceId="${zh.serviceId}">
								               <a class="li_top" href="#">
								                   <span  class="ico-bg6">
								                       <i><img src="img.html?id=${zh.serviceId}"/></i>
								                       <c:choose>
															<c:when test="${fn:length(zh.serviceName) > 17  }">
																	<p>${fn:substring(zh.serviceName,0,17)}... </p>
															</c:when>
															<c:otherwise>
															   <p>${zh.serviceName}</p>
															</c:otherwise>
													   </c:choose>
								                   </span>
								               </a>
								                <!--  
								                <div class="li_bt">
			                                        <span  title="点赞">${zh.praise_count == null ? 0:  zh.praise_count}</span>
			                                        <strong  title="评论">${zh.comment_count==null ?   0: zh.comment_count}</strong>
			                                        <em  title="收藏">${zh.collection_count ==  null?  0:zh.collection_count}</em>
			                                    </div> 
								                 --> 
								             
								                <div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">
				           		         	  		<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
					           		         		<div class="jq_tips_info2" style="">评论:${zh.comment_count==null ?   0: zh.comment_count}条<br/>点赞:${zh.praise_count == null ? 0:  zh.praise_count}个<br/>收藏:${zh.collection_count ==  null?  0:zh.collection_count}个<br/></div>
				           		         		</div>
								           
			
								           </li>
								           </c:forEach>
			                            </ul>
			                             <!--  <a href="#"  class="more">》更多</a> -->
                           
                               		
                               </div>
                               
                               <div  class="tab" style="display:none;"  id="delayLoad3"  ajaxUrl="allService.html"  delayLoad="true">
                               		<i class="fa fa-spinner fa-spin"   style="font-size:50px;color:blue;margin:20px;"></i>
                               		
                               </div>
                               
                            
                            </div>
                            
                            	
                        </div>
                       
                        </div>
                    </div>             	
                </div>
            </div>
        </div>
        <div class="zhezhao" style=" padding:10% 5%;">
        </div>	
        <div class="xsDialog c">
            <span class="guanbi" style="z-index:99999;"></span>
            	<iframe  id="xsDialogFrame"  src="" scrolling="auto" 
            	style="width:100%;height:100%;border:1px solid green;" frameborder="1" ></iframe>
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
			// window.location.href="/ossh/caslogin.html";
			$('.zhezhao').show();
			$('.zz_denglu').show();
		})
		
		$(document).keyup(function(event) {
			 if(!$(".zz_denglu").is(":hidden")){
				if (event.keyCode == 13) {
					$("#login").trigger("click");
				}
			 }
			if (event.keyCode == 13) {
				 var isFocus=$("#searchText").is(":focus");  
				 if(true==isFocus){ 
				     $("#search").trigger("click");
				 }
			}
		});
		
		
		$('.guanbi').click(function(){
			$('.zhezhao').hide();
			$('.zz_denglu').hide();
			var tips=$(".jq_tips_box");
			 tips.fadeOut('fast',function(){
                 tips.remove();
             });
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

<script>
    (function ($) {
        $(window).load(function () {
        	/*
            $(".testScroll").mCustomScrollbar({
                theme: "#004e90", //主题颜色
                scrollButtons: {
                    enable: true //是否使用上下滚动按钮
                },
                autoHideScrollbar: true, //是否自动隐藏滚动条
                scrollInertia:500,//滚动延迟
                horizontalScroll: false,//水平滚动条
            });*/
        });
    })(jQuery);
</script>
<script>
var autoLb = true;          //autoLb=true为开启自动轮播
var autoLbtime = 6;         //autoLbtime为轮播间隔时间（单位秒）
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

   var  action=null;
   
    $(".container").hover(function(){
    	
    	if(action){
    		clearInterval(action);
    		action=null;
    	}
    },function(){
    	if(action){
    		clearInterval(action);
    		action=null;
    	}
    	action=setInterval(function(){
            right();
        }, autoLbtime*1000);
    	
    });
    //自动轮播
   
    if(autoLb){
    	action=setInterval(function(){
        right();
    }, autoLbtime*1000);
    }
  //  var MyMar=setInterval(Marquee,speed);
    $("#slide").onmouseover=function() {clearInterval(right())};
    $("#slide").onmouseout=function() {setInterval(right(),autoLbtime*1000)};

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


//服务器校验
function severCheck(){
	if(check()){
		var loginname = $("#username").val();
		var password = $("#password").val();
		var code = "qq123456789fh"+loginname+",fh,"+password+"QQ987654321fh";
		$.post('login.html?code='+code, function(data) {
			if("success" == data){
				//saveCookie();
				window.location.href="taskCenter.html";
			}else if("usererror" == data){
				$("#username").tips({
					side : 1,
					msg : "用户名或密码有误",
					bg : '#FF5080',
					time : 15
				});
				$("#username").focus();
				return;
			}else{
				$("#username").tips({
					side : 1,
					msg : "缺少参数",
					bg : '#FF5080',
					time : 15
				});
				$("#username").focus();
				return;
			}
		});
	}
}


//客户端校验
function check() {
	if ($("#username").val() == "") {
		$("#username").tips({
			side : 2,
			msg : '用户名不得为空',
			bg : '#AE81FF',
			time : 3
		});

		$("#username").focus();
		return false;
	} else {
		$("#username").val(jQuery.trim($('#username').val()));
	}

	if ($("#password").val() == "") {

		$("#password").tips({
			side : 2,
			msg : '密码不得为空',
			bg : '#AE81FF',
			time : 3
		});

		$("#password").focus();
		return false;
	}
	

	$("#loginbox").tips({
		side : 1,
		msg : '正在登录 , 请稍后 ...',
		bg : '#68B500',
		time : 3
	});

	return true;
}

function  doTab(){	
   
    
     $.tan.tab({
    	 hover:true,
    	 title:".zuixin .showDown",
    	 tab:".showBottom  .tab",
    	 callback:function(data){
    			$("#index_ajax_allServices li a").tipsStaticTwo();
    			$("body  #index_ajax_allServices").delegate("li","click",function(e){	
    				$.fn.tipsStaticTwo.closeAll();
    				openDialogBySrc({src:"./serviceWelcome.html?id="+$(this).attr("serviceId")});
    		    	e.stopPropagation();
    		    	
    			});
    			
    			setTimeout(function(){
    				// $(".scrollContent").mCustomScrollbar("update");
    			},1000);
    			
    	 },	callbackClick:function(index,data){
    		// alert("每次点击执行"+index);
    		// $(".scrollContent").mCustomScrollbar("update");
        		// if(!resizeEcharts  && index==1){
            		// resizeEcharts=true;
            		// guideStudent.resize(); achievements.resize();researchFunding.resize();researchProject2.resize();           		 
           // 	 }
        	 }
     });
     /*
     $.tan.tab.addTab({
    	 hover:true,
    	 title:".zuixin .showDown",
    	 tab:".showBottom  .tab",
    	 index:0,
    	 insertTitle:' <span class="showDown">搜索结果</span> ',
    	 insertTab:' <div  class="tab" style="display:none;"  id="delayLoad3"    >'+
    		'good'+       		
             ' </div>'
     });
     
     
     $.tan.tab.active({
    	 title:".zuixin .showDown",
    	 tab:".showBottom  .tab",
    	 index:0
     });
     
    */
    
    
   //提示
   /*
   $(".tab li").tipsXs({   //selector 为jquery选择器
 		 msg:'评论:300条<br/>点赞:230个<br/>收藏:34个<br/>',    //你的提示消息  必填
		  side:2,  //提示窗显示位置  1，2，3，4 分别代表 上右下左 默认为1（上） 可选
		  color:'#FFF', //提示文字色 默认为白色 可选
		  bg:'grey',//提示窗背景色 默认为红色 可选
		  time:0,//自动关闭时间 默认2秒 设置0则不自动关闭 可选
		  x:0,//横向偏移  正数向右偏移 负数向左偏移 默认为0 可选
		  y:0,//纵向偏移  正数向下偏移 负数向上偏移 默认为0 可选
		 });*/
   /*
    $(".tab li").hover(function(){
    	$(this).tipsXs({   //selector 为jquery选择器
   		 msg:'<a href="www.baidu.com" target="_blank">www.baidu.com</a>',    //你的提示消息  必填
		  side:2,  //提示窗显示位置  1，2，3，4 分别代表 上右下左 默认为1（上） 可选
		  color:'#FFF', //提示文字色 默认为白色 可选
		  bg:'grey',//提示窗背景色 默认为红色 可选
		  time:0,//自动关闭时间 默认2秒 设置0则不自动关闭 可选
		  x:0,//横向偏移  正数向右偏移 负数向左偏移 默认为0 可选
		  y:0,//纵向偏移  正数向下偏移 负数向上偏移 默认为0 可选
		 });
    
    	
    },function(){    
    	$(".jq_tips_box_xs").remove();
    	//if(!$(this).data("closeMe")){
    	//	var tempTime=setTimeout(function(){
    		//	$(".jq_tips_box_xs").remove();
    		//	$(this).data("closeMe",null);
    		//},1000);
    		//$(this).data("closeMe",tempTime);
    		
    	//}
    	
    	
    });
    
    */
    
    $(".tab li a").tipsStaticTwo();
	
}
$(function(){
	doTab();
	$(window).resize(function(){
		fixDialog();
	});
	setTimeout(function(){fixDialog(); },0);
});



 function doLogin(){
	 $(".denglu").trigger("click");	 
 }
window.onload=function(){
	//$(".slide").css("width","100%");
	//$(".zuixin").css("width","100%");
	
}
	

</script>



