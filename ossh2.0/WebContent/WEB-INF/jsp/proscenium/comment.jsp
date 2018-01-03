<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html>
    <head>
    <meta charset="utf-8">
    	<title>无标题文档</title>
		<link href="./static/proscenium/css/index.css" rel="stylesheet" type="text/css"/>
		<link href="./static/proscenium/css/pagination.css" rel="stylesheet" type="text/css"/>
        <script src="./static/proscenium/js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="./static/proscenium/js/jquery.pagination.js" type="text/javascript"></script>
        <script type="text/javascript" src="${contextPath}/static/proscenium/js/jquery.tips.js"></script>
        <style>
         .pl_ct .neirong dd .top p{
          padding:0px;
          border-bottom:2px solid #f6f6f6;
         }
         
         .pl_ct {
          padding:0px;
         }
         
         .pl_ct .neirong dd {
		   margin-left: 5px; 
		}
		.fr_ct {
		     padding: 0px;
		}
		
	
		
		
		.btn-publish{
		 	display: inline-block;
		   padding:5px;
		    height: 20px;
		    text-align: center;
		    font-size: 16px;
		    border-radius: 3px;
		    cursor:pointer;
		    outline: none;
		    cursor: pointer;
		    text-align: center;
		    font: 16px/100% 'Microsoft yahei',Arial, Helvetica, sans-serif;
		    padding: .5em 2em .55em;
		    text-shadow: 0 1px 1px rgba(0,0,0,.3);
		    -webkit-border-radius: .5em;
		    -moz-border-radius: .5em;
		    border-radius: .5em;
		    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
		    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
		    box-shadow: 0 1px 2px rgba(0,0,0,.2);
		     color: #d9eef7;
		    border: solid 1px #0076a3;
		    background: #0095cd;
		    background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
		    background: -moz-linear-gradient(top, #00adee, #0078a5);
		    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
			line-height:20px;  
		
		}
		.btn-publish2{
		 	display: inline-block;		  
		    height: 30px;
		    line-height: 30px;		   
		    text-align: center;
		    font-size: 16px;
		    border-radius: 3px;
		    cursor:pointer;
		    text-shadow: 0 1px 1px rgba(0,0,0,.3); 
			box-shadow: 0 1px 2px rgba(0,0,0,.2); 
			-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
			-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
			border-radius: .5em; 
			-webkit-border-radius: .5em; /* for Webkit */ 
			-moz-border-radius: .5em;  /* for Firefox */
				/* for Webkit */ 
				background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5)); 
				/* for Firefox */ 
				background: -moz-linear-gradient(top,  #00adee,  #0078a5); 
				/* for IE */ 
				 filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
				color: #d9eef7;
			    border: solid 1px #0076a3;
			    background: #0095cd;
			    background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
			    background: -moz-linear-gradient(top, #00adee, #0078a5);    
                outline: none;
		}
		
		.btnHover{
		   background: #1185cd;
		}
		
		.textareaDiv{
		    box-shadow: none;
		    border: 1px solid #d2dbe1;
		    padding: 9px 15px 0;
		}
		
		.wordsLimits{
		 text-align: right;
	    color: #959595;
	    font-weight: 700;
	    font-size: 14px;
	    margin-bottom:5px;
	    margin-right:20px;
		
		}
		
		textarea {
		    border-style: none;
		    border-width: 0;
		    outline: 0;
		    resize: none;
		    width: 100%;
		    height:60px;
		    line-height:22px;
		    overflow: hidden;
		    padding: 0;
		    line-height: 24px;
		    font-size: 12px;
		    display: block;
			color:rgb(50,50,50);
			font-size:14px;
			border-style:none;
			border-width:0;
			display:block;
			white-space: pre-wrap;
		    word-wrap: break-word;
		}
		
		.pager{	
		margin-top:5px;
		padding:5px;
		
		}

		
         
        </style>
    </head>
	<body>
	   <a name="top" id="top"></a>
       <div class="min c">
          <div >
                <div style="width:100%; height:100%; overflow-y:auto;">
                	<div class="fr_ct">						
                        <div class="pdg55">                        	
                            <div class="pl_ct">
	                             <c:forEach items="${userComments}" var="uc">	                             	
	                             	<dl class="neirong"> 
	                                	<dt><img src="./static/proscenium/images/kongtx.jpg"></dt>
	                                    <dd>
	                                       <div class="top">
	                                        	<h4>
	                                            	<i>${uc.Name}</i>
	                                                <em>${uc.create_time_string}</em>
	                                            </h4>
	                                            <p  style="padding:0px;">
	                                            	${uc.comment}
	                                            </p>
	                                        </div>                                       
	                                    </dd>
                                    </dl>                                
						           </c:forEach>
                            </div>
                        </div>
                    </div>             	
                </div>
            </div>
        </div>
        
        
        
         <c:choose> 
				    <c:when test="${haveMorePage}">
				          <div id="div1" class="pager">        
					        <span name="first" class="disabled" style="cursor: default;">首页</span>
					        <span name="prev" class="disabled" style="cursor: default;">上一页</span>
					        <span name="nav" style="cursor: pointer;"><a class="navi"  style="background-color: #3897cd;border-color: #3897cd;"><span style="color: #900">1</span></a></span>
					        <span name="next" class="" style="cursor: pointer;">下一页</span>
					        <span name="last" class="" style="cursor: pointer;">末页</span>
					        <span name="go" style="" class="btn-publish2">转向</span> <input name="goNum" class="cssTxt" type="text" size="1"  onfocus="this.select();"  onkeypress="return checkNum(event);">
					      </div>
				    </c:when>
		  </c:choose>
		  
		
	   <div style="color:#9f9f9f;line-height:20px;">我要评论：</div>
        <div  class="comment">
        
        <div  class="textareaDiv">
			        	  <textarea   id="saveArea"  placeholder="限50字"  maxlength="50"></textarea>
			        	  <p  class="wordsLimits" >注意：共可以输入<span  style="color:red;">50</span>字。</p>
			        	
		</div>
			        	
        
        
	       
	         <div  class="comment-action-bar line"  style="margin-top:5px;"> 
				  
						 <div  style="float:right;display:inline;margin-right:10px;">
							  <a class="btn-publish   publish ">发布评论</a> 
						</div>
				
	         </div>
        </div>
        
        
      <c:choose> 
	    <c:when test="${result ==  0 }">
			no  id,不可以发布评论		
		</c:when>
		<c:otherwise>
			<script>
		      $(function(){
		    	  
		    	  $('textarea').each(function() {  
			    		  var ta = $(this), p = ta.parent(), ml = parseInt(ta.attr('maxlength')),  
			    		  v = ta.val(), h = ta.attr('placeholder');  
			    		  if (v == h) v = '';  
			    		  if (h && ml) {  
				    		  var sp = '<span style="bottom: 15px;position: absolute;right: 15px;">'+v.length+'/'+ml+'</span>';  
				    		  p.css({'position': 'relative'});  
				    		  ta.before(sp);  
				    		  ta.bind('click keyup', function() {  
					    		  var m = $(this), v1 = m.val();  
					    		  if (v1.length > ml) {  
					    		  m.val(v1.substring(0, ml))  
					    		  }  
					    		  m.prev().text(m.val().length + '/' + ml);  
					    		  $("#xxxx").text(ml-m.val().length);  
				    		  });  
			    		  }  
		    		  });
		       });
		      
		      
		   
			
		       $(".publish").click(function(){
		    	   
		    	   if($.trim($("#saveArea").val()).length==0){
		    		  // top.createADialog("<h1  style='font-size: 24px;color: #474747;display: inline-block;padding-top:50px;'>评论不可为空</h1>");
		    		  
		    		   top.showTip("提示","评论不可为空");
		    		   
		    		 
		    		   return;    		   
		    	   }
		    	   
		    	   var willUpdate=$("#saveArea").val()
		    	   .replace(new RegExp("&",'gm'),"&amp;")
		    	   .replace(new RegExp("<",'gm'),"&lt;")
		    	   .replace(new RegExp('>','gm'),"&gt;")
		    	    .replace(new RegExp('"','gm'),"&quot;")
		    	    .replace(new RegExp("'",'gm'),"&apos;");
		    	   $.ajax({
			    			type: "POST",
			    			url: 'saveComment.html',
			    			data: {serviceId:'${result}',comment:willUpdate},
			    			dataType:'json',
			    			cache: false,
			    			success: function(data){
			    				if(data.result==""){
			    					top.showTip("提示","已经发布评论，不可发表评论");
			    				}
			    				if(data.result=="saveOk"){
			    					
			    				//	top.showTipThenDo("提示","保存成功",function(){
			    					
			    					//	window.location.reload();
			    						//top.closeMyDialog();
			    					//});
			    						//top.showTip("提示","保存成功");
			    						
			    						
			    					top.showTipThenClose("提示","保存成功",function(){
			    						window.location.reload();
			    						top.closeMyDialog();
			    					},1000);
			    				}
			    				
			    			},
			    			error:function(){
			    				
			    			}
		    			});
		       });
		       
		  //删除我的评论     
         $(".deleteMy").click(function(){
		    	   $.ajax({
			    			type: "POST",
			    			url: 'deleteComment.html',
			    			data: {serviceId:'${result}'},
			    			dataType:'json',
			    			cache: false,
			    			success: function(data){
			    				
			    				if(data.result==""){
			    					top.showTipThenDo("提示","删除成功",function(){
			    					
			    						window.location.reload();
			    						top.closeMyDialog();
			    					});
			    				}
			    				
			    				
			    			},
			    			error:function(){
			    				
			    			}
		    			});
		       });
  
		      
		     
		        </script>
        
		</c:otherwise>
	  </c:choose>
	  
	  <script>
	  function checkNum(e){
   	   var ie=window.navigator.appName=="Microsoft Inernet Explore"?true:false;
   	   if(!ie)  var  key=e.which;
   	   else     var  key=e.keyCode;
   	   if(key==8 ||  key==46 ||(key>=48 && key<=57))
   		   return true;
   	   else return false;
   	   
      }
	  
	
	  
	  
	  function changePageTo(pageIndex,pageSize){
		   $.ajax({
	   			type: "POST",
	   			url: 'getPager.html',
	   			data: {serviceId:'${result}',pageIndex:pageIndex,pageSize:pageSize},
	   			dataType:'json',
	   			cache: false,
	   			success: function(data){
 
	   				$(".pl_ct").empty();
	   				$.each(data,function(i,e){
	   					var $dl=$("<dl  class=\"neirong\"></dl>");
	   					$dl.html("<dt><img src=\"./static/proscenium/images/kongtx.jpg\"></dt>"+
                               " <dd>"+
			                   "     <div class=\"top\">"+
			                   "      	<h4>"+
			                   "          	<i>"+e.Name+"</i>"+
			                   "              <em>"+e.create_time_string+"</em>"+
			                    "         </h4>"+
			                   "          <p  style=\"padding:0px;\">"+
			                    "         	"+e.comment+""+
			                    "         </p>"+
			                   "      </div>  "+                                     
			                   "  </dd>");
	   					$(".pl_ct").append($dl);	   					
	   				});
	   			    checkHeight();
	   				
	   		
	   			},
	   			error:function(){
	   				
	   			}
			});
		  
		  
	  }
	  $(function(){  
		  $(".pager").pagination({
		        recordCount: ${total},    //总记录数
		        pageSize: ${pageSize} ,           //一页记录数
		        onPageChange: function (pageIndex) {		          
		            changePageTo(pageIndex,${pageSize});
		        }
		    });
		
		  checkHeight();
		  //按钮变色效果
		  $(".btn-publish").hover(function(){
			  $(this).addClass("btnHover");
			  
		  },function(){
			  $(this).removeClass("btnHover");
			  
		  });
		  $(".btn-publish2").hover(function(){
			  $(this).addClass("btnHover");
			  
		  },function(){
			  $(this).removeClass("btnHover");
			  
		  });
		 
		});
	  
	  
	  //去掉滚动条
	  function calcPageHeight(doc) {
	     var cHeight = Math.max(doc.body.clientHeight, doc.documentElement.clientHeight)
	     var sHeight = Math.max(doc.body.scrollHeight, doc.documentElement.scrollHeight)
	     var height  = Math.max(cHeight, sHeight)
	     return height
	   }
	
	  function checkHeight(){
		  var height = calcPageHeight(document)
		    if(parent &&  parent.document.getElementById( 'commentIframe' ))
		    	parent.document.getElementById( 'commentIframe' ).style.height = 530 +  'px';	
		       // parent.document.getElementById( 'commentIframe' ).style.height = height +  'px';		
		 $('#goTop > p').trigger('click') ;		  
	  }
	  </script>
     <a href="#top" target="_self"  id="goTop"  style="display:none;"><p>返回顶部</p></a>
    
    </body>
</html>




