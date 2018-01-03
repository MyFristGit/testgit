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
        <link href="${contextPath}/static/proscenium/css/awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
       <script src="${contextPath}/static/proscenium/js/jquery-1.10.2.min.js" type="text/javascript"></script>
      <script src="${contextPath}/static/proscenium/js/jquery.easing.1.3.js" type="text/javascript"></script>
       <link href="./static/proscenium/css/dialog.css" rel="stylesheet" type="text/css"/>
       <script src="./static/proscenium/js/commonDialog.js" type="text/javascript"></script>    
       <script src="./static/proscenium/js/echarts.min.js" type="text/javascript"></script> 
       <script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.tips.js"></script> 
         <script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.tipsStatic2.js"></script>
       <script src="${contextPath}/static/proscenium/js/jquery.gridly.js" type="text/javascript"></script>
		<link href="${contextPath}/static/proscenium/css/jquery.gridly.css" rel="stylesheet" type="text/css" />  
        <link href="./static/proscenium/css/dialog.css" rel="stylesheet" type="text/css"/>
         <link href="./static/proscenium/css/awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
         <script src="./static/proscenium/js/commonDialog.js" type="text/javascript"></script>
         <script src="${contextPath}/static/proscenium/js/login.js"></script>
         <script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.tabs.js"></script>
       
       <style>
       .main{
         min-width:1007px;
         max-width:1007px;
         display: block;
		     padding: 0 21px 0 21px;
		    margin: 5px auto 1px;
		    position: relative;
		    z-index: 1;
       }
       .article{
       
       }
       .top{
          	 height: 140px;
		    color: #096960;
		    background-size: cover;
		    display:relative;
		     border-radius: 10px;	
       }
       
       .top img {
	    float: left;
	    margin-left: 44px;
	    margin-right: 26px;
	    margin-top: 16px;
    }
	img {
	    border: 0;
	    vertical-align: middle;
	}
	.top h3 {
	    font-size: 20px;
	    line-height: 32px;
	    padding-top: 40px;
	    margin-left:20px;
	    margin-bottom: 4px;
	    color: #096960;
	    font-weight: 700;
	    letter-spacing:10px;
	}
	
	.top-caption {
	    font-size: 15px;
	    line-height: 20px;
	}
	.mr-16 {
	    margin-right: 16px!important;
	}
	a.more{
	    background-color: transparent;
	    color: #00bcd4;
	    text-decoration: none;
	    font-size:15px;
	}
	.top .show{
	    display: absolute;
	    position: absolute;
	    right: 100px;
	    top: 10px;
	    font-size: 10px;
	    font: bold 30px/100% "微软雅黑", "Lucida Grande", "Lucida Sans", Helvetica, Arial, Sans;
	    text-shadow: 0 0 20px #b5aeae;
	     color:#776e63;
	}
	.detail{
	    border-radius: 10px;
	    border: 1px solid white;
	}
	.detail  b{
	    display: inline-block;
	    line-height: 16px;
	    padding: 0px 7px;
	    border-left: 2px solid #2196f3;
	    margin-left: 20px;
	    font-size: 18px;	
	}
	.unit{
		float: right!important;
	}
	.detail  .pos{
		text-align: center;
 	   display: inline-block;
	
	}
	
	.circle{
	    width: 200px;
	    height: 200px;
	    text-align: center;
	    line-height: 200px;
	    color: rgb(255, 255, 255);
	    font-size: 24px;
	    border-radius: 50%;
	    background: rgb(0, 153, 255);
	    margin: 30px 10px 10px;
	
	}
	.circle2{
	    width: 200px;
	    height: 200px;
	    text-align: center;
	    line-height: 200px;
	    color: rgb(255, 255, 255);
	    font-size: 24px;
	    border-radius: 50%;
	    background: rgb(249, 190, 62);
	    margin: 30px 10px 10px;
	
	}
	.detail  b{
	    display: inline-block;
	    line-height: 16px;
	    margin-left: 20px;
	    font-size: 18px;
	    padding: 0px 7px;
	    border-left: 2px solid rgb(33, 150, 243);
	    font-weight: 700;
	}
	.assets{
	   margin-top:10px;
	
	}
	.assets  .showDetail{
		    text-align: right;
		    position: absolute;
		    width: 300px;
		    height: 23px;
		    right:150px;
	
	}
	.move.ui-sortable-handle {
    height: 18px;
    width: 18px;
    cursor: pointer;
    display: inline-block;
    background: url(${contextPath}/static/proscenium/images/favicon.png) no-repeat;
   }
   
   
   .zz_xiuGaiMiMa {
    width: 755px;
    height: 500px;
    position: fixed;
    top: 50%;
    margin-top: -234px;
    left: 50%;
    margin-left: -377px;
    background: #fff;
    border-radius: 20px;
    z-index: 999;
    display: none;
}

