<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.udata.osp.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		 <link rel="shortcut icon" href="${contextPath}/static/proscenium/images/xkd.ico" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		 <script src="${contextPath}/static/proscenium/js/jquery-1.10.2.min.js" type="text/javascript"></script>
		 <script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.tipsStatic2.js"></script>
    	<title>西科E站</title>
		<link href="${contextPath}/static/proscenium/css/index.css" rel="stylesheet" type="text/css"/>
		<style>
		 html{font-size:18px;}
		.thumbUp , .collection , .comment  ,.brief{
		  cursor:pointer;
		}
		.showRight.active{
		   color:#f9c802;
		 
		}
		label.toggle{
		 display:inline-block;
		 margin-top:15px;
		 margin-left:-40px;
		 /*margin-left:20px;*/
		}
		
		
		.arrowRight{
		    background: url(${contextPath}/static/proscenium/images/grayRightArrow.png) center center no-repeat;
		   background-size:40px  30px;	
		   width:40px;height:40px;	
		   margin-top:7px; 
		}
		.arrowRight.active{
		    background: url(${contextPath}/static/proscenium/images/rightArrow.png) center center no-repeat;
		   background-size:40px  30px;	
		   width:40px;height:40px;	
		   margin-top:7px; 
		}
		.hover{
		  color:red;
		}
		
		.fl{
		width:45%;
		}
		.fr{
		width:55%;
		}
		
		
		.toggle [type="checkbox"] {
		    display: none;
		}
		.toggle [type="checkbox"]:checked+.t_btn {
		    background-color: #15c1ef;
		}
		.toggle .t_btn {
		    vertical-align: middle;
		    display: inline-block;
		  	/*width: 2rem;*/
		    height: 1.3rem;
		    background-color: #aaa;
		    border-radius: 1.72rem;
		    position: relative;
		}
		
		.toggle [type="checkbox"]:checked+.t_btn:before {
		    left: 1.65rem;
		}
		.toggle .t_btn:before {
		    display: inline-block;
		    width: 1.15rem;
		    height: 1.15rem;
		    background-color: #fff;
		    border-radius: 1.52rem;
		    position: absolute;
		    left: 0.1rem;
		    top: 0.1rem;
		    content: "";
		    transition: left 0.5s ease;
		}
		
		
		</style>
		
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
	<body  >
	
	  <c:choose>
		<c:when test="${result eq 'notSet' }">
			没有id		
		</c:when>
		<c:otherwise>
		<div   style="margin-bottom:10px;">
		  <div class="cgsp c"  style="display:block;left:0;">
	            <div class="fl">
	                <div class="conter">
	                    <div class="top_img"><img src="img.html?id=${service.serviceId}"/></div>
	                    <div class="sydx">
	                        <span>服务类型</span>
	                        <i  style="width:100px;">${ sys_role.roleName} </i>
	                    </div>
	                    <div class="fenxiang">
	                        <ul>
	                            <li class="ico_1">
	                                <span  
	                       <c:choose>
		                        <c:when test="${sessionScope.user==null ||  havePraise}">
		                        </c:when>
		                        <c:otherwise>
		                             class="thumbUp"
		                        </c:otherwise>
	                        </c:choose>
		                       >
		                       	<label class="toggle">
												<input type="checkbox"  id="checkboxPraise"
												
												  <c:choose>								                      
								                         <c:when test="${sessionScope.user==null }">
								                           disabled="disabled"
								                        </c:when>
								                         <c:when test="${sessionScope.user==null &&  havePraise}">
									                        checked="checked"
									                     </c:when>  
								                        
								                           
							                      </c:choose>
												
												 >
												<span class="t_btn"></span>
								</label>
										
		                       		</span> 
	                                <i  class="praiseSum">共${servicePraise} 个人点赞
	                                   <c:choose>
					                        <c:when test="${sessionScope.user==null &&  havePraise}">
					                             (您已经点赞)
					                        </c:when>
				                        </c:choose>
	                                </i>
	                       
	                            </li>
	                            
	                             <li class="ico_4"  >
	                               
	                                <span  
	                                		
	                                  <c:choose>
					                        <c:when test="${sessionScope.user==null ||  haveCollection}">
					                        	class="cancelCollection"
					                        </c:when>
					                        <c:otherwise>
					                              class="collection"
					                        </c:otherwise>
				                      </c:choose>
	                                >
	                                	
	                                	<label class="toggle"  style="margin-left:-105px;">
												<input type="checkbox"  id="checkboxCollection"
												
												  <c:choose>								                      
								                         <c:when test="${sessionScope.user==null }">
								                           disabled="disabled"
								                        </c:when>
								                         <c:when test="${sessionScope.user==null &&  haveCollection}">
									                        checked="checked"
									                     </c:when>  
								                        
								                           
							                      </c:choose>
												
												 >
												<span class="t_btn"></span>
										</label>
	                                
	                                                                                
	                               </span>
	                                 <c:choose>
					                        <c:when test="${sessionScope.user==null &&  haveCollection}">
					                            <i  class="collectionSum">您已收藏</i>
					                        </c:when>
					                         <c:otherwise>
					                             <i  class="collectionSum">点击收藏</i>
					                        </c:otherwise>	
					                                        
				                      </c:choose>
				                      			   
	                            </li>
	                            
	                            <li class="ico_2">	                               
	                                 <span  style="margin-left:-115px;"
					                       <c:choose>
						                        <c:when test="${sessionScope.user==null}">
						                        </c:when>
						                        <c:otherwise>
						                             class="brief   active   showRight"
						                        </c:otherwise>
					                        </c:choose>	                        
	                        		>简介</span>
	                        		 <i  class="arrowRight active"></i>
	                            </li>
	                            
	                            <li class="ico_5">
	                                <span
					                       <c:choose>
						                        <c:when test="${sessionScope.user==null }">
						                        </c:when>
						                        <c:otherwise>
						                             class="comment  showRight"
						                        </c:otherwise>
					                        </c:choose>	                        
	                        		>评论</span>
	                        		 <i  class="arrowRight "></i>
	                            </li>
	                            
	                            <!-- 
	                            <li class="ico_3">
	                                <span>分享</span>
	                            </li>
	                             -->
	                        </ul>
	                        <c:choose>
		                        <c:when test="${sessionScope.user==null }">
		                             <a class="notLogin"  href="javascript:showLogin();"  style="margin-bottom:10px;border: 3px solid #c1c6d8;cursor: default;">登录后办理</a>
		                        </c:when>
		                        <c:otherwise>
		                            <a href="${service.serviceAdress}"   target="_blank"  class="monitorService">开始办理</a>
		                        </c:otherwise>
	                        </c:choose>
	                      
	                    </div>
	                </div>
	            </div>
	            <div class="fr">
	                <div class="conter">
	                    <div class="text_top">
	                       <!--  <span>最新服务</span> -->
	                        <h4>
	                       
	                            <span  class="serviceName">${service.serviceName}</span>
	                            <i>办理时间</i>
	                            <i>${service.service_time}</i>
	                            <i></i>
	                        </h4>
	                        <h5>服务简介</h5>
	                        <p>
	                           ${service.service_detail}
	                        </p>
	                    </div>
	                    <div class="liucheng  flowImage"  style="position:relative;width:100%;">
	                        <img src="imgFlow.html?id=${service.serviceId}" style="border:none;width:640px;"/>
	                          <c:if test="${haveFlow}">
	                           <div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">
		           		         	  	<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
			           		         		<div class="jq_tips_info2" style=""  url="imgFlow.html?id=${service.serviceId}"> 查看流程图片详情</div>
		           		       </div>
		           		      </c:if>
	                    </div>
	                    <div class="foot"  style="margin-top:5px;">
	                        <h5>推荐服务</h5>
	                        <div>
	                            
			                        
			                        <table>
			                        <tr>
			                         <c:forEach items="${serviceResult}" var="sR">
							           <td valign="bottom">
							               <a class="li_top" href="javascript:window.location='./serviceWelcome.html?id=${sR.serviceId}';">
							                    <i><img src="img.html?id=${sR.serviceId}"  style="height:82px;"></i>
			                                  
			                                    
							               </a>
							            </td>
							          </c:forEach>
			                        </tr>
			                        <tr>
			                          <c:forEach items="${serviceResult}" var="sR">
			                             <td valign="top"><div  style="padding:0 5px 0 5px;"><p  style="width:85px;color: #929292;">${sR.serviceName}</p> </div> </td>
			                           </c:forEach>
			                        </tr>
			                        </table>
	                        
	                        </div>
	                    
	                    </div>
	                </div>
	                
	                <div class="conter"  style="display:none;">
	                    <iframe    id="commentIframe" src="./comment.html?id=${service.serviceId}" scrolling="auto"  
       			     	style="width:100%;height:100%;" frameborder="no" border="0" ></iframe>
	                   
	                </div>
	            </div>
	        </div>
		 </div>
		</c:otherwise>
	</c:choose>
    </body>
    
    
