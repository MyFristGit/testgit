<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
 <script>
 if(!${Login}){
	 window.location="findex.html";
 }else{
 } 
 </script>

		
<div style="min-width:1150px;">
	<div  class="basicInformationLeft"  id="fixLeft4">
	      <!-- 
		   <div  class="profile"   >
		        <img src="./static/proscenium/images/person2.jpg"  width="80px" height="120px"/>
		        <div  class="profile-content"  id="myDiv4">
		             
		        </div>
		   </div>
		   
		   <div  class="outline-item   outline-active" id="basicNav">		       
		        	   <div  class="outline-itemIndex">1</div>
				       <div  class="outline-itemText bh-str-cut">资产信息</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		  
		  -->
		  
		  <style>
		    .bh-advancedQuery-form{
		    	display:table;box-sizing:border-box;
		    }
		    .bh-advancedQuery-form-row{
		    	display: table-row;padding: 4px 0;
		    	height: 32px;box-sizing: border-box;
		    }
		    .bh-advancedQuery-groupName{
		    	 min-width: 40px;display: table-cell;   
		    	 white-space: nowrap;    vertical-align: top;   
		    	 line-height: 28px;
		    }
		    .bh-advancedQuery-groupList{
		    	display: table-cell;min-width: 170px;    position: relative;		    	
		    }
		    
		    .bh-form-control{
		    	line-height: 18px;display: block; width: 100%;
			    height: 28px;
			    padding: 4px;
			    font-size: 12px;
			    color: #444;
			    background-color: #fff;
			    border: 1px solid #CCEAE7;
			    border-radius: 2px;
		    }
		    
		  	.bh-form-control:focus {
			    border-color: #00BCD4;
			    outline: 0;
			    box-shadow: inset 0 0 2px #00BCD4;
			}
			.bh-rules-header{
				line-height: 28px;
			}
			.bh-clearfix{
				clear: both;
			}
			.button{
				display: block;
			    margin: 0 auto;
			    margin-top: 5px;
			    width: 82px;
			    height: 20px;
			    line-height: 20px;
			    text-align: center;
			    border: 3px solid #ffc80a;
			    border-radius: 30px;
			    color: #545454;
			    cursor:pointer;
			}
			.button:hover{
			  background:#00BCD5;
			}
		  
		  </style>
		  <div  class="bh-rules-header bh-clearfix">
		  		 <h4> <i  class="fa-search fa"></i> 搜索  </h4>
		  </div>
		 
		  <div   class="bh-advancedQuery-form"  >
		   
		    <div  class="bh-advancedQuery-form-row" >
		    
		   	   <div  class="bh-advancedQuery-groupList" style="">
		   	   		<input  type="text" class="bh-form-control"  style="" placeholder="设备编码" field="code">
		   	   </div>
		    </div>
		    
		    <div  class="bh-advancedQuery-form-row" >		    
		   	   <div  class="bh-advancedQuery-groupList" style="">
		   	   		<input  type="text" class="bh-form-control"  style="" placeholder="设备名称" field="name">
		   	   </div>
		    </div>
		    
		    <div  class="bh-advancedQuery-form-row" >		   
		   	   <div  class="bh-advancedQuery-groupList" style="">
		   	   		<input  type="text" class="bh-form-control"  style="" placeholder="固定资产编号" field="number">
		   	   </div>
		    </div>
		    
		    <div  class="bh-advancedQuery-form-row" >		   
		   	   <div  class="bh-advancedQuery-groupList" style="">
		   	   		<input  type="text" class="bh-form-control"  style="" placeholder="单价" field="unit_price">
		   	   </div>
		    </div>
		    
		    <div  class="bh-advancedQuery-form-row" >		   
		   	   <div  class="bh-advancedQuery-groupList" style="">
		   	   		<input  type="text" class="bh-form-control"  style="" placeholder="入库日期" field="date_entry">
		   	   </div>
		    </div>
		    
		    <div  class="bh-advancedQuery-form-row" >		   
		   	   <div  class="bh-advancedQuery-groupList" style="">
		   	   		<input  type="text" class="bh-form-control"  style="" placeholder="型号" field="model">
		   	   </div>
		    </div>
		    
		    <a class="button  searchAssets">执行搜索</a>
		    
		    <script>
		       $(function(){
		    	   
		    	   $(".searchAssets").click(function(){
		    		   var containerData=$("#container4-device").data("multipleCondition");		    		  
		    		  if(containerData==null  ||  typeof containerData=="undefined"){
		    			  containerData={};
		    		  }
		    		  containerData={};
		    		 
		    		   $(".bh-advancedQuery-form  input").each(function(){
		    			   containerData[$(this).attr("field")]=$.trim($(this).val());
		    		   });
		    		   $("#container4-device").data("multipleCondition",containerData);
		    		   $("#container4-device").trigger("pageNumberChange");
		    		   
		    	   });
		       });
		    </script>
		  
		  </div>
		   
		   
		</div>
		
		<div  class="basicInformationRight"   id="tab4Right">
		  
		     <script>
		     
		 	//第一次不加总计时构建的series对象
		    	var  series=series|| function series(result,names){
		    			var series=[];
		    			for(var i=0;i<names.length;i++){
		    				var serie = {
		    						name: names[i],
		    						type:'bar',
		    						stack:'含量',
		    						barMinHeight: 2,
		    	                    barCategoryGap: '10%',
		    	                    barWidth: 30,
		    						label: {
		    					                normal: {
		    					                    show: true,
		    					                    position: 'top',
		    					                    textStyle:{
		    					                    	color:'#000'
		    					                    }
		    					                }
		    					            },
		    						data:result[names[i]],
		    						itemStyle: {
		    			                normal: {
		    			                    color: function(params) {
		    			                        // build a color map as your need.
		    			                        var colorList = [
		    			                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
		    			                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
		    			                           '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
		    			                        ];
		    			                        return colorList[params.dataIndex]
		    			                    }
		    			                }
		    			            }
		    					}
		    				series.push(serie);
		    			}
		    			return series;
		    		}
		 	
		 	
		     //表格数据的绘制
		     $(function(){
		    	 var guideDocter = echarts.init(document.getElementById("assetStatistics"));
		    	 guideDocter.showLoading('default', {text:'统计中，请稍候...',maskColor: '#404a59',textColor:
		    		 '#fff',});
		    	 var  result={
						    title:"资产统计图",
						    xData:[ '商标','图书', '家具','文物陈列','设备','车辆'],
						    "资产":[ 0,  0,  0,  0,  0,  0 ],					   
						    name:[ "资产" ]
						};
		    	 setTimeout(function(){
		    		 guideDocter.hideLoading();
					 var names = result.name;
					 guideDocter.setOption(option={
							   color:['#F9BE3E','#0099FF','#ddd'],
							
						         tooltip : {
							        trigger: 'axis',
							        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
							            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
							        }
							    },
							  //  legend:{
							    	 //show: false
							   // },
							    
							    legend: {  
					                 x: 'right',  
					                 data: ['当年', '总数'],  
					                 inactiveColor: '#999',  
					                 selectedMode: 'single',  
					                 selected: {  
					                    '当年': true,  
					                    '总数': false
					                }  
					             } ,
							    toolbox: {
							        show : false
							    },
							    grid: {
							    	show: false,
				                    top: 40,
				                    bottom: 22
								},
								xAxis:[
									 {	
									 	type : 'category',
									 	data : result['xData'],
									 	boundaryGap: false,
					                    nameTextStyle: {
					                        color: '#ddd'
					                    },
					                    axisLine: {
					                        show: false
					                    },
					                    axisLabel: {
					                        interval: 0
					                    },
					                    axisTick: {
					                        show: false
					                    },
					                    splitLine: {
					                        show: false
					                    }
									 }
								],
								yAxis:[
									{
										type:'value',
										show: false
									}
								],
								series: series(result,names)
							});	
		    	 },1000);
		    	
		    	
		    
	    	 
	    	 
		});
		      
		     </script>
		     <style>
		       .one-inline{
		         /*  width:100%;*/
		           width: calc( (100% - 0px) / 1);
		           width: -webkit-calc( (100% - 0px) / 1);
		        }
		     </style>
		     <div  class="staff-search-detail-chart">
		     	<div class="staff-search-detail-chart-box  one-inline">
		     		<div  class="chart-title ">
		     		    资产统计图
		     		</div>
		     		<div  class="chart-item  "  id="assetStatistics"  >
		     		</div>
		     	</div>
		     	
		     	
		     	
		     	
		     
		     
		     </div>
		     <div class="basic" > 
		     
		     		<div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>资产信息</h3>
					  		</div>
					  		   <!-- height=33*行数+1（首行的上边边框）+统一留白33 -->
					  			<div  class="pageWrap   testContainer"   id="container4-device"  style="width:930px; height:379px;overflow:auto;">
					  		      <div  class="table  "   id="container4-device-table">
					  		      
					  		       <script>
					  		           
					  		         $(function(){
					  		        	  /*
						  		    	  var tempStr=getTableLine([ ['操作',100,true],['设备编码',,true],['设备名称',,true],['固定资产编号',,true]
							  		         
			  		       					,['单价',,true],['入库日期',,true],['型号',,true]
			  		         			  ],true,1300,"#f6f6f6");
						  		    	  tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20109072'],['位移传感器'],['20109072']
							  		         
			  		       					,[''],['2010-10-13'],['']	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20109073'],['拉压力传感器'],['20109073']
						  		         
			  		       					,[''],['2010-10-13'],['']	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20109067'],['拉压力传感器'],['20109067']
						  		         
			  		       					,[''],['2010-10-13'],['']	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20109068'],['拉压力传感器'],['20109068']
						  		         
			  		       					,[''],['2010-10-13'],['']	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20109069'],['拉压力传感器'],['20109069']
						  		         
			  		       					,[''],['2010-10-13'],['']	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20109070'],['拉压力传感器'],['20109070']
						  		         
			  		       					,[''],['2010-10-13'],['']	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20109071'],['位移传感器'],['20109071']
						  		         
			  		       					,[''],['2010-10-13'],['']	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20109074'],['位移传感器'],['20109074']
						  		         
			  		       					,[''],['2010-10-13'],['']	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['85011800'],['沥清延伸仪'],['85011800']
						  		         
			  		       					,[''],['1985-04-01'],['']	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['85011900'],['沥清延伸仪'],['85011900']
						  		         
			  		       					,[''],['1985-04-01'],['']	],false,1300);
						  		    	
						  		    	
						  		    	
						  		    	  
						  		    	  $("#container4-device-table").html(tempStr);
						  		    	  
						  		    	  $("#container4-device").mCustomScrollbar({
								            	scrollButtons:{
								            		enable:true
								            	},
								            	autoHideScrollbar: false, 
								             	horizontalScroll:true
								            });
						  		    	  var  $willInsert=$(getPagination("deviceInformationPagination","1-10","10"));
						  		    	   $willInsert.insertAfter($("#container4-device-table").closest(".pageWrap"));
						  		    	   $willInsert.css({"margin-left":"7px"});
						  		    	   
						  		    	//修改滚动条
							  		    	$("#deviceInformationPagination   .itemPerPage").css({"display":"block"});
						  		         	$("#deviceInformationPagination   .itemPerPage").mCustomScrollbar({
						  		                theme: "#004e90"
						  		            });
							  		    	$("#deviceInformationPagination   .itemPerPage").css({"display":"none"});
						  		     
					  		         */
					  		         //将上边的修改为下边
					  		         	//将上边的代码改为后台获取
								  		     var cols_device = [
										        {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
										            return '<a class="viewDetail">查看</a>';
										        }},
										        { title:'设备编码',name:'code',  align:'center' },
										        { title:'设备名称',name:'name', align:'center'},
										        { title:'固定资产编号',name:'number' },
										        { title:'单价',name:'unit_price' },
										        { title:'入库日期',name:'date_entry' },
										        { title:'型号', name:'model' }
										     ];
								  		        /*
								  		     	var items_device =[
									  		        	     {
									  		        	    	code:'20109072',name:'位移传感器',
									  		        	    	number:'20109072',unit_price:'',
									  		        	    	date_entry:'2010-10-13',model:''
									  		        		 },
									  		        		 {
										  		        	    	code:'20109073',name:'拉压力传感器',
										  		        	    	number:'20109073',unit_price:'',
										  		        	    	date_entry:'2010-10-13',model:''
										  		        	 },
										  		        	 {
										  		        	    	code:'20109067',name:'拉压力传感器',
										  		        	    	number:'20109067',unit_price:'',
										  		        	    	date_entry:'2010-10-13',model:''
										  		        	 },
										  		        	 {
										  		        	    	code:'20109068',name:'拉压力传感器',
										  		        	    	number:'20109068',unit_price:'',
										  		        	    	date_entry:'2010-10-13',model:''
										  		        	 },
										  		        	 {
										  		        	    	code:'20109069',name:'拉压力传感器',
										  		        	    	number:'20109069',unit_price:'',
										  		        	    	date_entry:'2010-10-13',model:''
										  		        	 },
										  		        	 {
										  		        	    	code:'20109070',name:'拉压力传感器',
										  		        	    	number:'20109070',unit_price:'',
										  		        	    	date_entry:'2010-10-13',model:''
										  		        	 },
										  		        	 {
										  		        	    	code:'20109071',name:'位移传感器',
										  		        	    	number:'20109069',unit_price:'',
										  		        	    	date_entry:'2010-10-13',model:''
										  		        	 },
										  		        	 {
										  		        	    	code:'20109074',name:'位移传感器',
										  		        	    	number:'20109070',unit_price:'',
										  		        	    	date_entry:'2010-10-13',model:''
										  		        	 },
										  		        	 {
										  		        	    	code:'85011800',name:'沥清延伸仪',
										  		        	    	number:'85011800',unit_price:'',
										  		        	    	date_entry:'1985-04-01',model:''
										  		        	 },
										  		        	 {
										  		        	    	code:'85011900',name:'沥清延伸仪',
										  		        	    	number:'85011900',unit_price:'',
										  		        	    	date_entry:'1985-04-01',model:''
										  		        	 }
									  		        	];
								  		     	
								  		     	*/
								  		     	var items_device =[
														<c:forEach items="${deviceInformation}" var="wI"   varStatus="status">
															 {
																 code:'${wI.code }',
																 name:'${wI.name }',
																 number:'${wI.number }',
																 unit_price:'${wI.unit_price }',
																 date_entry:'${wI.date_entry }',
																 model:'${wI.model }'
														  }
														    <c:if test="${status.last eq false}">,</c:if>	  					  		       
													    </c:forEach>
								  		     	                   
								  		     	                   
								  		     	 ];
								  		     	//insertTable("container4-device",cols_device,items_device);
								  		     	//insertPagination("container4-device","personalExchangePagination",
									  		  			// 10,1,10,'personalCenter/deviceInformation.html');
								  		     	
								  		     	
								  		   <c:choose>
												<c:when test="${deviceInformation != null && fn:length(deviceInformation)>0}">
													insertTable("container4-device",cols_device,items_device);
									  		     	insertPagination("container4-device","personalExchangePagination",
									  		     			${deviceInformationTotal},1,10,'personalCenter/deviceInformation.html');
												</c:when>
												<c:otherwise>
													$("#container4-device").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
												</c:otherwise>
										   </c:choose>
								  		   
					  		       });
					  		         
					  		   
					  		         
					  		      </script>	
					  		        
					  		     </div>
				  		    </div>		
				     	</div>
				     </div>
				     
				     
				    
				  	 
		     </div>
		</div>
