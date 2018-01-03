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
*
*/
(function ($) {
	var  allDetail=[];
	var uuid=0;
    $.fn.tipsXs = function(options){
        var defaults = {
            side:1,
            msg:'',
            color:'#FFF',
            bg:'#F00',
            time:2,
            x:0,
            y:0
        }
        var options = $.extend(defaults, options);
        if (!options.msg||isNaN(options.side)) {
        throw new Error('params error');
    }
    if(!$('#jquery_tips_style').length){
        var style='<style id="jquery_tips_style" type="text/css">';
        style+='.jq_tips_box{padding:10px;position:absolute;overflow:hidden;display:inline;display:none;z-index:10176523;}';
        style+='.jq_tips_arrow{display:block;width:0px;height:0px;position:absolute;}';
        style+='.jq_tips_top{border-left:10px solid transparent;left:20px;bottom:0px;}';
        style+='.jq_tips_left{border-top:10px solid transparent;right:0px;top:18px;}';
        style+='.jq_tips_bottom{border-left:10px solid transparent;left:20px;top:0px;}';
        style+='.jq_tips_right{border-top:10px solid transparent;left:0px;top:18px;}';
        style+='.jq_tips_info{word-wrap: break-word;word-break:normal;border-radius:4px;padding:5px 8px;max-width:130px;overflow:hidden;box-shadow:1px 1px 1px #999;font-size:12px;cursor:pointer;}';
        style+='</style>';
        $(document.body).append(style);
    }
        this.each(function(){
        	//为了能找到tip和原始的对应关系可以1:全局仅仅一个2.从data中判断。先采用1:并将刚刚创建的对象放在闭包中
              var toDetail={};
            var element=$(this);
            
            function showTips(){
            	var element_top=element.offset().top,element_left=element.offset().left,element_height=element.outerHeight(),element_width=element.outerWidth();
                options.side=options.side<1?1:options.side>4?4:Math.round(options.side);
                var sideName=options.side==1?'top':options.side==2?'right':options.side==3?'bottom':options.side==4?'left':'top';
                var tips=$('<div class="jq_tips_box  jq_tips_box_xs"><i class="jq_tips_arrow jq_tips_'+sideName+'"></i><div class="jq_tips_info">'+options.msg+'</div></div>').appendTo(document.body);
                tips.find('.jq_tips_arrow').css('border-'+sideName,'10px solid '+options.bg);
                tips.find('.jq_tips_info').css({
                    color:options.color,
                    backgroundColor:options.bg
                });
                switch(options.side){
                    case 1:
                        tips.css({
                            top:element_top-tips.outerHeight()+options.x,
                            left:element_left-10+options.y
                        });
                        break;
                    case 2:
                        tips.css({
                            top:element_top-20+options.x,
                            left:element_left+element_width+options.y
                        });
                        break;
                    case 3:
                        tips.css({
                            top:element_top+element_height+options.x,
                            left:element_left-10+options.y
                        });
                        break;
                    case 4:
                        tips.css({
                            top:element_top-20+options.x,
                            left:element_left-tips.outerWidth()+options.y
                        });
                        break;
                    default:
                }
                
                
                
                tips.fadeIn("fast");
                $(tips).hover(function(){
                	 $.fn.tipsXs.closeAll( toDetail.elements);
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
                	if(toDetail.tipTime==null){
                		toDetail.tipTime=setTimeout(function(){
                			if(toDetail.tips!=null){
                				toDetail.tips.remove();
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
           	   $.fn.tipsXs.closeAll( toDetail.elements);
            	//光标移到element
            	if(toDetail.tipTime!=null){
            		clearTimeout(toDetail.tipTime);
            		toDetail.tipTime=null;
            	}
            	if(toDetail.tips==null){
            		toDetail.tips=showTips();
            	}
            	
            },function(){
            	//光标移开element
            	if(toDetail.tipTime==null){
            		toDetail.tipTime=setTimeout(function(){
            			if(toDetail.tips!=null){
            				toDetail.tips.remove();
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
    
    
    $.fn.tipsXs.closeAll=function(excludeElement){
    	if(excludeElement){
    		for(var i=0;i<allDetail.length;i++){
    			if($(allDetail[i].elements).data("xsUuid")==$(excludeElement).data("xsUuid")){
    				continue;
    			}
    			else{
    				if(allDetail[i].tips){
    			    	  $(allDetail[i].tips).remove();
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
    			    	  $(allDetail[i].tips).remove();
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
	$.fn.tipXsClick=function(options){
		    var defaults = {
            side:1,
            msg:'',
            color:'#FFF',
            bg:'#F00',
            time:2,
            x:0,
            y:0
        }
        var options = $.extend(defaults, options);
        if (!options.msg||isNaN(options.side)) {
        throw new Error('params error');
    }
    if(!$('#jquery_tips_style').length){
        var style='<style id="jquery_tips_style" type="text/css">';
        style+='.jq_tips_box{padding:10px;position:absolute;overflow:hidden;display:inline;display:none;z-index:10176523;}';
        style+='.jq_tips_arrow{display:block;width:0px;height:0px;position:absolute;}';
        style+='.jq_tips_top{border-left:10px solid transparent;left:20px;bottom:0px;}';
        style+='.jq_tips_left{border-top:10px solid transparent;right:0px;top:18px;}';
        style+='.jq_tips_bottom{border-left:10px solid transparent;left:20px;top:0px;}';
        style+='.jq_tips_right{border-top:10px solid transparent;left:0px;top:18px;}';
        style+='.jq_tips_info{word-wrap: break-word;word-break:normal;border-radius:4px;padding:5px 8px;max-width:130px;overflow:hidden;box-shadow:1px 1px 1px #999;font-size:12px;cursor:pointer;}';
        style+='</style>';
        $(document.body).append(style);
    }
        this.each(function(){
        	//为了能找到tip和原始的对应关系可以1:全局仅仅一个2.从data中判断。先采用1:并将刚刚创建的对象放在闭包中
              var toDetail={};
            var element=$(this);
            
            function showTips(){
            	
            	var element_top=Math.round(element.offset().top),element_left=Math.round(element.offset().left),element_height=element.outerHeight(),element_width=element.outerWidth();
                options.side=options.side<1?1:options.side>4?4:Math.round(options.side);
                var sideName=options.side==1?'top':options.side==2?'right':options.side==3?'bottom':options.side==4?'left':'top';
                var tips=$('<div class="jq_tips_box  jq_tips_box_xs"><i class="jq_tips_arrow jq_tips_'+sideName+'"></i><div class="jq_tips_info">'+options.msg+'</div></div>').appendTo(document.body);
             
                tips.find('.jq_tips_arrow').css('border-'+sideName,'10px solid '+options.bg);
                tips.find('.jq_tips_info').css({
                    color:options.color,
                    backgroundColor:options.bg
                });
             
                switch(options.side){
                    case 1:
                        tips.css({
                            top:element_top-tips.outerHeight()+options.x,
                            left:element_left-10+options.y
                        });
                        break;
                    case 2:
                        tips.css({
                            top:element_top-20+options.x,
                            left:element_left+element_width+options.y                           
                        });  
                        break;
                    case 3:
                        tips.css({
                            top:element_top+element_height+options.x,
                            left:element_left-10+options.y
                        });
                        break;
                    case 4:
                        tips.css({
                            top:element_top-20+options.x,
                            left:element_left-tips.outerWidth()+options.y
                        });
                        break;
                    default:
                }
                
                
                tips.fadeIn("fast");            
                $(tips).click(function(event){					
                	 $.fn.tipsXs.closeAll( toDetail.elements);
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
           	   $.fn.tipsXs.closeAll( toDetail.elements);
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
					  $.fn.tipsXs.closeAll();
					  
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