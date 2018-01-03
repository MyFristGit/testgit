
    //异步加载处理，对有属性ajaxUrl="allService.html"
    //,发起ajax请求后填充。如果有按需加载的话，点击tab时才发起请求，用 loadOnDemand表示
    //提取出来的公共处理写为一个函数，两个选择器
    //  <div  class="tab" style="display:none;"  id="delayLoad3"  ajaxUrl="allService.html"  delayLoad="true">
                               		
     //delayLoad表示点击tab后发起ajax请求，否则在页面初始化时就发起请求
//在装载时提示给用户的正在装载先用一个临时的html代替，装载后去掉
   // </div>
  /* 使用例子
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
    	 },
    	 	callbackClick:function(index,data){
	            		 alert("每次点击执行"+index);
	           		// if(!resizeEcharts  && index==1){
	               		// resizeEcharts=true;
	               		// guideStudent.resize(); achievements.resize();researchFunding.resize();researchProject2.resize();           		 
	              // 	 }
	           	 }
    	 
     });
   
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
    
    
    
(function ($) {
	if(!$.tan)$.tan={};
	
    $.tan.tab = function(option){
    	   var  hoverClass=option.hoverClass||"hover";
    	   var  activeClass=option.activeClass||"active";
    	    //查找是否要提前ajax装载
         	$(option.tab).each(function(i,d){         		
         		if(typeof $(d).attr('ajaxUrl')!="undefined"  &&  (typeof $(d).attr('delayLoad') ==  'undefined'  || $(d).attr('delayLoad')!="true" ) ){
         			$.post($(d).attr('ajaxUrl'),function(data){
         				$($(d)).data("alreadyLoad",true);
         				var  $nowDo=$(option.tab).eq(i);
         				$nowDo.html(data);
         				if(option.callback){
        					setTimeout(function(){
        						option.callback(i,$nowDo[0]);
            				},100);
        				}
         			});
         			
         		}
         		
         	});
    	  
         	//var $tabTitle=$(option.title);//".zuixin .showDown");  
         	
         	function  actionDo(who){
         		
         	     // $(".zuixin .active").removeClass("active");
                	
                  	 $(option.title+"." +activeClass).removeClass(activeClass);
                  	 $(who).addClass(activeClass);
                  	 var index=$(option.title).index(who);
                  	// $(".showBottom  .tab").eq(index).show().siblings().hide(); 
                  	$(option.tab).eq(index).show().siblings().hide(); 
                  	var  $nowDo=$(option.tab).eq(index);
                  	
                  //装载
                
                	if(!$nowDo.data("alreadyLoad")  && typeof $nowDo.attr('ajaxUrl') !="undefined"){
                		$nowDo.data("alreadyLoad",true); 
                     			$.post($nowDo.attr('ajaxUrl'),function(data){
                     				$nowDo.html(data);
                     				if(option.callback){
                    					setTimeout(function(){
                    						option.callback(index,$nowDo[0]);
                        				},100);
                    				}
                     			});
                     
                	}
                	
                	//因为装载有个过程，必须等会再执行
                	
                 	if(option.callbackClick){
    					setTimeout(function(){
    						option.callbackClick(index,$nowDo[0]);
        				},100);
    				}
                	
                  
         		
         	}
         	
            if(option.hover){
            	$(option.title).hover(function(){
                	actionDo(this);
                });
            	
            }else{
            	$(option.title).click(function(){
            		   actionDo(this);
            		   
            	   });
            		   /*
            		   $(option.title+"." +activeClass).removeClass(activeClass);
                    	 $(this).addClass(activeClass);
                     	 var index=$tabTitle.index(this);
                     	$(option.tab).eq(index).show().siblings().hide(); 
                     	var  $nowDo=$(option.tab).eq(index);
                     	
                     //装载
                   
                   	if(!$nowDo.data("alreadyLoad")  && typeof $nowDo.attr('ajaxUrl') !="undefined" ){
                   		$nowDo.data("alreadyLoad",true); 
                        			$.post($nowDo.attr('ajaxUrl'),function(data){
                        				$nowDo.html(data);
                        				//因为装载有个过程，必须等会再执行
                        				if(option.callback){
                        					setTimeout(function(){
                        						option.callback(index,$nowDo[0]);
                            				},100);
                        				}
                        			});
                        
                   	}
                   	
                   	
                   	
                   	if(option.callbackClick){
    					setTimeout(function(){
    						option.callbackClick(index,$nowDo[0]);
        				},100);
    				}
                   
                      }).hover(function(){
                     	 $(this).addClass(hoverClass);
                      },function(){
                     	 $(this).removeClass(hoverClass);
                      });*/
            		   
            	
         }
   
            $(option.title).hover(function(){
                	
                 	 $(this).addClass(hoverClass);
                  },function(){
                 	 $(this).removeClass(hoverClass);
           });
            
        
            //保存最新的，使得前台能取到控件
		//	if(!$(this).data("saveTip")){
			//	$(this).data("saveTip",tips);
		//	}else{
			//	$(this).data("saveTip").click();
			//	$(this).data("saveTip",tips);
		//	}
						
      
        return this;
    };
    
  
    $.tan.tab.addTab = function(option){
    	var  hoverClass=option.hoverClass||"hover";
    	var  activeClass=option.activeClass||"active";
    	var title;
    	if(option.index>$(option.title).length)
    		option.index=$(option.title).length-1;  
    	if(option.index<0)
    		option.index=0;
    	  	
    	if(option.after){
    		//title=$(option.title).eq(option.index).insertAfter(option.insertTitle);
    		
    		title=$(option.insertTitle);
    		title.insertAfter($(option.title).eq(option.index));
    		
    		
    	}else{
    		//title=$(option.title).eq(option.index).insertBefore(option.insertTitle);
    		title=$(option.insertTitle);
    		title.insertBefore($(option.title).eq(option.index));
    	}
    	
    	
    	var  tab;
      	var  $nowDo=$(option.tab).eq(option.index);
      	if(option.after){
      		//tab=$nowDo.insertAfter(option.insertTab);
      		tab=$(option.insertTab);
      		tab.insertAfter($nowDo);
    	}else{
    		//tab=$nowDo.insertBefore(option.insertTab);
    		tab=$(option.insertTab);
    		tab.insertBefore($nowDo);
    	}
      
      	function actionDo(){
      		 $(option.title+"." +activeClass).removeClass(activeClass);
        	 title.addClass(activeClass);
        	 tab.show().siblings().hide(); 
        	 //装载
             
            	if(!tab.data("alreadyLoad")  && typeof tab.attr('ajaxUrl') !="undefined" ){
            		tab.data("alreadyLoad",true); 
                 			$.post(tab.attr('ajaxUrl'),function(data){
                 				tab.html(data);
                 				//因为装载有个过程，必须等会再执行
                 				if(option.callback){
                 					setTimeout(function(){
                 						option.callback(index,tab[0]);
                     				},100);
                 				}
                 			});
                 
            	}
            	
            	if(option.callbackClick){
					setTimeout(function(){
						option.callbackClick(index,tab[0]);
    				},100);
				}
            	
      		
      	}
      	
      	
        if(option.hover){
        	title.hover(actionDo);
        }else{
        	title.click(actionDo);
        }
        
      	
        title.hover(function(){
        	 $(this).addClass(hoverClass);
         },function(){
        	 $(this).removeClass(hoverClass);
         });
      	
    	
    	
    	
    	
    
    	
    	
    }
    
    $.tan.tab.active = function(option){
    	var  hoverClass=option.hoverClass||"hover";
    	var  activeClass=option.activeClass||"active";
    	if(option.index>$(option.title).length)
    		option.index=$(option.title).length-1;  
    	if(option.index<0)
    		option.index=0;
    	
    	var title=$(option.title).eq(option.index);
    	var  tab=$(option.tab).eq(option.index);
    	 $(option.title+"." +activeClass).removeClass(activeClass);
    	 title.addClass(activeClass);
    	 tab.show().siblings().hide(); 
    	 if(option.callbackClick){
				setTimeout(function(){
					option.callbackClick(index,tab[0]);
				},100);
		}
    }
    
    
	$.tan.tab.removeTab = function(option){
    	
    }
   
	
	
	
	})(jQuery);