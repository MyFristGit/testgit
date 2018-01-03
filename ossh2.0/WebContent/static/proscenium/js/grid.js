//本文件主要集中表格插件和分页插件的处理
//分页插件主要输出下边格式的html
/*
    <div  class="pagerContainer"  >  
        <div  class="pager"   style="width:100%;height:100%;position:relative;">
        	<div  class="bh-pager">
        		<div class="bh-pull-left">
        			<a style="cursor:pointer;" class="bh-pager-btn  waves-effect" pager-flag="prev">
        			   <i class="fa fa-chevron-left"   aria-hidden="true" style="font-size:24px;color:#50cafc;margin-top:2px;"></i>	  
        			</a>
        			<a style="cursor:pointer;" class="bh-pager-btn  waves-effect" pager-flag="next">
        			    <i class="fa fa-chevron-right"   aria-hidden="true" style="font-size:24px;color:#50cafc;margin-top:2px;"></i>
        			</a>
        			<span  class="bh-pager-num">1-10 总记录数 10 </span>
        			<label  class="bh-pager-label">跳转至</label>
        			<input type="text" class="bh-form-control bh-pager-input" pager-flag="gotoPager"  onfocus="this.select();"  onkeypress="return checkNum(event);">
        			<span>页</span>
        		</div>
        		<div class="bh-pull-right">
        			<div  pager-flag="pagerOptionSel"  
        				class="bh-pull-right jqx-widget jqx-dropdownlist-state-normal jqx-rc-all jqx-fill-state-normal  jqx-fill-state-pressed jqx-rc-b-expanded"
        				 style="width:60px;height:26px;">
        				 <div   class="pageDropDown"  style="background-color: transparent; -webkit-appearance: none; outline: none; width:100%; height: 100%; padding: 0px; margin: 0px; border: 0px; position: relative;">
        					<div    class="dropdownlist-state-selected"  style="outline: none; background-color: transparent;  float: left; width:100%; height: 100%; position: relative;">
        						<div  style="box-sizing: border-box;outline: none; background-color: transparent; border: none; float: left; position: relative; width: 33px; height: 24px; left: 0px; top: 0px;" 
        						     class="jqx-dropdownlist-content jqx-disableselect">
        						     10
        						</div>
        						<div  style="background-color: transparent; border: none; float: right; position: relative; width: 19px; height: 24px;">
        						    <div  unselectable="on"   class="jqx-icon-arrow-down jqx-icon">
        						    </div>
        						</div>
        					</div>	
        					<div  style="position:relative;">
        						 <div  class="itemPerPage" id="test1"  style="box-shadow: 0 2px 8px rgba(0,0,0,.28);width:58px;height:120px;overflow:auto;position:absolute;top:-120px;background:#f6f6f6;">
				  		           <div  style="width:58px ;height:165px;overflow:visible;">
				  		              <div  class="pageList" style="">
				  		         	      	<span   class="pageListSpan"> 5</span>
				  		         	   </div>
				  		         	    <div  class="pageList">
				  		         	      	<span class="pageListSpan" > 10	</span>
				  		         	   </div>
				  		         	    <div  class="pageList">
				  		         	      	<span class="pageListSpan" 	>   15	</span>
				  		         	   </div>
				  		         	    <div  class="pageList">
				  		         	      	<span class="pageListSpan" 	> 20</span>
				  		         	   </div>
				  		         	    <div  class="pageList">
				  		         	      	<span class="pageListSpan" 	>  50  	</span>
				  		         	   </div>
				  		         	    <div  class="pageList">
				  		         	      	<span class="pageListSpan" >  100	</span>
				  		         	   </div>
				  		         	   <div  class="pageList">
				  		         	      	<span class="pageListSpan" >  200	</span>
				  		         	   </div>				  		           
				  		           </div>
				  		         </div>        					
        					</div> 
        				 </div>
        			</div>
        			<label class="bh-pull-right bh-pager-label">每页显示</label>
        		</div>
        	</div>
        </div>
     </div>
					  		     
*/

   

   $(document).on("focus", ".bh-form-control.bh-pager-input", function(){ 
	   $(this).data("oldData",$.trim($(this).val()));
   });
   

   $(document).on("blur", ".bh-form-control.bh-pager-input", function(event){ 
	   event.stopPropagation();
	   //取出页面的数据
	
	   var  data= $(this).closest(".nav-wrapper").find(".pageWrap").data("pageInfo");

	  // var  data= $(this).closest(".pagerContainer").data("pageInfo");
	  if(typeof data ===  "undefined"){
		  return ;
	  }
	   $(this).val($.trim($(this).val()));
	  if( !/^\d*$/.test($(this).val())){
		  $(this).tips({
				side : 1,
				msg : "只能输入数字",
				bg : '#FF5080',
				time : 3
			});
		  $(this).val($(this).data("oldData"));
		  return;
	  }
	  
	  var oldPage=$(this).data("oldData"); 
	  if($.trim($(this).val()).length==0){
		  $(this).tips({
				side : 1,
				msg : "不能为空",
				bg : '#FF5080',
				time : 3
			});
		  $(this).val(oldPage); 
		  return;
	   }
	  if(oldPage==$.trim($(this).val())){
		  return;//页面不变，不处理		  
	  }
	  //计算数据是否在合理范围内
	
	  var   pageNum=parseInt($(this).val());
	  var maxPageNum=(Math.floor(data.recordCount %  data.pageSize)==0 ?  Math.floor(data.recordCount/data.pageSize) : ( Math.floor(data.recordCount/data.pageSize)+1));
	
	  if(isNaN(pageNum)  ||   pageNum<1 ||  pageNum>maxPageNum){
		//如果页码错误 则中断
		  $(this).tips({
				side : 1,
				msg : "页码超出范围",
				bg : '#FF5080',
				time : 2
			});
		  $(this).val($(this).data("oldData")); 
		  return;
	  }
	  
	 //将变更存入全局的data中
	  data.pageNum=parseInt($(this).val());
	  $(this).closest(".nav-wrapper").find(".pageWrap").data("pageInfo",data);
	  $(this).closest(".nav-wrapper").find(".pageWrap").trigger("pageNumberChange");
	
	
   });

   
   

