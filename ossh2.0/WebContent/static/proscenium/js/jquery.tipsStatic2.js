    
(function ($) {
	var  allDetail=[];
	var uuid=0;
	var  line=1;
	function showDebug(str){
		if($('#debug').length){
			$("#debug").html($("#debug").html()+"<br>"+(line++)+":"+str);
		}
	}
	
    $.fn.tipsStaticTwo = function(){
        this.each(function(){        
            var toDetail={};
            var element=$(this);            
            function showTips(event){   
            	
               event=event||window.event;
                var tips= element.parent().find(".tip");
                var left=Math.max(document.body.scrollLeft,document.documentElement.scrollLeft );
            	if(event.pageX>(left+Math.floor($(window).width()/2))){
            		tips.removeClass("TipRight");
            		tips.addClass("TipLeft");
            	}else{
            		tips.removeClass("TipLeft");
            		tips.addClass("TipRight");
            	}
               // tips.fadeIn("fast");
                tips.show();
                $(tips).hover(function(){
					showDebug("tips hover");
                	 $.fn.tipsStaticTwo.closeAll( toDetail.elements);
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
            
            
            $(this).hover(function(event){
            
				showDebug("this hover");
           	   $.fn.tipsStaticTwo.closeAll( toDetail.elements);
            	//光标移到element
            	if(toDetail.tipTime!=null){
            		clearTimeout(toDetail.tipTime);
            		toDetail.tipTime=null;
            	}
            	if(toDetail.tips==null){
            		toDetail.tips=showTips(event);
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
    
    
    $.fn.tipsStaticTwo.closeAll=function(excludeElement){
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
	$.fn.tipsStaticTwoClick=function(options){
	   	        this.each(function(){
	        	//为了能找到tip和原始的对应关系可以1:全局仅仅一个2.从data中判断。先采用1:并将刚刚创建的对象放在闭包中
	              var toDetail={};
	            var element=$(this);
	            
	            function showTips(){  
	                var tips=element.parent().find(".tip"); 	                
	                tips.show();            
	                $(tips).click(function(event){					
	                	 $.fn.tipsStaticTwo.closeAll( toDetail.elements);
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
	           	   $.fn.tipsStaticTwo.closeAll( toDetail.elements);
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
						  $.fn.tipsStaticTwo.closeAll();
						  
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