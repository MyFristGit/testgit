/*本js文件主要用来简化对话框的使用
 * 使用例子
 * //ShowYesNoDialog({title:"提示",content:"保存成功",yes:function(){
	//	alert("ddd");
	//	closeMyDialog();
//	}});
	
	showTip("提示","保存成功");
	top.showTipThenDo("提示","保存成功",function(){
			    						alert("ddd");
			    						top.closeMyDialog();
			    					});
 * 
 * 
 * 
 * */


  var  maxDiv=2000;
  function   createADialog(html,width,height,fn){
    	 //  var  $zhezhao=$("<div></div>").addClass("zhezhao").appendTo($(document));
    	   //  maxDiv++;//
    	   width=width||600;
    	   height=height||300;
    	   if($("#zhezhao"+maxDiv).length>0){
    		   $("#zhezhao"+maxDiv).remove();
    	   }
           var boarddiv = "<div id='zhezhao"+maxDiv+"'></div>"; 
    	   
    	   $(document.body).append(boarddiv);
    	   $("#zhezhao"+maxDiv).css("zIndex",maxDiv).addClass("zhezhao2").show();
          var showDiv = "<div id='showDiv"+(maxDiv+1)+"'  ></div>"; 
          var guanBi = "<span class='guanbi2'  style='z-index:9999;'></div>"; 
    	   $(document.body).append(showDiv);
    	   $("#showDiv"+(maxDiv+1)).css("zIndex",(maxDiv+1)).addClass("showDiv2").show()
    	   .html(html).width(width).height(height).css("marginTop","-"+(height/2)+"px")
    	   .css("marginLeft","-"+(width/2)+"px").append(guanBi);
    	   
    	   $(".guanbi2").click(function(){
    		   $(".zhezhao2").remove();
    		   $(this).parent().remove();
    		   
    		   
    	   });
    	   if(fn){
    		   fn();
    	   }
       }
  
  
  function closeMyDialog(fn){
	  $(".zhezhao2").remove();
	  $(".showDiv2").remove();
	  $(".xsDialog2").remove();
	  if(fn) fn();
  }
  
  
  
 
  //通过修改options的传入值，可以完成许多效果
  function   ShowYesNoDialog(options){
 	 //  var  $zhezhao=$("<div></div>").addClass("zhezhao").appendTo($(document));
 	   //  maxDiv++;//
	
	  var defaultOptions={
			  width:600,
			  height:300,
			  callBack:function(){},
			  title:"是否确定",
			  content:"",
			  yes:function(){
				  
				  alert("ok");
			  },
			  no:function(){
				  closeMyDialog();
			  },
			  buttons:[
			           {
			        	   caption:"确定",
			        	   action:function(){
			        		   options.yes();
			        		   },
			        	  cssText:"buttonYes"
			           },
			           {
			        	   caption:"取消",
			        	   action:function(){
			        		   options.no();
			        		   },
			        		cssText:"buttonNo"
			              
			           }
			           ],
			  fn:function(){},
			  showClose:true,
			  milliSeconds:0
	  }
	  options= $.extend(defaultOptions, options);
	  closeMyDialog();
        var boarddiv = "<div id='zhezhao"+maxDiv+"'></div>"; 
 	   
 	   $(document.body).append(boarddiv);
 	   $("#zhezhao"+maxDiv).css("zIndex",maxDiv).addClass("zhezhao2").show();
       var showDiv = "<div id='showDiv"+(maxDiv+1)+"'  ></div>"; 
       var guanBi = "<span class='guanbi2'  style='z-index:9999;'></div>"; 
       
       if(options.content!="")
 	     $(document.body).append(showDiv);
 	 //  options.content="<h1  style='font-size: 24px;color: #474747;display: inline-block;padding-top:50px;'>"+options.content+"</h1>";
 	   $("#showDiv"+(maxDiv+1)).css("zIndex",(maxDiv+1)).addClass("showDiv2").show()
 	   .width(options.width).height(options.height).css("marginTop","-"+(options.height/2)+"px")
 	   .css("marginLeft","-"+(options.width/2)+"px");
 	   
 	  if(options.showClose) 
 	    $("#showDiv"+(maxDiv+1)).append(guanBi);
 	  
 	   var $title=$("<div class='title'>"+options.title+"</div>")
 	   $("#showDiv"+(maxDiv+1)).append($title);
 	   
 	 
 		  var $Content=$("<div class='content'>"+options.content+"</div>")
  	      $("#showDiv"+(maxDiv+1)).append($Content);
 	  
 	
 	  
 	 var $ButtonBar=$("<div class='buttonBar'></div>")
	     $("#showDiv"+(maxDiv+1)).append($ButtonBar);
 	 //<button class="dialog_button default rightest fr">确定</button>
 	 
 	 
 	 $.each(options.buttons,function(i,e){ 		 
 		var $temp= $("<button   class='"+e.cssText+"'>"+e.caption+"</button>");
 		$temp.appendTo($ButtonBar);
 		 $temp.click(function(){
 			 e.action();
 		 });
 	 });
 	
 	 
 	  
 	  
 	   $(".guanbi2").click(function(){
 		  closeMyDialog();
 	   });
 	  
 	   
 	  if(options.milliSeconds!=0){
 		  setTimeout(function(){
 			 closeMyDialog();
 			  if(options.fn){
 		 		  options.fn();
 		 	   }
 		  },options.milliSeconds);
 	  }else{
 		 if(options.fn){
 	 		  options.fn();
 	 	   }
 		  
 	  }
 	
    }
  
  
  function showTip(title,content){
	  ShowYesNoDialog({title:title,content:content,
		  buttons:[
		           {
		        	   caption:"确定",
		        	   action:function(){
		        		   closeMyDialog();
		        		   },
		        	  cssText:"buttonYes"
		           }
		           ]
		  				
	  					});
  }
  
  
  function showTipThenDo(title,content,fn){
	  ShowYesNoDialog({title:title,content:content,
		  buttons:[
		           {
		        	   caption:"确定",
		        	   action:function(){
		        		   if(fn)fn();
		        		      closeMyDialog();
		        		   },
		        	  cssText:"buttonYes"
		           }
		           ]
		  				
	  					});
  }
  
  function showTipThenClose(title,content,fn,milliSeconds){
	  ShowYesNoDialog({title:title,content:content,fn:fn,width:200,height:100,
		  buttons:[],milliSeconds:milliSeconds,showClose:false});
  }
  
  
  
  function showMask(){
	  ShowYesNoDialog({title:"提示",content:"",
		  buttons:[ ],showClose:false,width:300,height:200});
  }
  function showMaskAndContent(content){
	  ShowYesNoDialog({title:"提示",content:content,
		  buttons:[ ],showClose:false,width:300,height:200});
  }
  
  function deleteMask(){
	   closeMyDialog();
  }
  
  function  waitIframeLoadOk(frameIdDom){
	  top.showMask();
	      //显示加载中，等加载结束后清除遮罩
	
      if (frameIdDom.attachEvent) {  
	
    	  frameIdDom.attachEvent("onload", function() { 
              top.deleteMask();
          });      
      } else {      
    	  frameIdDom.onload = function() { 
        	  top.deleteMask();
          }; 
		  
      } 
  }
  
  
  
  function  waitIframeLoadOkNoTip(frameIdDom){
	  top.showMask();
	      //显示加载中，等加载结束后清除遮罩
	
      if (frameIdDom.attachEvent) {  
	
    	  frameIdDom.attachEvent("onload", function() { 
              top.deleteMask();
          });      
      } else {      
    	  frameIdDom.onload = function() { 
        	  top.deleteMask();
          }; 
		  
      } 
  }
  
  function  openDialogBySrc(options){//src,fn
	  var defaultOptions={
			  src:"http://www.baidu.com",
			  fn:function(){}
	  }
	  options= $.extend(defaultOptions, options);
	  closeMyDialog();
      var boarddiv = "<div id='zhezhao"+1000+"'></div>"; 
 	   $(document.body).append(boarddiv);
 	   $("#zhezhao"+1000).css("zIndex",1000).addClass("zhezhao3").show();
 	   
 	   
       var showDiv = "<div id='showDiv"+(1000+1)+"'  ></div>"; 
       var guanBi = "<span class='guanbi3'  style='z-index:1200;'></div>";       
 	   $(document.body).append(showDiv);
 	 //  options.content="<h1  style='font-size: 24px;color: #474747;display: inline-block;padding-top:50px;'>"+options.content+"</h1>";
 	   $("#showDiv"+(1000+1)).css("zIndex",(1000+1)).addClass("xsDialog3").show();
 	    $("#showDiv"+(1000+1)).append(guanBi);
 	  
 	    
 	    if(options.width)
 	    	$("#showDiv"+(1000+1)).width(options.width).css("marginLeft","-"+(options.width/2)+"px");
 	    if(options.height)
 	    	$("#showDiv"+(1000+1)).height(options.height).css("marginTop","-"+(options.height/2)+"px");
 	 
 	 
 		  var $Content=$("<iframe  id=\"xsDialogFrame\"  src=\""+options.src+"\" scrolling=\"auto\" "+
            	"style=\"width:100%;height:100%;border:0px ;\" frameborder=\"1\" ></iframe>")
  	      $("#showDiv"+(1000+1)).append($Content);
 		if(options.alwaysShow){
 			
 		}
 	  
 	   $(".guanbi3").click(function(){
 		  closeSrcDialog(options.fn);
 	   });
 	  if  (typeof fixDialog !== undefined) {
 		  fixDialog(options);
 		  DialogGlobalOption=options;
 	  }
 	   
  }
  var  DialogGlobalOption={};
  
  
  $(function(){	
		$(window).resize(function(){
			fixDialog(DialogGlobalOption);
		});
		
	});
  
  
  function fixDialog(option){
		if($(window).width()<1033){
			 $(".xsDialog3").css("left","0px");
			 $(".xsDialog3").css("marginLeft","0px");
		}else{
		
			 if(option &&  option.width){
				 $(".xsDialog3").css("left",Math.floor((($(window).width()-option.width)/2))+"px");
				 
			 }else{
				 $(".xsDialog3").css("left",Math.floor((($(window).width()-1033)/2))+"px");
				 
			 }
			
			 $(".xsDialog3").css("marginLeft","0px");
		}
		if($(window).height()<555){
			 $(".xsDialog3").css("top","0px");
			 $(".xsDialog3").css("marginTop","0px");
		}else{
			// if(document.body.style.overflow!="hidden" && document.body.scroll!="no" &&
					   //document.body.scrollHeight>document.body.offsetHeight )
					//{
					// alert("有滚动条");
					//}else 
					//{ 
					// alert("无滚动条");
					//}
		
			//为了简化处理，统一将对话框显示在顶部，然后滚动到顶部。
			 
		  
			if($(document).height()>$(window).height()){
				if($(window).height()>670){//高度获取有时有问题。
					 $(".xsDialog3").css("top","40px");	
					  $('html,body').animate({scrollTop:0},0);	
				}else{
					 $(".xsDialog3").css("top",Math.floor((($(window).height()-555)/2))+"px");
				}
				 $(".xsDialog3").css("marginTop","0px");
				// $(".xsDialog3").css("position","fixed");
				
			}else{
				 $(".xsDialog3").css("top",Math.floor((($(window).height()-555)/2))+"px");
				 $(".xsDialog3").css("marginTop","0px");
				
			}
			 
			 
			
		}
		
	}
  
  function closeSrcDialog(fn){
	  $(".zhezhao3").remove();
	  $(".showDiv3").remove();
	  $(".xsDialog3").remove();
	  if(fn) fn();
  }
  //显示自动关闭的对话框eg:showOneSecondDialog("提示","修改成功",1000)
  function showOneSecondDialog(title,content,milliSeconds){
	  ShowYesNoDialog({
		  width:600,
		  height:300,
		  callBack:function(){},
		  title:title,
		  content:content,
		  yes:function(){
			  
			 
		  },
		  no:function(){
			 
		  },
		  buttons:[
		          
		           ],
		  fn:function(){},
		  showClose:false,
		  milliSeconds:milliSeconds
	  });
	  
  }
  
	
 
  
  