function showLine(line,isFirst){
			isFirst=isFirst||false;			
			document.write(
					'<div  class="line  '+(isFirst?'firstLine':'')+'">');
			for(var i=0;i<line.length;i++){
				showLineUnit(line[i][0],line[i][1],line[i][2],i==0?true:false);
				
			}
			document.write(
			'</div>');
		}
		
		function showLineUnit(label,value,isNone,isFirst){
			isFirst=isFirst||false;
			if(typeof isNone  ==  "undefined"){
				document.write(
						' <div  class="lineUnit   '+   (isFirst?'lineFirst':'')+'">'+
			            '	<div  class="label">'+label+'</div>'+
	  		           	'	<div  class="labelValue">'+value+'</div>'+
	  		           ' </div>'
						);
				
			}else  if(isNone=="none"){
				document.write(
						' <div  class="lineUnit   unitNone'+   (isFirst?'lineFirst':'')+'">'+
			            '	<div  class="label">'+label+'</div>'+
	  		           	'	<div  class="labelValue">'+value+'</div>'+
	  		           ' </div>'
						);
				
				
			}
			
		}
		
		function showTableLine(line,isFirst,width,backGroundColor){
			isFirst=isFirst||false;	
			backGroundColor=backGroundColor||"white";
			document.write(
					'<div  class="line  '+(isFirst?'firstLine':'')+'"  '+'style="width:'+width+'px;"'+'>');
			for(var i=0;i<line.length;i++){
				showTableLineUnit(line[i][0],(i==0 ? true : false),line[i][1],line[i][2],backGroundColor);
				
			}
			document.write(
			'</div>');
		}
		
		function showTableLineUnit(value,isFirst,width,isWeight,backGroundColor){
			isFirst=isFirst||false;
			width=width||170;
			isWeight=isWeight||false;
			
				document.write(
						' <div  class="lineUnit   '+   (isFirst?'lineFirst':'')+'">'+
			            '	<div  class="label"  style="background:'+backGroundColor+';border:none;width:'+width+'px;'+(isWeight? 'font-weight:700;' : 'font-weight:normal;' )+'">'+value+'</div>'+	  		          
	  		           ' </div>'
						);
			
		}
		
		
		
		function showLine(line,isFirst){
			isFirst=isFirst||false;			
			document.write(
					'<div  class="line  '+(isFirst?'firstLine':'')+'">');
			for(var i=0;i<line.length;i++){
				showLineUnit(line[i][0],line[i][1],line[i][2],i==0?true:false);
				
			}
			document.write(
			'</div>');
		}
		
		function showLineUnit(label,value,isNone,isFirst){
			
			document.write(getLineUnit(label,value,isNone,isFirst));
			/*
			isFirst=isFirst||false;
			if(typeof isNone  ==  "undefined"){
				document.write(
						' <div  class="lineUnit   '+   (isFirst?'lineFirst':'')+'">'+
			            '	<div  class="label">'+label+'</div>'+
	  		           	'	<div  class="labelValue">'+value+'</div>'+
	  		           ' </div>'
						);
				
			}else  if(isNone=="none"){
				document.write(
						' <div  class="lineUnit   unitNone'+   (isFirst?'lineFirst':'')+'">'+
			            '	<div  class="label">'+label+'</div>'+
	  		           	'	<div  class="labelValue">'+value+'</div>'+
	  		           ' </div>'
						);
				
				
			}
			*/
			
		}
		
		function showTableLine(line,isFirst,width,backGroundColor){
			isFirst=isFirst||false;	
			backGroundColor=backGroundColor||"white";
			document.write(
					'<div  class="line  '+(isFirst?'firstLine':'')+'"  '+'style="width:'+width+'px;"'+'>');
			for(var i=0;i<line.length;i++){
				showTableLineUnit(line[i][0],(i==0 ? true : false),line[i][1],line[i][2],backGroundColor);
				
			}
			document.write(
			'</div>');
		}
		
		function showTableLineUnit(value,isFirst,width,isWeight,backGroundColor){
			isFirst=isFirst||false;
			width=width||170;
			isWeight=isWeight||false;
			
				document.write(
						' <div  class="lineUnit   '+   (isFirst?'lineFirst':'')+'">'+
			            '	<div  class="label"  style="background:'+backGroundColor+';border:none;width:'+width+'px;'+(isWeight? 'font-weight:700;' : 'font-weight:normal;' )+'">'+value+'</div>'+	  		          
	  		           ' </div>'
						);
			
		}
		
		//document 不可以在ajax中使用
		function getLine(line,isFirst){
			isFirst=isFirst||false;	
			var tempStr="";
			tempStr+='<div  class="line  '+(isFirst?'firstLine':'')+'">';
			for(var i=0;i<line.length;i++){
				tempStr+=getLineUnit(line[i][0],line[i][1],line[i][2],i==0?true:false,line[i][3],line[i][4]);
			}
			tempStr+='</div>';
			return tempStr;
		}
		
		//添加提示功能
		/*
		<div  class="lineUnit   lineFirst">
					  		            	<div  class="label">工号</div>
					  		           		<div  class="labelValue">fdfd</div>
					  		           		<div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">

				           		         	  		<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
					           		         		<div class="jq_tips_info2" style="">
					           		         		fdddddddddddddddddddddddddddddddddddddddddd

					           		         		</div>
				           		         	</div>
		
		*/
		
		function strlen(str){
		    var len = 0;
		    for (var i=0; i<str.length; i++) { 
		     var c = str.charCodeAt(i); 
		   
		    //单字节加1 
		     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) { 
		       len++; 
		     } 
		     else { 
		      len+=2; 
		     } 
		    } 
		    return len;
		}
		
		
		function getLineUnit(label,value,isNone,isFirst,widthContent,widthLabel,tipContent){
			isFirst=isFirst||false;
			widthContent=widthContent||154;
			widthLabel=widthLabel||146;
			var haveTip=(typeof tipContent!="undefined")||false;
			haveTip=haveTip||strlen(value)>24;			
			var tipContentTemp=(typeof tipContent!="undefined") ? ''+tipConent : ''+value;
			var tipHtml="";
			if(haveTip){
				tipHtml= '	   <div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">'+
		        '	     <i class="jq_tips_arrow2 jq_tips_right2" style=""></i>'+
		        '	     <div class="jq_tips_info2" >'+
		                      tipContentTemp+
		        '	     </div>'+
		        '	   </div>';
		    }else{
		    	tipHtml="";
		    }
			
			var tempStr="";
			if(typeof isNone  ==  "undefined"){
				tempStr+=(' <div  class="lineUnit   '+   (isFirst?'lineFirst':'')+'">'+
			            '	   <div  class="label"   style="width:'+widthLabel+'px;">'+label+'</div>'+
				        '	   <div  class="labelValue"   style="width:'+widthContent+'px;">'+value+'</div>'+
				               tipHtml+
				           ' </div>');
			
				
			}else  if(isNone=="none"){
				tempStr+=(' <div  class="lineUnit   unitNone'+   (isFirst?'lineFirst':'')+'">'+
	            '	<div  class="label"   style="width:'+widthLabel+'px;">'+label+'</div>'+
		           	'	<div  class="labelValue"   style="width:'+widthContent+'px;">'+value+'</div>'+
		           ' </div>');
			}
			return tempStr;
		}
		
		function getTableLine(line,isFirst,width,backGroundColor,otherOption){
			isFirst=isFirst||false;	
			var tempStr="";
			width=width||910;
			backGroundColor=backGroundColor||"white";
			tempStr+='<div  class="line  '+(isFirst?'firstLine':'')+'"  '+'style="width:'+width+'px;"'+'>';			
			for(var i=0;i<line.length;i++){	
				//对于line[i][3]表示全部信息，其中line[i][3]     { title:'交易地点',name:'JYDD',display:"none" }, 
				tempStr+=
				getTableLineUnit(line[i][0],(i==0 ? true : false),line[i][1],line[i][2],backGroundColor,otherOption,line[i][3]);
			}
			tempStr+='</div>';
			return tempStr;
		}
		
		function getTableLineUnit(value,isFirst,width,isWeight,backGroundColor,parentOption,otherOption){
			isFirst=isFirst||false;
			width=width||170;
			isWeight=isWeight||false;
			var height=32;
			var tip=null;
			var  tipClass="";
			var  show=true;
			if(typeof parentOption!="undefined" ){
				height=parentOption.height||height;
			}
			
			if(typeof otherOption!="undefined" ){
				height=otherOption.height||height;
				tip=otherOption.tip||tip;
				tipClass=otherOption.tipClass||tipClass;
				show=(otherOption.display  &&  otherOption.display=="none" )?  "display:none;":"";
			}
			var tipHtml="";
			if(tip!=null){
				tipHtml= '	   <div class="tip jq_tips_box2  jq_tips_box_xs2 '+tipClass+'"  directive="right"  style="display: none;">'+
		        '	     <i class="jq_tips_arrow2 jq_tips_right2" style=""></i>'+
		        '	     <div class="jq_tips_info2" >'+
		                      tip+
		        '	     </div>'+
		        '	   </div>';
		    }else{
		    	tipHtml="";
		    }
			
			
			var tempStr="";
			tempStr+=(' <div  class="lineUnit   '+   (isFirst?'lineFirst':'')+'"  '+
					'style="height:'+height+'px;'+show+'"'+	'  >'+
		            '	<div  class="label"  style="background:'+backGroundColor+
		            ';border:none;width:'+width+'px;'
		            +(isWeight? 'font-weight:700;' : 'font-weight:normal;' )+'">'
		            +value+'</div>'+ tipHtml+
		               
	  		           ' </div>');
			return tempStr;
			
		}
		
		/*
		 	<div  class="line  firstLine"   style="width:1300px;">
					  		          
					  		            
					  		            <div  class="lineUnit  lineFirst">
					  		            	<div  class="label"  style="border:none;width:100px;">操作</div>					  		           		
					  		            </div>
					  		            <div  class="lineUnit">
					  		            	<div  class="label"  style="border:none;width:170px;">专业技术职务</div>					  		           		
					  		            </div>				  		           
					  		          
					  		            
					  		            
		
		*/
	
		
		
