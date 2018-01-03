/*本js文件主要用来从后台读取服务数据后初始化ul*/

//取消高亮
function notActiveIcon(){
	var  nowHtml='';
	for(var i=0;i<CacheService[0].length;i++){
		if(i!=0){
			nowHtml+=splitHtml;
		}
		nowHtml+=CacheService[0][i];
	}
	$("#servicesUl").html(nowHtml);
	addClickEvent();
	
}
var   splitHtml=
	" <li>"+
		"<strong></strong>"+
    "</li>";

   //角色高亮的切换
	function changeTo(index){
		var  nowHtml='';
		for(var i=0;i<CacheService[0].length;i++){
			if(i!=0){
				nowHtml+=splitHtml;
			}
			if(i==index){
				nowHtml+=CacheService[1][index];
			}else{
				nowHtml+=CacheService[0][i];
			}
		}
		$("#servicesUl").html(nowHtml);
		addClickEvent();
	}

//为了方便服务高亮的切换，缓存服务html
var  CacheService=[
                   [],//普通html
                   []//高亮html
                   ];



//service排序的专用函数
function ServiceOrderByCreateTimeDesc(first,second){							
	return (first.serviceCreateTime.time < second.serviceCreateTime.time);
}
function ServiceOrderByUserNumberDesc(first,second){							
			return (first.collection_count < second.collection_count);
}

//给角色图标添加click处理事件
function  addClickEvent(){
	$(".leftLi a").removeClass("aActive");
	//移动到上边变色
	$(".serviceName").hover(function(){
	    $("p",this).css("color","#f05638;");//红
	},function(){
	    $(".serviceName.notActive  p").css("color","#717171");//灰
	    $(".serviceName.active  p").css("color","#f9c802");//黄
	});
	
	//子菜单
	$(".serviceName").click(function(){
		//恢复
		$("#serviceContent").html(CacheSubServicesHtml);
		var   roleId=($(this).attr("servicename"));
		
		 var  index=(Math.floor(($(this).index()+1)/2));
		 changeTo(index);
		if(CacheAjax[roleId+"_new"]){
			$("#subServices").html(CacheAjax[roleId+"_new"]);
			$("#subServicesByHot").html(CacheAjax[roleId+"_hot"]);
			doTab();
			dialogAddEvent();
			return;
		}
		function addEllipsis(str){
			if(str.length>14){
				return str.slice(0,14)+"...";
			}
			return str;
			
		}
		
		$.ajax({
			type: "POST",
						url: 'getSubServicesUl.html',
				    	data: {'roleId':roleId},
						dataType:'json',
						cache: false,
						success: function(data){
							//分别在最新和最火中插入
							//激活图标
							//最新
							var  newData= data.sort(ServiceOrderByCreateTimeDesc);      
							var   appendHtml="";
							console.log(newData);
							for(var i=0;i<newData.length;i++){
								appendHtml+=								
		                            "<li  class=\"subService\"  subServiceUrl=\""+newData[i].serviceAdress+"\"  serviceId=\""+newData[i].serviceId+"\">"+
	                                    "<a class=\"li_top\" href=\"#\">"+
	                                        "<span  class=\"ico-bg1\">"+
	                                            "<i><img src=\"img.html?id="+newData[i].serviceId+"\"/></i>"+
	                                            "<p>"+addEllipsis(newData[i].serviceName)+"</p>"+
	                                        "</span>"+
	                                    "</a>"+
	                                    
	                                 //   "<div class=\"li_bt\">"+
		                             //       "<span   title=\"点赞\">"+newData[i].praise_count+"</span>"+
	                                 //       "<strong  title=\"评论\">"+newData[i].comment_count+"</strong>"+
	                                 //       "<em  title=\"收藏\">"+newData[i].collection_count+"</em>"+
	                                 //   "</div>"+
	                                    
	                                    "<div class=\"tip jq_tips_box2  jq_tips_box_xs2\"  directive=\"right\"  style=\"display: none;\">"+
		           		         	  	"	<i class=\"jq_tips_arrow2 jq_tips_right2\" style=\"\"></i>"+
			           		         	"	<div class=\"jq_tips_info2\" style=\"\">评论:"
		           		         	  	+newData[i].comment_count+"条<br/>点赞:"+newData[i].praise_count+"个<br/>收藏:"
		           		         	  	+newData[i].collection_count+"个<br/></div>"+
		           		         		"</div>"+
		           		         		
	                                "</li>";
							}
							$("#subServices").html(appendHtml);
							CacheAjax[roleId+"_new"]=appendHtml;
							//最火
							var  newData= data.sort(ServiceOrderByUserNumberDesc);     
							var   appendHtml="";
							
							for(var i=0;i<newData.length;i++){
								appendHtml+=								
									 "<li  class=\"subService\"  subServiceUrl=\""+newData[i].serviceAdress+"\"  serviceId=\""+newData[i].serviceId+"\">"+
	                                    "<a class=\"li_top\" href=\"#\">"+
	                                        "<span  class=\"ico-bg1\">"+
	                                            "<i><img src=\"img.html?id="+newData[i].serviceId+"\"/></i>"+
	                                            "<p>"+addEllipsis(newData[i].serviceName)+"</p>"+
	                                        "</span>"+
	                                    "</a>"+
	                                //    "<div class=\"li_bt\">"+
                                    //    "<span   title=\"点赞\">"+newData[i].praise_count+"</span>"+
                                    //    "<strong  title=\"评论\">"+newData[i].comment_count+"</strong>"+
                                    //    "<em  title=\"收藏\">"+newData[i].collection_count+"</em>"+
                                    //    "</div>"+
                                    
                                    
	                                    "<div class=\"tip jq_tips_box2  jq_tips_box_xs2\"  directive=\"right\"  style=\"display: none;\">"+
		           		         	  	"	<i class=\"jq_tips_arrow2 jq_tips_right2\" style=\"\"></i>"+
			           		         	"	<div class=\"jq_tips_info2\" style=\"\">评论:"
		           		         	  	+newData[i].comment_count+"条<br/>点赞:"+newData[i].praise_count+"个<br/>收藏:"
		           		         	  	+newData[i].collection_count+"个<br/></div>"+
		           		         		"</div>"+
		           		         		
	                                "</li>";
							}
							$("#subServicesByHot").html(appendHtml);
							CacheAjax[roleId+"_hot"]=appendHtml;
							doTab();
							dialogAddEvent();
						}
		});
	});
}