.zz_xiuGaiMiMa .guanbi {
    display: block;
    width: 47px;
    height: 47px;
    background: url(${contextPath}/static/proscenium/images/guanbi_but.png) no-repeat center;
    position: absolute;
    right: 22px;
    top: 20px;
}

.zz_xiuGaiMiMa .bt {
    margin-top: 46px;
    text-align: center;
    font-size: 20px;
    color: #44c3f1;
}

.zz_xiuGaiMiMa .form {
    width: 388px;
    margin: 0 auto;
    margin-top: 90px;
}

.zz_xiuGaiMiMa .form .youxiang.link {
    border: 2px solid #2fb1ec;
}
.zz_xiuGaiMiMa .form .youxiang {
    width: 100%;
    height: 50px;
    width: 384px;
    border: 2px solid #e6e8ec;
    border-radius: 6px;
    position: relative;
}

.zz_xiuGaiMiMa .form .youxiang input {
    display: block;
    float: left;
    width: 384px;
    height: 50px;
    line-height: 50px;
    border: none;
    padding-left: 10px;
    font-size: 16px;
    background: none;
}

.zz_xiuGaiMiMa .form .youxiang a:hover {
    text-decoration: none;
    cursor:default;
}
.zz_xiuGaiMiMa .form .youxiang a {
    font-size: 16px;
    color: #f00;
    display: block;
    line-height: 28px;
    margin-top: 11px;
    padding-left: 22px;
}


.zz_xiuGaiMiMa .form .mima.link {
    border: 2px solid #2fb1ec;
}
.zz_xiuGaiMiMa .form .mima {
    width: 100%;
    height: 50px;
    width: 384px;
    border: 2px solid #e6e8ec;
    border-radius: 6px;
    position: relative;
    margin-top: 24px;
}

.zz_xiuGaiMiMa .form .mima input {
    display: block;
    float: left;
    width: 384px;
    height: 50px;
    line-height: 50px;
    border: none;
    padding-left: 10px;
    font-size: 16px;
}

.zz_xiuGaiMiMa .form .mima a:hover {
    text-decoration: none;
    cursor:default;
}
.zz_xiuGaiMiMa .form .mima a {
    font-size: 16px;
    color: #f00;
    display: block;
    line-height: 28px;
    margin-top: 11px;
    padding-left: 22px;
}

.zz_xiuGaiMiMa .form .but {
    display: block;
    width: 125px;
    height: 46px;
    text-align: center;
    line-height: 46px;
    border: none;
    background: #2fb1ec;
    font-size: 20px;
    color: #fff;
    cursor: pointer;
    margin: 0 auto;
    margin-top: 64px;
}