//recordRange:1-10
//countRecord:10

function getPagination(id,recordRange,countRecord,pageChangeFunction,pageSizeChangeFunction,otherOption){
	var width=otherOption ? (otherOption.width ? ("width:"+otherOption.width+"px;") : ""):"";
	var topMargin=otherOption ? (otherOption.topMargin ? ("margin-top:"+otherOption.topMargin+"px;") : ""):"";
	var tempStr=	
	 '<div  class="pagerContainer" id="'+id+'"  style="'+ topMargin +'" >'+ 
     '<div  class="pager"   style="width:100%;height:100%;position:relative;">'+
     	'<div  class="bh-pager"   style="'+width+'">'+
     		'<div class="bh-pull-left">'+
     			'<a style="cursor:pointer;" class="bh-pager-btn  waves-effect" pager-flag="prev">'+
     			   '<i class="fa fa-chevron-left"   aria-hidden="true" style="font-size:24px;color:#50cafc;margin-top:2px;"></i>'+	  
     			'</a>'+
     			'<a style="cursor:pointer;" class="bh-pager-btn  waves-effect" pager-flag="next">'+
     			    '<i class="fa fa-chevron-right"   aria-hidden="true" style="font-size:24px;color:#50cafc;margin-top:2px;"></i>'+
     			'</a>'+
     			'<span  class="bh-pager-num">'+recordRange+' 总记录数 '+countRecord+' </span>'+
     			'<label  class="bh-pager-label">跳转至</label>'+
     			'<input type="text" value="1" class="bh-form-control bh-pager-input" pager-flag="gotoPager"  onfocus="this.select();" >'+
     			'<span>页</span>'+
     		'</div>'+
     		'<div class="bh-pull-right">'+
     			'<div  pager-flag="pagerOptionSel"'+  
     				'class="bh-pull-right jqx-widget jqx-dropdownlist-state-normal jqx-rc-all jqx-fill-state-normal  jqx-fill-state-pressed jqx-rc-b-expanded"'+
     				 'style="width:60px;height:26px;">'+
     				 '<div   class="pageDropDown"  style="background-color: transparent; -webkit-appearance: none; outline: none; width:100%; height: 100%; padding: 0px; margin: 0px; border: 0px; position: relative;">'+
     					'<div    class="dropdownlist-state-selected"  style="outline: none; background-color: transparent;  float: left; width:100%; height: 100%; position: relative;">'+
     						'<div  style="box-sizing: border-box;outline: none; background-color: transparent; border: none; float: left; position: relative; width: 33px; height: 24px; left: 0px; top: 0px;"'+ 
     						     'class="jqx-dropdownlist-content jqx-disableselect">'+
     						     '10'+
     						'</div>'+
     						'<div  style="background-color: transparent; border: none; float: right; position: relative; width: 19px; height: 24px;">'+
     						    '<div  unselectable="on"   class="jqx-icon-arrow-down jqx-icon">'+
     						    '</div>'+
     						'</div>'+
     					'</div>'+	
     					'<div  style="position:relative;">'+
     						 '<div  class="itemPerPage"   style="box-shadow: 0 2px 8px rgba(0,0,0,.28);width:58px;height:120px;overflow:auto;position:absolute;top:-120px;background:#f6f6f6;">'+
				  		           '<div  style="width:58px ;height:165px;overflow:visible;">'+
				  		              '<div  class="pageList" style="">'+
				  		         	      	'<span   class="pageListSpan"> 10</span>'+
				  		         	   '</div>'+
				  		         	    '<div  class="pageList">'+
				  		         	      	'<span class="pageListSpan" > 15	</span>'+
				  		         	   '</div>'+
				  		         	    '<div  class="pageList">'+
				  		         	      	'<span class="pageListSpan" 	>   20	</span>'+
				  		         	   '</div>'+
				  		         	    '<div  class="pageList">'+
				  		         	      	'<span class="pageListSpan" 	> 25</span>'+
				  		         	   '</div>'+
				  		         	    '<div  class="pageList">'+
				  		         	      	'<span class="pageListSpan" 	>  50  	</span>'+
				  		         	   '</div>'+
				  		         	    '<div  class="pageList">'+
				  		         	      	'<span class="pageListSpan" >  75	</span>'+
				  		         	   '</div>'+
				  		         	   '<div  class="pageList">'+
				  		         	      	'<span class="pageListSpan" >  100	</span>'+
				  		         	   '</div>'+				  		           
				  		           '</div>'+
				  		         '</div>'+        					
     					'</div>'+ 
     				 '</div>'+
     			'</div>'+
     			'<label class="bh-pull-right bh-pager-label">每页显示</label>'+
     		'</div>'+
     	'</div>'+
     '</div>'+
  '</div>';
	return tempStr;
}