</div>
<!-- 
<div  id="informationChange"  style="position:fixed;top:350px;right:10px;" >
	<a  href="javascript:void(0);"  >
	   <img src="./static/proscenium/images/informationChange.png"     class="anim_image"
	      style="width: 35px;height: 35px;" />
	   <div  style="text-align: center; margin-top: 10px;">
		   信息变更
		</div>
	</a>
</div>
 -->	

<script>
$(function(){
	  //为了复制时修改方便
	  var  leftId="fixLeft4";
	  var  rightId="tab4Right";
	  var  contentIdPrev="content4";
	  //按照顺序给本tab中右边加入id
	  var content=$("#"+rightId+"  .content");
	  content.each(function(i,d){
		  var index=content.index(this);
		  $(this).attr("id",contentIdPrev+index);
	  });
	  
	  //记录本tab content的位置，
	  var record3=[];
	  var  $outline3;
	 var length=$("#"+leftId+"  .outline-item").length;
	 function  updateRecord3(){
		 record3=[];
		 $outline3=$("#"+leftId+"  .outline-item");
		 $outline3.each(function(i,d){
			  record3.push($('#'+contentIdPrev+i).offset().top);
		  });
		 $(document).trigger("scroll");
	 }
	 
	 
	 
	 //高亮左边
		function  activeLeft3(i){
			  if(i>=0  && i<record3.length){
					$outline3.removeClass("outline-active");
					$outline3.eq(i).addClass("outline-active");
			  }
		}
	 
	  $outline3=$("#"+leftId+" .outline-item");
	  $("#"+leftId+"   .outline-item").click(function(){
		  var  index=$outline3.index(this);
		  
		  var from=$(document).scrollTop();
		  var to=$('#'+contentIdPrev+index).offset().top;
		  var  maxHeight=Math.max($(window).height(),$(document).height());
		  var  maxScrollTop=maxHeight-getWindowSize().height;
		  var  distance=0;
		  if(to>from){//窗口往上滚动，滚动条刻度变大，滚动条往下移动
			  if(to>maxScrollTop){//往上,不能超过最大限度
				        distance=maxScrollTop-from;									  
			  }	else{
				  distance=to-from;								  
			  }
		  }else{
			  distance=from-to;
		  }
		  var  timeSpan=0;
		  if(distance!=0){
			  timeSpan=Math.floor(Math.abs(distance*0.5));
		  }
		  $('html,body').animate({scrollTop:$('#'+contentIdPrev+index).offset().top},timeSpan);	
		  setTimeout(function(){activeLeft3(index);},timeSpan+17);
		  
		  
		 // $('html,body').animate({scrollTop:$('#'+contentIdPrev+index).offset().top},800);	
		  //setTimeout(function(){activeLeft3(index);},850);
	  });
	  
	  
	  var h3= $("#"+rightId+"  .nav-wrapper  .nav  h3");	  
	  $("#"+rightId+" .nav-wrapper  .nav  h3").click(function(){	
		  var index=h3.index(this);
			$(this).closest(".nav-wrapper").find(".pageWrap").slideToggle("500","swing");
			$(this).closest(".nav-wrapper").find(".pagerContainer").slideToggle("200","swing");
			setTimeout(function(){updateRecord3();},550);
			setTimeout(function(){activeLeft3(index);},600);
	  });
	  updateRecord3();
	  var dv=$("#"+leftId);
	  var originTop=dv.offset().top;
		$(window).scroll(function(){
			 var scrollY = $(document).scrollTop();// 
			for(var i=0;i<record3.length;i++){
				if(record3[i]<=scrollY &&  ( (i==(record3.length-1)) ||  (record3[i+1]>scrollY)  )  ){
				    activeLeft3(i);
				}
			}
			
			 
			//固定左边
			 if(scrollY>originTop){							 
				 dv.css({position: "absolute"});
				 dv.css({
					 'top': ( scrollY - $($("#"+rightId+"")[0]).offset().top +"px") ,
					 'margin-top':"0px" 
					 });
			 }else{
				 dv.css({'position': "static", 'margin-top':"20px"});
			 }
			 
			
		});
		$("#myDiv4").html($("#myDiv").html());
		
	  
	
	
});

</script>