.gridly {
    min-width: 1007px;
    max-width: 1007px;
    display: block;
    margin: 5px auto 1px;
    position: relative;
    z-index: 1;
   
  }
  .brick.small {
    width: 491px;
    height: 330px;
   
	    border: 1px solid white;
	  
  }
  .brick.large {
    width: 501px;
    height: 330px;
    background:blue;
      border-radius: 10px;
	    background-color: #FAFAFC;
	    border: 1px solid darkgray;
	    cursor:move;
  }
  
  .alWaysShow{
    z-index: 9999;
    position: fixed;left:0;top:0;width:100%;transition: top .5s;
  }
  
 .top2 {
    color: #096960;
    background-size: cover;
    display: relative;
    border-radius: 10px;
    background-color: #FAFAFC;
    border: 1px solid darkgray;
    padding:5px;
}
  /*顶部通知*/
  ul.topAnnounce li{
  	float:left;
  	margin-right:30px;
  }
  .todo{
      	background: url(${contextPath}/static/proscenium/images/todo.png) center center no-repeat;
	    display: inline-block;
	    width: 48px;
	    height: 30px;
	    background-size: 40px 40px;
  }
  .message{
      	background: url(${contextPath}/static/proscenium/images/message.png) center center no-repeat;
      	background-size: 30px 30px;	
  }
  .tipNumb{
  	background:#f05638;
  	position:absolute;
  	height:19px;
  	line-height:18px;
  	width:20px;
  	top:-15px;
  	right:-20px;
  	border-radius:50%;
  	word-break:keep-all;
  	padding:5px;
  	cursor:pointer;
  	color:white;
  }
  
  /*回到顶部*/
  /*share_start*/
	#share {z-index:2;position:fixed;_position:absolute;_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight)-34+"px");bottom:34px;left:95%;width:30px;zoom:1;}
	#share a{background-image:url(${contextPath}/static/proscenium/images/goTop.png); background-repeat:no-repeat; display:block; width:30px; height:30px; margin-bottom:2px; overflow:hidden; text-indent:-999px;-webkit-transition: all 0.2s ease-in-out;-moz-transition: all 0.2s ease-in-out;-o-transition: all 0.2s ease-in-out;-ms-transition: all 0.2s ease-in-out;transition: all 0.2s ease-in-out;}
	#share a{}
	#share .sina {background-position:0 0; position:absolute; bottom:32px;}
	#share a.sina:hover { background-position:-30px 0;}
	#share .tencent { background-position:0 -30px; position:absolute; bottom:0;}
	#share a.tencent:hover { background-position:-30px -30px;}
	#share a#totop{background-position:0 -120px;position:absolute;bottom:64px;cursor:pointer;}
	#share a#totop:hover {background-position:-30px -120px;}
	/*share_end*/
	
	
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
   
    .dl-main-nav,.dl-tab-conten{	 
       
	    display: block;
	    /* padding: 0 21px 0 21px; */
	    margin-left:50px;
	    position: relative;
	    z-index: 1;
	    height:32px;
    }  
    
    .dl-main-nav {
        height: 40px;
    background-position: center -30px;
    overflow: hidden;
    position: relative;
}
   
   .nav-list .nav-item {
    float: left;
    color: #330d0d;
    text-align:center;
    line-height:40px;
    background:#1e99e6;
    border-right: 1px solid white;
  }
  
  
  .nav-item {
    overflow: hidden;
    font-size: 14px;
    color: white;
    position: relative;
    width: 130px;
  
    cursor: pointer;
    line-height: 40px;
   
}

  
  .nav-list .dl-selected .nav-item-inner {
    -webkit-border-radius: 2px 2px 0 0;
    -moz-border-radius: 2px 2px 0 0;
    border-radius: 2px 2px 0 0;
    border: 1px solid #FFF;
    background-color: #E8E9EE;
    color: #43478e;
    font-weight: bold;
    height: 35px;
    border-top: 4px solid yellow;
}

.nav-list .dl-hover .nav-item-mask, .nav-list .dl-last .nav-item-mask {
    display: block;
}


.nav-item-mask {
    display: none;
    width: 128px;
    height: 40px;
    position: absolute;
    background-color: white;
    top: 0px;
    opacity: .15;
    filter: alpha(opacity=15);
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    border: 1px solid #333;
}

.nav-list .dl-hove .nav-item-mask {
    display: block;
}

   
  
.dl-tab-conten{
height:30px;
}
.dl-tab-conten  ul {
list-style:none;
}
.dl-tab-conten  ul  li{
float:left;
}

.youbian  span, .youbian a,.zhongjian a{
 color:#43484c;
}
.cnxh ul li {
    border:1px   solid  white;
}
.cnxh ul li:hover {
    border:1px   solid  #71c5fa;
}

.breadCrumb{
  padding-top:30px;
}

.breadCrumb h4 {
    padding-left: 35px;
    height: 41px;
    border-bottom: 2px solid #e3e3e3;
    font-size: 20px;
}
.breadCrumb h4 a {
    display: block;
    float: left;
    font-size: 15px;
    color: #c3c6c8;
    margin-left: 10px;
    padding: 0 20px;
    line-height: 30px;
    border-radius: 20px;
    font-weight: bold;
}

.breadCrumb h4 span {
    display: block;
    float: left;
    font-size: 20px;
    color: #8c8c8c;
    font-weight: bold;
    margin: 0 10px;
    margin-top: 1px;
}