//当左边点击后，会改变div#serviceContent  的内容，导致按钮点击后无法定位到div#subServices等div的dom结构
//解决方法为使用缓存，点击后恢复div#serviceContent,再正常执行

var  CacheSubServicesHtml='';
//为了提高数据连接的效率，对于ajax的多次结果使用缓存,用于缓存角色下服务的图标
var  CacheAjax={};
//为了避免上传文件的麻烦，js中指定服务的对应图标
var  imageUrl=[
               {"serviceName":"教师服务","urlActive":"nav_ico_2-1.png","url":"nav_ico_2.png"},
               {"serviceName":"学生服务","urlActive":"nav_ico_3-1.png","url":"nav_ico_3.png"}
              ];
function getUrl(serviceName,isActive){
	for(var i=0;i<imageUrl.length;i++){
		if(imageUrl[i].serviceName==serviceName){
			if(isActive){
				return imageUrl[i].urlActive;					
			}else{
				return imageUrl[i].url;					
			}
		}
	}
	return  "";
}



//给service服务添加弹出对话框处理
function  dialogAddEvent(){	
	$("body  .zuixin ul").delegate("li","click",function(e){	
		//关闭全部的提示
		//$.fn.tipsXs.closeAll();
		$.fn.tipsStaticTwo.closeAll();
		openDialogBySrc({src:"./serviceWelcome.html?id="+$(this).attr("serviceId")});
    	e.stopPropagation();
	});
}

$(function(){
	dialogAddEvent();
	 CacheSubServicesHtml=$("#serviceContent").html();
	$.ajax({
		type: "POST",
					url: 'getServicesUl.html',
			    	data: {},
					dataType:'json',
					cache: false,
					success: function(data){
						var   appendHtml="";
						for(var i=0;i<data.length;i++){
							var tempHtml="";
							var pushHtmlNormal="";
							var pushHtmlActive="";
							if(i!=0){
								tempHtml+=splitHtml;
							}
							
							pushHtmlNormal=
								"<li   class=\"serviceName  notActive\" servicename=\""+ data[i].roleId+"\">"+
	                               " <a href=\"#\">"+
	                                 //"   <i class=\"ico_2\"></i>"+
	                               "   <i style=\"background: url(./static/proscenium/images/"+getUrl(data[i].roleName)+") no-repeat center;background-size:contain;\"></i>"+
	                                 "   <p>"+data[i].roleName+"</p>"+
	                                "</a>"+
	                           " </li>";
							pushHtmlActive=
								"<li   class=\"serviceName   active\" servicename=\""+ data[i].roleId+"\">"+
	                               " <a href=\"#\">"+
	                                 //"   <i class=\"ico_2\"></i>"+
	                               "   <i style=\"background: url(./static/proscenium/images/"+getUrl(data[i].roleName,true)+") no-repeat center;background-size:contain;\"></i>"+
	                                 "   <p   style=\"color:#f9c802;\">"+data[i].roleName+"</p>"+
	                                "</a>"+
	                           " </li>";
							tempHtml+=pushHtmlNormal;
							CacheService[0].push(pushHtmlNormal);
							CacheService[1].push(pushHtmlActive);
							appendHtml+=tempHtml;
						}
						$("#servicesUl").html(appendHtml);
					//添加click事件处理
						addClickEvent();
						
					},
					error:function(data){
						
					}
	});
	
	
});
		