//beforeId:在哪个后边添加
function insertPagination(beforeId,id,recordCount,pageNum,pageSize,url,pageChangeFunction,pageSizeChangeFunction,otherOption){
	 
	  var pageCount = recordCount % pageSize === 0 ? recordCount / pageSize : parseInt(recordCount / pageSize) + 1;
	  var recordFrom=1 + ((pageNum-1) * pageSize);
	  var recordTo= ((pageNum) * pageSize);
	  if(recordTo>recordCount){
		  recordTo=recordCount;
	  }
	  var recordRange=(recordFrom)+"-"+(recordTo);
	  var  $willInsert=$(getPagination(id,recordRange,""+recordCount,pageChangeFunction,pageSizeChangeFunction,otherOption));
 	   $willInsert.insertAfter($("#"+beforeId).closest(".pageWrap"));
 	  // $willInsert.css({"margin-left":"7px"}); 	   
 	//修改滚动条
	  $("#"+id+"   .itemPerPage").css({"display":"block"});
      	$("#"+id+"   .itemPerPage").mCustomScrollbar({
             theme: "#004e90"
      });
	  $("#"+id+"   .itemPerPage").css({"display":"none"});
	  
	  //将数据存入，方便后边获取
	  $("#"+beforeId).data(
		"pageInfo",{
			pageCount:pageCount,
			recordCount:recordCount,
			pageNum:pageNum,
			pageSize:pageSize,
			url:url
			}	  
	  );
	  
	  //跳转页面按下回车键
	  $("#"+id).find(".bh-pager-input").keypress(function(event){
		   var ie=window.navigator.appName=="Microsoft Inernet Explore"?true:false;
		   if(!ie)  var  key=event.which;
		   else     var  key=event.keyCode;
		   if(key==13){//不可全部触发，要有针对性
				 $(this).trigger("blur");	
		   }
		   if(key==8 ||  key==46 ||(key>=48 && key<=57)){
			   
		   }
		   else{//非法输入
			   
		   }
		});
	  
	  //页面大小改变时
	  $("#"+id).find(".pageListSpan").click(function(){
		  var target=$(this).closest(".pageDropDown").find(".dropdownlist-state-selected .jqx-disableselect");
			var  changeFrom=$.trim(target.html());
			var  changeTo=$.trim($(this).html());			
			if(changeFrom!=changeTo){
				target.html(changeTo);
				var obj=$("#"+beforeId).data("pageInfo");
				//判断页面大小的设置是否合法，当页面大小比较大时，旧的小页面下的页面可能超出范围，这时
				//统一跳到当前大小下的最后一页，就是修改页码
				//计算当前页面大小下的最大页号
				var  pageCount=(obj.recordCount %  changeTo  ==  0) ?
						parseInt(obj.recordCount / changeTo ):  parseInt(obj.recordCount /  changeTo) +1;
			    var  nowPageNum=obj.pageNum;
			    if(obj.pageNum>pageCount  &&  obj.pageNum!=1){
			    	obj.pageNum=pageCount;
			    	var  changeInput=$(this).closest(".bh-pager").find(".bh-pull-left  .bh-pager-input");
			    	changeInput.val(pageCount);
			    	setTimeout(function(){
			    		changeInput.tips({
							side : 1,
							msg : "超过最大页，已经改为最大页",
							bg : '#FF5080',
							time : 2
						});
			    	},500);
			    	
			    	
			    }
				obj.pageSize=parseInt(changeTo);
				$("#"+beforeId).data("pageInfo",obj);
				
			
				
				$("#"+beforeId).trigger("pageSizeChange",obj);
			
			
				
			}
			 $(".itemPerPage").slideUp();
		  
		  
	  });
	  
	  $("#"+beforeId).on("pageSizeChange",function(eventArgs){
		    var  obj=$.extend(true,{},$(this).data("pageInfo"),{userId:3});
		    var  mark=$(this).closest(".content");
			mark.showLoading();
		
		   $.ajax({
	   			type: "POST",
	   			url: obj.url,
	   			data: obj,
	   			dataType:'json',
	   			cache: false,
	   			success: function(data){
	   				mark.hideLoading();
	   			     var  targetTable= $("#"+beforeId).find(".table");
	   			     targetTable.html("");
	   			     //取出columns
	   			 var  cols= $("#"+beforeId).data(
	   				"pageCols" 
	   			  );
	   		
	   			     
	   			     for(var i=0;i<data.data.length;i++){
	   			    	for (var key in data.data[i]){
	   			    		data.data[i][key] =data.data[i][key] .replace(new RegExp("&",'gm'),"&amp;")
	   			    	   .replace(new RegExp("<",'gm'),"&lt;")
	   			    	   .replace(new RegExp('>','gm'),"&gt;")
	   			    	    .replace(new RegExp('"','gm'),"&quot;")
	   			    	    .replace(new RegExp("'",'gm'),"&apos;");
	   			       }
	   			    	 
	   			     }
	   			
	   	  
	   			     
	   			 
	   			  
	   			  
	   			  
	   			     targetTable.html(getTableHtml(cols,data.data));
	   				 var  height=parseInt(data.data.length);
	   				  height=(33*(height+1)+1)+19;
	   				 $("#"+beforeId).css({"height":height+"px"});
	   				 //修改页码
	   				 $("#"+beforeId).closest(".nav-wrapper").find(".bh-pager-num").html(data.otherData.firstRow+"-"+data.otherData.endRow +"  总记录数 "+data.otherData.total);
	   				 
	   				 //将数据存入，方便后边获取
	   				 var  dataPageInfo=$("#"+beforeId).data("pageInfo");	
	   				dataPageInfo.recordCount=data.otherData.total;
	   				
	   				dataPageInfo.pageCount=data.otherData.pageCount;
	   			  $("#"+beforeId).data(
	   				"pageInfo",dataPageInfo  
	   			  );
	   				
	   				 
	   				 // $("#"+id).css({"height":height+"px"});
	   				// $("#container6-physicExamination").mCustomScrollbar("update");
	   				
	   			},
	   			error:function(){
	   				mark.hideLoading();
	   			}
			});
	  });
	      
	
	       
	       
	
	
}



	

 /*给分页写入下拉展开效果*/