.breadCrumb h4 a.link {
    background: #ffc70a;
    color: #151101;
}
.breadCrumb h4 a {
    display: block;
    float: left;
    font-size: 15px;
    color: #c3c6c8;
    margin-left: 10px;
    padding: 0 20px;
    line-height: 30px;
    border-radius: 20px;
    font-weight: bold;
}

       </style>
   
    </head>
	<body   style="">
		
	
        	<c:choose>
				<c:when test="${sessionScope.user == null }">
					<div class="head_bg c">
				      	<div class="logo"><a href="findex.html"><img src="${contextPath}/static/proscenium/images/logo.png"/></a></div>
					      <div class="top_form">
					              <input class="but" type="submit" name="button" id="search" value=""/>
					              <input class="text" type="text" name="text" id="searchText" placeholder="搜索"/>
					      </div>
					     <%@ include file="head_index.jsp"%> 
					 </div>
				</c:when>
				<c:otherwise>
				 
				 <div class="head_bg c">
		            <div class="logo"><a href="findex.html"><img src="${contextPath}/static/proscenium/images/logo.png"></a></div>
		            <div class="top_form">
		                    <input class="but" type="submit" name="button" id="search" value="">
		                    <input class="text" type="text" name="text" value="" id="searchText" placeholder="搜索"/>
		            </div>
		            <%@ include file="head.jsp"%> 
		        </div>
				</c:otherwise>
			</c:choose>
			
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
                    <input class="but"  value="登录" onclick="severCheck();"/>
               </form>
            </div>
        </div>
        
      
       
        
     
	 <div  class="min  c"  id="content">
           <div  class="left"  style="height:586pz;">
           			<div class="scrollContent" style="width:100%; height:100%;">
           			
           				
           				
						<div class="nav">
							<h4>服务类别</h4>
		       				 <ul>
		                            <li>
		                               <a style="background: url(typeImg.html?id=9) no-repeat 10px center;" href="javascript:void(0);" onclick="subgo2(9,this);"><span>人事数据</span></a>
		                            </li>
		                             <li>
		                               <a style="background: url(typeImg.html?id=9) no-repeat 10px center;" href="javascript:void(0);" onclick="subgo2(9,this);"><span>教学数据</span></a>
		                            </li>
		                             <li>
		                               <a style="background: url(typeImg.html?id=9) no-repeat 10px center;" href="javascript:void(0);" onclick="subgo2(9,this);"><span>科研数据</span></a>
		                            </li>
		                             <li>
		                               <a style="background: url(typeImg.html?id=9) no-repeat 10px center;" href="javascript:void(0);" onclick="subgo2(9,this);"><span>财务数据</span></a>
		                            </li>
		                            <li>
		                               <a style="background: url(typeImg.html?id=9) no-repeat 10px center;" href="javascript:void(0);" onclick="subgo2(9,this);"><span>其它数据</span></a>
		                            </li>
		                      </ul>
		                  </div>
	                     <div class="cnxh c">
	                        <h4>业务直通车</h4>
	                        <ul  style="margin-top:5px;">
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
           <div  class="right" style="min-width:1036px;padding:0px;border:0px;">
           		<div class="breadCrumb">
           					<h4>
           						<a href="findex.html">首页</a>
           						<span>></span>
           						<a  href="personalCenter.html"  class="link">个人中心</a>
           					</h4>
           		</div>
           		<style>
           		
           	
           	
				  
			
           		  .nav-slide{
           		    box-sizing: border-box;
           		  	 box-shadow: inset 0 -2px 0 0 #EBF7F6;
           		  	     outline: none;
					    height: 50px;
					    position: relative;
					    left: 50px;
					    top: 0px;
					     margin: 0;
					    font-size: 14px;
					    padding: 3px 0 1px;
					    width:96%;
					    
           		  }
           		  nav-slide>ul{
           		  }
           		  
           		  
           		  .nav-slide{zoom:1;}
				  .nav-slide::after{content:'';display:block;height:0;visibility:hidden;clear:both;}
           		  
           		  .nav-slide ul{
           		        outline: none;
					    white-space: nowrap;
					    margin-top: 0px;
					    margin-bottom: 0px;
					    padding: 0px;
					    background: transparent;
					    border: none;
					    text-indent: 0px;
					    height: 50px;
					    width: 1267px;
					    left: 0px;
					    position: relative;
					    top: 0px;
					 
					         display: block;
					    list-style-type: disc;
					    -webkit-margin-before: 1em;
					    -webkit-margin-after: 1em;
					    -webkit-margin-start: 0px;
					    -webkit-margin-end: 0px;
					    -webkit-padding-start: 40px;
           		  }
           		  
           		   .nav-slide  ul  li{
           		  	 float: left;
           		  	     outline: 0;
				    border-radius: 2px;
				    position: relative;
				        border: 1px solid transparent;
					    margin: 0 2px 0 0;
					    padding: 0px 16px;
					    background: 0 0;
					    height: auto;
					        cursor: pointer;
					    white-space: nowrap;
					    list-style: none;
					    overflow: hidden;
					    z-index: 1;
					    position: relative;
					    outline: 0;
					    text-indent: 0;
					    display: block;
           		  }
           		  
           		  .nav-slide  ul  li:after {
					    content: "";
					    height: 2px;
					    position: absolute;
					    width: 100%;
					    left: 0;
					    bottom: 0;
					    -webkit-transition: all;
					    transition: all;
					    -webkit-transition-duration: 500ms;
					    transition-duration: 500ms;
					    -webkit-transform: scale(0);
					    -ms-transform: scale(0);
					    transform: scale(0);
					    background-color: #52B8AE;
					}
					
					
					.tabs-li-titleWrapper{
						    outline: none;
						    position: relative;
						    z-index: 15;
						    height: 33px;
					
					}
					
					
					
					
					
					.navLi.tabs-li-selected:after {
					    height: 4px;
					    -webkit-transform: scale(1);
					    -ms-transform: scale(1);
					    transform: scale(1);
					    background-color: #50cafc;
					}
					.navLi:after {
					    content: "";
					    height: 2px;
					    position: absolute;
					    width: 100%;
					    left: 0;
					    bottom: 0;
					    -webkit-transition: all;
					    transition: all;
					    -webkit-transition-duration: 1000ms;
					    transition-duration: 1000ms;
					    -webkit-transform: scale(0);
					    -ms-transform: scale(0);
					    transform: scale(0);
					    background-color: #52B8AE;
					}
					
					.closeButton{
					    height: 16px;
					    width: 16px;
					    float: left;
					    font-size: 1px;
					    display: none;
					    margin-top: 3px;
					    outline: 0;
					    background-image: url(images/close.png);
					    cursor: pointer;
					    margin: 0;
					    padding: 0;
					    position: relative;
					    left: 5px;
					}
					
					.navLi:hover:after {
					    -webkit-transform: scale(1);
					    -ms-transform: scale(1);
					    transform: scale(1);
					}
					
					.tabs-li-selected {
					    outline: 0;
					    color: #50cafc;
					    border-radius: 2px;
					    position: relative;
					}
					

           		
           		
           		</style>
           		
           		<div  class="nav-slide">
           		   <ul>
           		   	<li class="navLi    tabs-li-selected">
           		   			<div  class="tabs-li-titleWrapper   ">
           		   			    基本信息
           		   			</div>
           		   			<div class="closeButton">
           		   			    tab1 close
           		   			</div>	
           		   	
           		   	
           		   
           		   	
           		   	</li>
           		   	<li class="navLi  navLi-hover ">
           		   		<div  class="tabs-li-titleWrapper  ">
           		   			  <div>
           		   			   科研信息
           		   			  </div>
           		   			   	<div class="closeButton">
           		   			    tab2 close
           		   			  </div>		
           		   		</div>
           		   	</li>
           		   	<li class="navLi">
           		   	   <div  class="tabs-li-titleWrapper   ">
           		   			  <div>
           		   			 我的服务
           		   			  </div>
           		   			   	<div class="closeButton">
           		   			    tab3 close
           		   			  </div>		
           		   		</div>
					</li>
						<li class="navLi">
           		   	   <div  class="tabs-li-titleWrapper   ">
           		   			  <div>
           		   			   我的收藏
           		   			  </div>
           		   			   	<div class="closeButton">
           		   			    tab3 close
           		   			  </div>		
           		   		</div>
					</li>
					
           		   	
           		  </ul>
           		</div>
          
		  
		         <!-- tab体 1-->
		        <div class="dl-tab-conten">
		        	<ul  >
		        	  <li  class="dl-tab-item" >
		        	  		 <div  style="">
			       			  	<%@ include file="taskCenter_personalCenter_basic.jsp"%> 
			       			  </div> 
		        	  </li>
		        	
		        	  <li  class="dl-tab-item" style="display:none;"   ajaxUrl="otherPersonalInformationAjax.html"  delayLoad="true">
		        	  		<i class="fa fa-spinner fa-spin"   style="font-size:50px;color:blue;margin:20px;"></i>         	 
		        	  </li>
		        
		        	  
		        	 
		        	  
		        	  <li  class="dl-tab-item" style="display:none;"    ajaxUrl="myServiceAjax.html"  delayLoad="true">
		        	  		<!-- 
		        	  		 <div  style="min-width: 1007px;max-width: 1007px;">
			       			  	<%@ include file="taskCenter_MyTask.jsp"%> 
			       			  </div> 
			       			  -->
			       			<i class="fa fa-spinner fa-spin"   style="font-size:50px;color:blue;margin:20px;"></i> 
		        	  </li>
		        	  <li  class="dl-tab-item"  style="display:none;"    ajaxUrl="myCollectonAjax.html"  delayLoad="true">
		        	       <!-- 
		        	  		  <div  style="min-width: 1007px;max-width: 1007px;">
			       			  	<%@ include file="taskCenter_common_forPersonCenter.jsp"%> 	       			  
			       			  </div>   
			       		   --> 
			       		   <i class="fa fa-spinner fa-spin"   style="font-size:50px;color:blue;margin:20px;"></i>    	  
		        	  </li>
		        	  <!-- 
		        	   <li  class="dl-tab-item"  style="display:none;"      ajaxUrl="throughTrainAjax.html"  delayLoad="true">
		        	  			<i class="fa fa-spinner fa-spin"   style="font-size:50px;color:blue;margin:20px;"></i>	  
		        	  </li>
		        	   -->
		        	</ul>
		        </div>
        		<!-- /.dl-tab-conten -->
           </div>  <!-- /.right -->
      </div> <!-- /.min -->
	
   
        <script>
        $(function(){
        	var resizeEcharts=false;
        	
           
           $.tan.tab({
             	activeClass:"tabs-li-selected",
	           	 title:".nav-slide ul  li",
	           	 tab:".dl-tab-conten  ul  li.dl-tab-item",
	            	callbackClick:function(index,data){
	           		// if(!resizeEcharts  && index==1){
	               		// resizeEcharts=true;
	               		// guideStudent.resize(); achievements.resize();researchFunding.resize();researchProject2.resize();           		 
	              // 	 }
	           	 },
	           	callback:function(index,data){
			           	 if(index==3){
		           			$("#myCollectionId ul").delegate("li","click",function(e){
		                		openDialogBySrc({src:"./serviceWelcome.html?id="+$(this).attr("serviceId")});
		                    	e.stopPropagation();
		                	});
		           		 }
			           	 if(index==2){
			           			$("#myServiceAjaxDiv ul").delegate("li","click",function(e){
			                		openDialogBySrc({src:"./serviceWelcome.html?id="+$(this).attr("serviceId")});
			                    	e.stopPropagation();
			                	});
			           		 }
	           		
	           	}
          });
           
           
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
        
        
        </script>
      
       
        	
     
		
		<div id="share">
			<a id="totop" title="">返回顶部</a>
			 <!-- 
			<a href="http://weibo.com/p/1005053563542073" target="_blank" class="sina">关注我的新浪微博</a>
			<a href="http://t.qq.com/tanxuefeng8882015"  target="_blank" class="tencent">关注我的腾讯微博</a>
			 -->
		</div>
		
		
		  <!-- 头部 -->
        <div  class="main2"  id="fixHead2"  style="position:fixed;left:0px;padding:10px;z-index:10000;top:100px;" >
           <div  class="article">
	           	<div  class="top2">
	           		<img   src=""   width="90" height="120"><br>
	           		<h3>张三</h3><br>
	           		<span  class="top-caption mr-16">实验师</span><br>
	           		<span  class="top-caption mr-16">计算机学院</span><br>
	           		<a href="javascript:void(0)" class="more">修改密码</a><br>
	           	
	           		
	           		<div style="clear:both;"></div>
	           	</div>
           </div>
        </div>
        
        
		<!-- 
		<div   style="position:absolute;width:60px;">
		  <div   style="position: relative;
    width: 100%;
    height: 60px;
    background-color: rgba(0,0,0,.3);
    padding: 10px 0 4px;
    box-shadow: 0 2px 8px rgba(38,66,56,.2);
    cursor: pointer;
    border-bottom: 1px solid rgba(162,169,167,.2);">
		 <i class="fa fa-camera-retro"/  style="width: 20px;
    height: 20px;
    font-size: 20px;
    color: #FFF;
    font-size: 16px;
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    text-align: center;
    "></i>
    <div  style="    margin-top: 8px;
    color: #FFF;">我的收藏
    <i class="fa fa-camera-retro"></i> 
    </div>
		 
		  </div>
		   <div>
		  itme2
		  </div>
		   <div>
		  itme3
		  </div>
		</div>
		
	-->
        
    </body>
</html>
<script>
var guideStudent,achievements,researchFunding,researchProject2;

$(function(){
	$('.denglu').hover(function(){
		$('.xiala').show();
	},function(){
		$('.xiala').hide();
	});
	
	$('.top_right > .denglu').click(function(){
		$('.zhezhao').show();
		$('.zz_denglu').show();
	});
	
	//修改密码
	 $(".more").click(function(){
		 changePassword();
		
     });
    
	 
	 
	$('.guanbi').click(function(){
		$('.zhezhao').hide();
		$('.zz_denglu').hide();
		 $(".zz_xiuGaiMiMa").hide();
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
	
	
     
    
     
     
});


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
			}else{
				$("#username").tips({
					side : 1,
					msg : "缺少参数",
					bg : '#FF5080',
					time : 15
				});
				$("#username").focus();
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




$(function(){
	
	/*
	
	 $(".announce ").tipsXs({   //selector 为jquery选择器
 		 msg:'王五请假<br/>张山申请还书<br/>...<br/>',    //你的提示消息  必填
		  side:2,  //提示窗显示位置  1，2，3，4 分别代表 上右下左 默认为1（上） 可选
		  color:'#FFF', //提示文字色 默认为白色 可选
		  bg:'grey',//提示窗背景色 默认为红色 可选
		  time:0,//自动关闭时间 默认2秒 设置0则不自动关闭 可选
		  x:0,//横向偏移  正数向右偏移 负数向左偏移 默认为0 可选
		  y:0,//纵向偏移  正数向下偏移 负数向上偏移 默认为0 可选
		 });
	 
	 
	 $(".messageTip ").tipXsClick({   //selector 为jquery选择器
 		 msg:'星期一开会通知<br/>张大短信<br/>...<br/>',    //你的提示消息  必填
		  side:2,  //提示窗显示位置  1，2，3，4 分别代表 上右下左 默认为1（上） 可选
		  color:'#FFF', //提示文字色 默认为白色 可选
		  bg:'grey',//提示窗背景色 默认为红色 可选
		  time:0,//自动关闭时间 默认2秒 设置0则不自动关闭 可选
		  x:0,//横向偏移  正数向右偏移 负数向左偏移 默认为0 可选
		  y:0,//纵向偏移  正数向下偏移 负数向上偏移 默认为0 可选
		 });
	 */
	 
	 $(".announce ").tipsStaticTwo();
	// $(".messageTip ").tipsStatic();
	 $("#myTrigger2 ").tipsStaticTwo();
	
	 
	 
	 //回到顶部
	
	        //首先将#back-to-top隐藏
	      //  $("#totop").hide();
	        //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
	      $(window).scroll(function(){
		      if ($(window).scrollTop()>100){
		             $("#totop").fadeIn();
		      }
		          else
		      {
		           $("#totop").fadeOut();
		      }
	      });
	      //当点击跳转链接后，回到页面顶部位置
	      $("#totop").click(function(){
	       $('body,html').animate({scrollTop:0},{duration:500,easing:'easeInOutQuad',complete:function(){}});
	            return false;
	     });
	      
	      
	      
	   
	    
	     
	  
});
//左侧菜单点击后
function subgo2(id,me){
	$(".left a").removeClass("aActive");
	$(me).addClass("aActive");
//	$.post('serviceByMyType.html?id='+id, function(data) {
	//	$('#sfqhContent').html(data);
	//	dialogAddEvent();	
//	});
}


</script>
