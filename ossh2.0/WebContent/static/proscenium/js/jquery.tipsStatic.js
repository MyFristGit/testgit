/**
* jquery tips 提示插件 jquery.tips.js v0.2beta
*
* 使用方法
* $(selector).tipsXs({   //selector 为jquery选择器
*  msg:'your messages!',    //你的提示消息  必填
*  side:1,  //提示窗显示位置  1，2，3，4 分别代表 上右下左 默认为1（上） 可选
*  color:'#FFF', //提示文字色 默认为白色 可选
*  bg:'#F00',//提示窗背景色 默认为红色 可选
*  time:2,//自动关闭时间 默认2秒 设置0则不自动关闭 可选
*  x:0,//横向偏移  正数向右偏移 负数向左偏移 默认为0 可选
*  y:0,//纵向偏移  正数向下偏移 负数向上偏移 默认为0 可选
* })
* 对提示做一些扩展，改为自动提示和隐藏的类似菜单的效果
* 提示框的样式和位置在div内部定义 
*
*/
$(function(){
	// $(".tip").fadeOut("fast");   
	$(".tip").hide();
});
	                
       
(function ($) {
	var  allDetail=[];
	var uuid=0;
	var  line=1;
	function showDebug(str){
		if($('#debug').length){
			$("#debug").html($("#debug").html()+"<br>"+(line++)+":"+str);
		}
	}
	
    $.fn.tipsStatic = function(){
        this.each(function(){        
            var toDetail={};
            var element=$(this);            
            function showTips(){            	
                var tips=element.find(".tip");                
               // tips.fadeIn("fast");
                tips.show();
                $(tips).hover(function(){
					showDebug("tips hover");
                	 $.fn.tipsStatic.closeAll( toDetail.elements);
                	//关标移到tips上
                	//光标移到element
                	if(toDetail.tipTime!=null){
                		clearTimeout(toDetail.tipTime);
                		toDetail.tipTime=null;
                	}
                	if(toDetail.tips==null){
                		toDetail.tips=showTips();
                	}
                	
                },function(){
                	//光标移开tips
					showDebug("tips hover out");
                	if(toDetail.tipTime==null){
                		toDetail.tipTime=setTimeout(function(){
                			if(toDetail.tips!=null){
                				toDetail.tips.hide();
                    			toDetail.tips=null;
                			}  
                			toDetail.tipTime=null;
                		},300);
                	}
                	
                });
            
                
                return tips;
            	
            }
            var tips=null;//showTips();
            
            toDetail.tips=tips;
            toDetail.elements=element;
            if(!$(this).data("xsUuid")){//一个elements多次创建，仅仅分配一个。
            	$(this).data("xsUuid",uuid++);
            }
            if(!$(tips).data("xsUuid")){//tip多次创建，
            	$(tips).data("xsUuid",uuid++);
            }            
            allDetail.push(toDetail);
            toDetail.elementTime=null;
            toDetail.tipTime=null;
            
            
            $(this).hover(function(){
				showDebug("this hover");
           	   $.fn.tipsStatic.closeAll( toDetail.elements);
            	//光标移到element
            	if(toDetail.tipTime!=null){
            		clearTimeout(toDetail.tipTime);
            		toDetail.tipTime=null;
            	}
            	if(toDetail.tips==null){
            		toDetail.tips=showTips();
            	}
            	
            },function(){
				showDebug("this hover out");
            	//光标移开element
            	if(toDetail.tipTime==null){
            		toDetail.tipTime=setTimeout(function(){
            			if(toDetail.tips!=null){
            				toDetail.tips.hide();
                			toDetail.tips=null;
            			}            			
            			toDetail.tipTime=null;
            		},300);
            	}
            	
            });
            //保存最新的，使得前台能取到控件
			if(!$(this).data("saveTip")){
				$(this).data("saveTip",tips);
			}else{
				$(this).data("saveTip").click();
				$(this).data("saveTip",tips);
			}
						
        });
        return this;
    };
    
    
    $.fn.tipsStatic.closeAll=function(excludeElement){
    	if(excludeElement){
    		for(var i=0;i<allDetail.length;i++){
    			if($(allDetail[i].elements).data("xsUuid")==$(excludeElement).data("xsUuid")){
    				continue;
    			}
    			else{
    				if(allDetail[i].tips){
    			    	  $(allDetail[i].tips).hide();
    			    	  allDetail[i].tips=null;
    			    }
    				if(allDetail[i].tipTime){
    					clearTimeout(allDetail[i].tipTime);
    					allDetail[i].tipTime=null;
    				}
    			}
    		}
    		
    	}else{
    		for(var i=0;i<allDetail.length;i++){
    			    if(allDetail[i].tips){
    			    	  $(allDetail[i].tips).hide();
    			    	  allDetail[i].tips=null;
    			    }
    				if(allDetail[i].tipTime){
    					clearTimeout(allDetail[i].tipTime);
    					allDetail[i].tipTime=null;
    				}
    		}
    	}
    	
    }

	//点击后才弹出提示
	$.fn.tipsStaticClick=function(options){
	   	        this.each(function(){
	        	//为了能找到tip和原始的对应关系可以1:全局仅仅一个2.从data中判断。先采用1:并将刚刚创建的对象放在闭包中
	              var toDetail={};
	            var element=$(this);
	            
	            function showTips(){  
	                var tips=element.find(".tip"); 	                
	                tips.show();            
	                $(tips).click(function(event){					
	                	 $.fn.tipsStatic.closeAll( toDetail.elements);
	                	//关标移到tips上
	                	//光标移到element
	                	if(toDetail.tipTime!=null){
	                		clearTimeout(toDetail.tipTime);
	                		toDetail.tipTime=null;
	                	}
	                	if(toDetail.tips==null){
	                		toDetail.tips=showTips();
	                	}
						event.stopPropagation();
	                	
	                });
	            
	                
	                return tips;
	            	
	            }
	            var tips=null;//showTips();
	            
	            toDetail.tips=tips;
	            toDetail.elements=element;
	            if(!$(this).data("xsUuid")){//一个elements多次创建，仅仅分配一个。
	            	$(this).data("xsUuid",uuid++);
	            }
	            if(!$(tips).data("xsUuid")){//tip多次创建，
	            	$(tips).data("xsUuid",uuid++);
	            }            
	            allDetail.push(toDetail);
	            toDetail.elementTime=null;
	            toDetail.tipTime=null;
	            
	            
	            $(this).click(function(event){
	           	   $.fn.tipsStatic.closeAll( toDetail.elements);
	            	//光标移到element
	            	if(toDetail.tipTime!=null){
	            		clearTimeout(toDetail.tipTime);
	            		toDetail.tipTime=null;
	            	}
	            	if(toDetail.tips==null){
	            		toDetail.tips=showTips();
	            	}
					event.stopPropagation();
	            	
	            });
				
				if(!$(document).data("closeClick")){
				     $(document).data("closeClick",true);
					 $(document).click(function(){
						  $.fn.tipsStatic.closeAll();
						  
					 });
				}
	            //保存最新的，使得前台能取到控件
				if(!$(this).data("saveTip")){
					$(this).data("saveTip",tips);
				}else{
					$(this).data("saveTip").click();
					$(this).data("saveTip",tips);
				}
				
	        });
	        return this;
		
	};
	
	
	
	
	})(jQuery);