$(document).on("click", ".dropdownlist-state-selected", function(event){
	 var  target= $(this).closest(".pageDropDown").find(".itemPerPage");
	$(this).closest(".pageDropDown").find(".itemPerPage").slideToggle("500","swing");
	event.stopPropagation(); 
});
$(document).on("click", ".itemPerPage", function(event){ 
	
	event.stopPropagation(); 
});
$(document).on("click",function(){
	 $(".itemPerPage").slideUp();
});

$(document).on("click",".bh-pager-btn",function(){
	var  target=$(this).closest(".bh-pull-left").find(".bh-pager-input");
	var  nowPage=parseInt(target.val());
	target.data("oldData",nowPage);
	if($(this).attr("pager-flag")=="prev"){
		nowPage--;
	
		
	}else{
		nowPage++;
	}
	target.val(nowPage);
	target.trigger("blur");
});


function  getTableHtml(cols,items,maxLineLength,titleBackgroundColor){
  	maxLineLength=maxLineLength||1600;
  	titleBackgroundColor=titleBackgroundColor||"#f6f6f6";
  	  var  tableTitleArray=[];
  	  for(var i=0;i<cols.length;i++){
  		  tableTitleArray.push([cols[i].title,cols[i].width,true,cols[i]]);//cols[i]包含全部信息，主要是其它信息
  	  }
  	  var tempStr=getTableLine(tableTitleArray,true,maxLineLength,titleBackgroundColor);
  	// var tempStr=getTableLine([ ['操作',100,true],['体检日期',130,true],['体检类别',180,true],['体检编号',,true]
       
			//	,['体检科室',130,true],['体检项目',130,true],['检查时间',130,true],['检查人',130,true],['检查指标',130,true],['结果',130,true]	 ],true,1600,"#f6f6f6");
  	  for(var i=0;i<items.length;i++){
  		  //对每一个items,由cols顺序，拼接出所需html
  		  var  lineItems=[];
  		  for(var j=0;j<cols.length;j++){
  			  cols[j].renderer=cols[j].renderer ||  function(val,item,rowIndex){
  				  if(val===undefined){
		        	   return "";
		           }
		           return val;
  			  };
  			  var lineItem=[]
	    		  lineItem.push( cols[j].renderer( items[i][cols[j].name] , items[i][cols[j]],i));
	    		  lineItem.push(cols[j].width);
	    		  lineItem.push(false);//isWeight
	    		  lineItem.push(tableTitleArray[j][3]);//把标题的信息塞入
	    		  lineItems.push(lineItem);
		    	}
  	    	//tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']							  		         
 			    //,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['心率 ',130],['88 ',130]	],false,1600);
  	    	tempStr+= getTableLine(lineItems,false,maxLineLength);
        }
  	  return tempStr;
    }