</html>

<script>
//关闭提示框并打开登录
function showLogin(){
	if(top  && top.doLogin){
		top.doLogin();
	}
	top.closeSrcDialog();
}



$(function(){
	 <c:choose>
     <c:when test="${sessionScope.user==null }">
          
     </c:when>
     <c:otherwise>
 
    var  $showRight= $(".showRight");
     $showRight.click(function(event){
    	 $(".active").removeClass("active");
    	 $(this).addClass("active");
    	 $("+i",this).addClass("active");
    	 var index=$showRight.index(this);
    	 $(".fr  .conter").eq(index).show().siblings().hide();   
    	 event.stopPropagation();
    	 
     }).hover(function(){
    	 $(this).addClass("hover");
     },function(){
    	 $(this).removeClass("hover");
     });
     
     $(".showRight").parent().click(function(event){
    	 $(this).find(".showRight").click();
    	 event.stopPropagation();  
     });
     
     
     //点击收藏和取消收藏时的提示
     $("#checkboxCollection").change(function(){
    	 var nowState=$(this).is(':checked');
    	 dealCollection(!nowState);
    		 
    	
     });
     
     
     //点击点赞和取消点赞的处理
     $("#checkboxPraise").change(function(){
    	 var nowState=$(this).is(':checked');
    	 dealPraise(nowState);
     });
     
     //处理收藏的公用方法
     function dealCollection(isCancel){
    	 $.ajax({
    			type: "POST",
    			url: 'saveCollection.html',
    			data: {'serviceId':'${service.serviceId}',isCancel:isCancel},
    			dataType:'json',
    			cache: false,
    			success: function(data){
    				if(data.result=="noLogin"){
    				}else{
    					if(data.result=="cancelOk"){
    						$(".collectionSum").html("点击收藏");
    					}else if(data.result=="insertOk"){
    						$(".collectionSum").html("您已经收藏");
    					}
  					//$(".collection").removeClass("collection");
    				}
    			},
    			error:function(data){
    				
    			}
    		});
     }
     
   //处理点赞的公用方法
     function dealPraise(isPraise){
    	 $.ajax({
  			type: "POST",
  			url: 'praise.html',
  			data: {'serviceId':'${service.serviceId}',isPraise:isPraise},
  			dataType:'json',
  			cache: false,
  			success: function(data){
  				if(data.result=="noLogin"){
  				}else{ 
  					if(data.result=="cancelOk"){
  						$(".praiseSum").html("共"+data.sum+"个人点赞");
					}else{
						$(".praiseSum").html("共"+data.sum+"个人点赞(您已经点赞)");
					}
  				
  				}
  			},
  			error:function(data){
  			}
  		});
     }
    
      
     </c:otherwise>
     </c:choose>
 
    $(".monitorService").click(function(){
       //serviceName
    	$.ajax({
			type: "POST",
			url: 'monitor/saveService.html',
			data: {'serviceId':$(".fr  .serviceName").html(),'id':'${service.serviceId}'},
			dataType:'json', // dataType: 'html',  
			cache: false,
			success: function(data){  
				//alert(JSON.stringify(data));
			},
			error:function(){
				// alert("修改失败(请检查网络)");
			}
		});
    });
    
    //打开图片详情
	$(".flowImage   img").tipsStaticTwo();
	$(".jq_tips_info2").click(function(){
		window.open($(this).attr("url"));
	});
      
 
	
	
	
	
});

</script>