//beforeId 为表格 div.pageWrap ,将于具体表格有关的数据存入表格中
function  insertTable(beforeId,cols,items,haveScroll,maxLineLength,titleBackgroundColor){
	maxLineLength=maxLineLength||1600;
	titleBackgroundColor=titleBackgroundColor||"#f6f6f6";
	  haveScroll=(typeof haveScroll=="undefined") ?  true: haveScroll;
	   var table=$("#"+beforeId).find(".table");
	   table.html(getTableHtml(cols,items,maxLineLength,titleBackgroundColor));
	   //将数据存入，方便后边获取,数据统一放在表格上
	   
		  $("#"+beforeId).data(
			"pageCols",cols  
		  );
		
		  
		//当分页页面修改时
		  
		
		  $("#"+beforeId).on("pageNumberChange",function(eventArgs){
			  var obj=$(this).data("pageInfo");	
			  var  mark=$(this).closest(".content");
			  //取得可能存在的多添加查询结果
			  var containerData=$(this).data("multipleCondition");    		  
    		  if(containerData==null  ||  typeof containerData=="undefined"){
    			  containerData={};
    		  }
    		  obj=$.extend(true,{},obj,containerData);
			  //
			  mark.showLoading();
			  $.ajax({
		   			type: "POST",
		   			url: obj.url,
		   			data: obj,
		   			dataType:'json',
		   			cache: false,
		   			success: function(data){
		   				mark.hideLoading();
		   			     var  targetTable= $("#"+beforeId).find(".table");
		   			     targetTable.html("");
		   			     //取出columns
		   			  //将数据存入，方便后边获取
		   			 var  cols= $("#"+beforeId).data(
		   				"pageCols" 
		   			  );
		   			 
		   			 
		   		
		   			    // targetTable.html(getTableHtml(cols,data));
		   			
		   			     
		   			     for(var i=0;i<data.data.length;i++){
		   			    	for (var key in data.data[i]){
		   			    		data.data[i][key] =data.data[i][key] .replace(new RegExp("&",'gm'),"&amp;")
		   			    	   .replace(new RegExp("<",'gm'),"&lt;")
		   			    	   .replace(new RegExp('>','gm'),"&gt;")
		   			    	    .replace(new RegExp('"','gm'),"&quot;")
		   			    	    .replace(new RegExp("'",'gm'),"&apos;");
		   			       }
		   			    	 
		   			     }
		   		
		   	
		   			     targetTable.html(getTableHtml(cols,data.data));
		   				  var  height=parseInt(data.data.length);		   				 
		   				  height=(33*(height+1)+1)+19;
		   				 $("#"+beforeId).css({"height":height+"px"});
		   				 // $("#"+id).css({"height":height+"px"});
		   				// $("#container6-physicExamination").mCustomScrollbar("update");
		   				 $("#"+beforeId).closest(".nav-wrapper").find(".bh-pager-num").html(data.otherData.firstRow+"-"+data.otherData.endRow +"  总记录数 "+data.otherData.total);
		   				 var  dataPageInfo=$("#"+beforeId).data("pageInfo");	
			   				dataPageInfo.recordCount=data.otherData.total;
			   				
			   				dataPageInfo.pageCount=data.otherData.pageCount;	   			
			   				if(data.otherData.pageNum){
			   					$("#"+beforeId).closest(".nav-wrapper").find(".bh-pager-input").val(data.otherData.pageNum);
			   					dataPageInfo.pageNum=data.otherData.pageNum;
			   				}
			   				   
			   			  $("#"+beforeId).data(
			   				"pageInfo",dataPageInfo  
			   			  );
		   				
		   			},
		   			error:function(){
		   			   mark.hideLoading();
		   			}
				});
			  
			  
			 
		  });
		  
		  
		  //升级2
		  //滚动条范围宽度和高度的修正
		//  $("#"+beforeId).find(".table>.line").css({"width":"1600px"});
		  $("#"+beforeId).find(".table>.line").css({"width":(maxLineLength)+"px"});
		  
		
		  var  height=parseInt(items.length);		   				 
			  height=(33*(height+1)+1)+19;
			 $("#"+beforeId).css({"height":height+"px"});
		  
		  if(haveScroll){
			  $("#"+beforeId).mCustomScrollbar({
		        	scrollButtons:{
		        		enable:true
		        	},
		        	autoHideScrollbar: false, 
		         	horizontalScroll:true
		        });
			  
		  }
    	
		  
		  
		  
		
}

//自动调整处理操作外的字段的宽度，总宽度定为930
  if (!justGridWidth){
  	var justGridWidth=function(targetGridCols,gridWidth){
  		var gridWidth=gridWidth||930;
  		var length=targetGridCols.length;
  		var sumWidth=gridWidth-targetGridCols[0].width-length-1;
  		var useWidth=0;
  		var planWidth=0;
  		for(var i=1;i<length;i++){
  			targetGridCols[i].width=targetGridCols[i].width||170;
  			planWidth+=targetGridCols[i].width;
  		}
  		
  		for(var i=1;i<length;i++){
  		
  			if(i!=(length-1)){
  				targetGridCols[i].width=parseInt(targetGridCols[i].width/planWidth*sumWidth);
  				useWidth+=targetGridCols[i].width;
  				
  			}else{//last
  				targetGridCols[i].width=sumWidth-useWidth;
  				
  			}
  			
  			
  		}
  		
  		
  	}
  }

  





