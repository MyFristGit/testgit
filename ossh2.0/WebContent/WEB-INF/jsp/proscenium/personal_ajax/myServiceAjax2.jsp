<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@taglib uri="http://bangxue.com/grid" prefix="mmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		
<div style="min-width:1150px;">
	<div  class="basicInformationLeft"  id="fixLeft3">
		   <div  class="profile"   >
		        <%@ include file="../taskCenter_personalCenter_profile.jsp"%>
		   </div>
		   
		   <div  class="outline-item   outline-active" id="basicNav">		       
		        	   <div  class="outline-itemIndex">1</div>
				       <div  class="outline-itemText bh-str-cut">教学工作量信息</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">2</div>
		       <div  class="outline-itemText bh-str-cut">授课安排信息</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">3</div>
		       <div  class="outline-itemText bh-str-cut">指导学生情况</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   
		 
		   
		   
		</div>
		
		<div  class="basicInformationRight"   id="tab3Right">
		  
		     <script>
		     /*
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
		    	 
		    
		    	 
		    	 
		    	 var guideDocter = echarts.init(document.getElementById("guideDocter"));
		    	 guideDocter.showLoading('default', {text:'统计中，请稍候...',maskColor: '#404a59',textColor:
		    		 '#fff',});
		    	 var  result={
						    title:"指导博士生",
						    month:[
						        '其中在校',
						        '毕业'
						    ],
						    "当年":[
						        0,
						        0
						    ],
						    "总数":[
							        0,
							        0
							],						   
						    name:[
						        "当年",
						        "总数"
						    ]
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
				                    bottom: 22,
				                    left:'30%',
				                    right:'30%'
								},
								xAxis:[
									 {	
									 	type : 'category',
									 	data : result['month'],
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
		    	
		    	
		    
		    	//指导研究生
		   	 var guideMaster = echarts.init(document.getElementById("guideMaster"));
		   	guideMaster.showLoading('default', {text:'统计中，请稍候...',maskColor: '#404a59',textColor:
	    		 '#fff',});
	    	 var  result2={
					    title:"指导博士生",
					    month:[
					        '其中在校',
					        '毕业'
					    ],
					    "当年":[
					        0,
					        0
					    ],
					    "总数":[
						        0,
						        0
						],						   
					    name:[
					        "当年",
					        "总数"
					    ]
					};
	    	 setTimeout(function(){
	    		 guideMaster.hideLoading();
				 var names2 = result2.name;
				 guideMaster.setOption(option={
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
			                    bottom: 22,
			                    left:'30%',
			                    right:'30%'
							},
							xAxis:[
								 {	
								 	type : 'category',
								 	data : result2['month'], 
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
							series: series(result2,names2)
						});	
	    	 },1000);
	    	 
	    	 //教学工作量
	    	 
	    	  	 var facultyLoad = echarts.init(document.getElementById("facultyLoad"));
	    	  	facultyLoad.showLoading('default', {text:'统计中，请稍候...',maskColor: '#404a59',textColor:
	    		 '#fff',});
	    	 var  result3={
					    title:"指导博士生",
					    month:[
					        '总数',
					        '当年'
					    ],
					    "学时":[
					        1502,
					        324
					    ],
					    						   
					    name:[
					        "学时"
					    ]
					};
	    	 setTimeout(function(){
	    		 facultyLoad.hideLoading();
				 var names3 = result3.name;
				 facultyLoad.setOption(option={
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
						    	 show:false,
				                 x: 'right',  
				                 data: ['学时'],  
				                 inactiveColor: '#999',  
				                 selectedMode: 'single',  
				                 selected: {  
				                    '学时': true,  
				                   
				                }  
				             } ,
						    toolbox: {
						        show : false
						    },
						    grid: {
						    	show: false,
			                    top: 40,
			                    bottom: 22,
			                    left:'30%',
			                    right:'30%'
							},
							xAxis:[
								 {	
								 	type : 'category',
								 	data : result3['month'], 
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
							series: series(result3,names3)
						});	
	    	 },1000);
	    	 
	    	 
		});
		     */ 
		     </script>
		     <!-- 
		     <div  class="staff-search-detail-chart">
		     	<div class="staff-search-detail-chart-box">
		     		<div  class="chart-title">
		     		     指导博士生（人）
		     		</div>
		     		<div  class="chart-item "  id="guideDocter">
		     		</div>
		     	</div>
		     	
		     	<div class="staff-search-detail-chart-box">
		     		<div  class="chart-title">
		     		      指导硕士生（人）
		     		</div>
		     		<div  class="chart-item "  id="guideMaster" >
		     		</div>
		     	</div>
		     	
		     	<div class="staff-search-detail-chart-box"   style="margin-right:0px;">
		     		<div  class="chart-title">
		     		      教学工作量（学时）
		     		</div>
		     		<div  class="chart-item "  id="facultyLoad" >
		     		</div>
		     	</div>
		     	
		     	
		     
		     
		     </div>
		     -->
		     
		     <div class="basic" > 
		     
		     		<div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>教学工作量信息</h3>
					  		</div>
					  		<div  class="pageWrap"      style="width:930px;height:100%;overflow:hidden;"  id="jxgzlID">
					  		     <div  class="table  "   >
					  		     </div>
				  		    </div>	
				  		
					  		    
				  		    <script>
						    
				  		    
					  		       $(function(){
						  		    	//修改
						  		      var jxgzl_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'年份',name:'NF', width: 130, align:'center' },
								        { title:'指导青年教师',name:'ZQ', width: 130, align:'center' },
								        { title:'研究生教学',name:'YJSJX', width: 130, align:'center' },
								        { title:'理论',name:'LL', width: 130, align:'center' },
								        { title:'课内实践',name:'KNSJ', width: 130, align:'center' },
								        { title:'集中实践',name:'JZSL', width: 130, align:'center' },
								        { title:'实践汇总',name:'SJHZ', width: 130, align:'center' },
								        { title:'教学课时汇总',name:'JXKS', width: 130, align:'center' }
								        
								     ];
						  		        
						  		     	var jxgzl_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${jxgzlInformation}" var="wI"   varStatus="status">
											       	 {
											       		NF:'<c:out value="${wI.NF}" />',
											       		ZQ:'${wI.ZQ }',
											       		YJSJX:'${wI.YJSJX }',
											       		LL:'<c:out value="${wI.LL}" escapeXml="true"/>',
											       		KNSJ:'<c:out value="${wI.KNSJ}" escapeXml="true"/>',
											       		JZSL:'<c:out value="${wI.JZSL}" escapeXml="true"/>',
											       		SJHZ:'<c:out value="${wI.SJHZ}" escapeXml="true"/>',
											       		JXKS:'<c:out value="${wI.JXKS}" escapeXml="true"/>'
											       		
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${jxgzlInformation != null && fn:length(jxgzlInformation)>0}">
												insertTable("jxgzlID",jxgzl_cols,jxgzl_data,true,1200);//1600);
												insertPagination("jxgzlID","jxgzlPagination",
									  		  			 ${jxgzlInformationTotal},1,10,'personalCenter/getJxgzlInformation.html');
											</c:when>
											<c:otherwise>
												$("#jxgzlID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
												//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
											</c:otherwise>
										 </c:choose> 
										 
										 
										 
										 
									
													  		     		
					  		       });
						     </script>	
				     	</div>
				     </div>
				     
				     
				     <div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>授课安排信息</h3>
					  		</div>
					  		<div  class="pageWrap"     style="width:930px;overflow:hidden;"  >
					  		     <div  class="table  "   id="teachingArrange">
					  		     
					  		     &nbsp;&nbsp; &nbsp;&nbsp;暂无数据
					  		     </div>
					  		 <script>
					  		
					  		var datelocalweek=new Array("星期日", "星期一", "星期二","星期三","星期四", "星期五","星期六"); 
					  		//以服务器日期为准。修改这儿。
					  		//var datelocalnow=new Date();    
					  		//var datelocalyear=datelocalnow.getFullYear();   
					  		//var datelocalmonth=(datelocalmonth="0"+(datelocalnow.getMonth()+1)).substr(datelocalmonth.length-2,2);  
					  		//var datelocalday=(datelocalday="0"+datelocalnow.getDate()).substr(datelocalday.length-2,2);  
					  		
					  		var datelocalyear=${year};  
					  		var datelocalmonth=${month};
					  		var datelocalday=${day};
					  		
					  		//var datelocalweekday=datelocalweek[datelocalnow.getDay()]; 
					  		//datelocalnow.getHours()  
					  		//datelocalnow.getMinutes() 
					  		//datelocalnow.getSeconds() 
					  		var  willShowDays=[];
					  		for(var i=0;i<5;i++){
					  			willShowDays.push([]);
					  		}
					  		
					  	//	var begin=datelocalnow.getDay();
					  	    var begin=${weekday};
					  		if(begin>0  &&   begin<6){//1-5
					  			var span=0;
					  			for(var i=begin;i<6;i++){
					  				willShowDays[i-1]=dateAdd(datelocalyear+"-"+datelocalmonth+"-"+
						  					datelocalday,span);
					  				span++;
					  			}
					  			span=0;
					  			
					  			for(var i=begin;i>0;i--){
					  				willShowDays[i-1]=dateAdd(datelocalyear+"-"+datelocalmonth+"-"+
						  					datelocalday,-span);
					  				span++;
					  			}
					  			var  beginShowDay=willShowDays[0];
					  			
					  		}else{
					  			var span=1;//星期日
					  		
					  			if(begin==6){
					  				span=2;				  				
					  			}	
					  			//这儿因为要显示将来的周，周号要加1，如果在学期的边界，会引起，学期或年份的变更。
					  			var  beginShowDay=dateAdd(datelocalyear+"-"+datelocalmonth+"-"+
					  					datelocalday,span);
					  			for(var i=1;i<6;i++){
					  				willShowDays[i-1]=dateAdd(datelocalyear+"-"+datelocalmonth+"-"+
						  					datelocalday,span);
					  				
					  				span++;
					  			}
					  			
					  		}
					  		//实际显示的开始日期
					  	
					  		//当前日期想象为beginShowDay
					  		 datelocalyear=beginShowDay.split("-")[0];
					  		 datelocalmonth=beginShowDay.split("-")[1];
					  		 datelocalday=beginShowDay.split("-")[2];
					  		
					  		
					  		  
					  		 
					  		    
					  		   //  var   firstTermWeek=[{name:"2014",value:28},{name:"2015",value:26},{name:"2016",value:26},
					  		    //                     {name:"2017",value:27}];
					  		     var  firstTermWeek=[
												<c:forEach items="${listFirstWerks}" var="wI"   varStatus="status">
													 {
														 name:'${wI.name }',
														 value:'${wI.value }'
												}
												  <c:if test="${status.last eq false}">,</c:if>
												
												</c:forEach>
					  		                
					  		                ];
					  		     //判断是第一还是第二学期
					  		     //服务器提取可能的全部数据，客户端根据条件筛选。2016-2017,2017-2018（当前2017）
					  		    /*
					  		     var  data=[
					  		                {sksj:"周一第1,2节{第1-17周};周三第1,2节{第2-16周|双周};周五第1,2节{第2-16周|单周}",bjmc:"数学与应用数学1601",SKDD:"2-2-106;2-15-508;网络中心",xq:1,xn:"2017-2018"},
					  		                {sksj:"周四第5,6节{第1-17周}",bjmc:"测绘工程1601",SKDD:"2-3-411",xq:1,xn:"2017-2018"},
					  		                {sksj:"周四第5,6节{第1-17周}",bjmc:"测绘工程1601",SKDD:"2-3-411",xq:1,xn:"2017-2018"},
					  		                {sksj:"周四第5,6节{第1-17周}",bjmc:"测绘工程1601",SKDD:"2-3-411",xq:1,xn:"2017-2018"},
					  		                {sksj:"周四第5,6节{第1-17周}",bjmc:"测绘工程1601",SKDD:"2-3-411",xq:1,xn:"2017-2018"},
					  		              	{sksj:"周三第3,4节{第1-17周}",bjmc:"测绘工程1601",SKDD:"2-2-205",xq:1,xn:"2017-2018"},
					  		            	{sksj:"周三第3,4节{第1-17周}",bjmc:"测绘工程1601",SKDD:"2-2-205",xq:1,xn:"2017-2018"},
					  		            	{sksj:"周五第3,4节{第1-17周|单周}",bjmc:"测绘工程1601",SKDD:"2-2-205",xq:1,xn:"2017-2018"},
					  		            	{sksj:"周一第3,4节{第1-26周}",bjmc:"测绘工程1601",SKDD:"2-2-205",xq:2,xn:"2016-2017"},
					  		            	{sksj:"周二第3,4节{第1-26周}",bjmc:"测绘工程1601",SKDD:"2-2-205",xq:1,xn:"2016-2017"},
					  		                ];*/
					  		     // 
					  		      var  data=[
					  		     				<c:forEach items="${schedules}" var="wI"   varStatus="status">
													 {
														 sksj:'${wI.SKSJ }',
														 bjmc:'${wI.BJMC }',
														 SKDD:'${wI.SKDD }',
														 xq:'${wI.XQ }',
														 xn:'${wI.XN }',
														 kcmc:'${wI.KCMC }'
													}
												  <c:if test="${status.last eq false}">,</c:if>
												
												</c:forEach>
											];
					  		                
					  		      //取得当年9月1号的第一周的第一天
					  		    	 var  weeksNumber=0;
					  		    	   var september=getWeekByDayNumber(datelocalyear+"-"+9+"-"+
									  					1);
								  		         september=september==0? 7:september;
								  		    
								  		      
								  		     var   beginDay= dateAdd(datelocalyear+"-"+9+"-"+
									  					1,-(september-1));
								  		  // var nowDayStr=datelocalyear+"-"+datelocalmonth+"-"+
						  					//datelocalday; 
								  	var nowDayStr=beginShowDay;//为了避免计算周的跨区间问题，把当前日期想象成beginShowDay
								  	var  actualTerm="1";
								  	var  yearSpan=parseInt(beginShowDay.split("-")[0])+"-"+(parseInt(beginShowDay.split("-")[0])+1);
					  		        if(DateDiffActual(nowDayStr, beginDay )>=0){//今年第一学期
								  		     var diff= DateDiff(nowDayStr,  beginDay)  ;  
								  		   weeksNumber=(Math.ceil((diff+1)/7));
								  		  	var  weeks="<br>第"+(Math.ceil((diff+1)/7))+"周";
					  		        	
					  		        }else{
					  		        	  yearSpan=(parseInt(beginShowDay.split("-")[0])-1)+"-"+parseInt(beginShowDay.split("-")[0]);
					  		        
					  		        		var september=getWeekByDayNumber((datelocalyear-1)+"-"+9+"-"+
								  					1);
							  		         september=september==0? 7:september;
								  		     var   beginDay= dateAdd((datelocalyear-1)+"-"+9+"-"+
									  					1,-(september-1));
								  		     //取得当年在日期小于  9.1第一天的情况下上一年的第二学期开始日期
								  		       var   firstTermWeek=[{name:"2014",value:28},{name:"2015",value:26},{name:"2016",value:26},
					  		                         {name:"2017",value:27}];
								  		     var  found=null;
								  		     for(var i=0;i<firstTermWeek.length;i++){
								  		    	 if(firstTermWeek[i].name==(datelocalyear-1)){
								  		    		 found=firstTermWeek[i].value;
								  		    	 }
								  		     }
								  		    var secondBegin= dateAdd(beginDay,7*found);
								  		 
								  		    
								  		     //
								  		  var  lastYear=(datelocalyear-1)+"-"+12+"-"+31;
							  		      var lastYearDiff= DateDiff(beginDay,  lastYear);
							  		       
							  		      var  thisYearDiff=DateDiff(datelocalyear+"-"+1+"-"+
								  					1,  datelocalyear+"-"+datelocalmonth+"-"+
								  					datelocalday)+1;
							  		      var totaolDiff=lastYearDiff+thisYearDiff;
									  		  var  showWeek=(Math.ceil((totaolDiff+1)/7));								  		
									  	  var  find=null;
									  	  for(var i=0;i<firstTermWeek.length;i++){
									  			if(firstTermWeek[i].name==(datelocalyear-1)){
									  				find=firstTermWeek[i].value;
									  			}
									  	  } 
									  		
								  		      
							  		        if(DateDiffActual(nowDayStr, secondBegin )>=0){//去年年第二学期
							  		        	actualTerm="2";
							  		        	if( find!=null){
										  		    		showWeek=showWeek-find;
										  		    		
										  		}else{//没办法确定第二学期的开始周。
										  		    		
								  				}
							  		        }else{//去年第一学期
							  		        	
							  		        }
								  		     //
								  		   	
										  	
										  	  	weeksNumber=showWeek;
								  			  var  weeks="<br>第"+showWeek+"周";
					  		        }
					  		    
					  		
					  		     
					  		     
					  		     
					  		       
					  		     function dealString(time,position,course,kcmc){
					  		    	 
					  		       
					  		    	 var   temp=time.substr(0,2);
					  		    	 if(temp.length<2)
					  		    		 return ;
					  		    	 var  resultTemplate=[["周一",1],["周二",2],["周三",3],["周四",4],
					  		    	                      ["周五",5],["周六",6],["周日",7]
					  		    	 					];
					  		    	 var col=-1;
					  		    	 for(var i=0;i<resultTemplate.length;i++){
					  		    		 if(temp==resultTemplate[i][0]){
					  		    			col= resultTemplate[i][1];
					  		    		 }
					  		    	 }
					  		    	var   section=time.substr(2);
					  		   
					  		    	if(section.length<1)
					  		    		return;
					  		    	var   sections=section.split("节{第")[0].split(",");
					  		    	sections[0]=sections[0].substr(1,1);
					  		    	var   week=section.split("节{第")[1].split("周}")[0];
					  		   
					  		    	for(var  i=0;i<sections.length;i++){
					  		    	    var row=parseInt(sections[i]); if(row<1 ||  row>8) return;
					  		    	    var col=parseInt(col);if(col<1 ||  col>5) return;
					  		    	   //公共课，可能同时上多个班级的课。
					  		    	  	var target=showSeeOriginal[row-1][col][0];
					  		    	  	//if(target==""){
					  		    	  		if(showSeeOriginal[row-1][col][0].indexOf(course+"<br>"+position+"<br>"+week)==-1){
					  		    	  			//处理不可重复外，判断当前的周是否满足要求。
					  		    	  			
					  		    	  			
					  		    	  			var weekInformation=week.split("周|");
						  		    	  		var weekSpan=weekInformation[0].split("-");
						  		    	  	
						  		    	  		if(weeksNumber<parseInt(weekSpan[0]) || weeksNumber>parseInt(weekSpan[1])){
						  		    	  			continue;
						  		    	  		}
						  		    	  	
					  		    	  			if(weekInformation[1]){//单双是否满足
					  		    	  				
					  		    	  				if (weekInformation[1]=="单"){
					  		    	  					
					  		    	  				
					  		    	  					if (weeksNumber%2==0) continue;  	  					
					  		    	  				}else{//其它都认为是双
					  		    	  				    if (weeksNumber%2==1) continue;  
					  		    	  				}
					  		    	  			}
					  		    	  			
					  		    	  		    
					  		    	  		 	showSeeOriginal[row-1][col][0]+=(course+"<br>"+position+"<br>"+week+"<br>");
					  		    	  			showSeeOriginal[row-1][col][3]={tip:(showSeeOriginal[row-1][col][0]+"<br>"+kcmc),tipClass:"customRight"};
					  		    	  		
					  		    	  			
					  		    	  		}
					  		    	  		  
					  		    	  	//}
					  		    	}
					  		    	 
					  		     }
					  		     
					  		     
					  		     var  showSeeOriginal=[
					  		                           [['第1节<br>8:10-9:00',80,true],['',150,true],['',150,true],['',150,true],['',150,true],['',150,true]],
					  		                           [['第2节<br>9:05-9:55',80,true],['',150,true],['',150,true],['',150,true],['',150,true],['',150,true]],
					  		                           [['第3节<br>10:10-11:00',80,true],['',150,true],['',150,true],['',150,true],['',150,true],['',150,true]],
					  		                           [['第4节<br>11:05-11:55',80,true],['',150,true],['',150,true],['',150,true],['',150,true],['',150,true]],
					  		                           [['第5节<br>14:10-15:00',80,true],['',150,true],['',150,true],['',150,true],['',150,true],['',150,true]],
					  		                           [['第6节<br>15:05-15:55',80,true],['',150,true],['',150,true],['',150,true],['',150,true],['',150,true]],
					  		                           [['第7节<br>16:05-16:55',80,true],['',150,true],['',150,true],['',150,true],['',150,true],['',150,true]],
					  		                           [['第8节<br>17:00-17:50',80,true],['',150,true],['',150,true],['',150,true],['',150,true],['',150,true]]
					  		     ];
					  		     for(var i=0;i<data.length;i++){
					  		    	 var  analysis=data[i];
					  		    	 var  curriculum=data[i].sksj.split(";");
					  		    	 var  position=data[i].SKDD.split(";");					  		    	
					  		    	 for(var j=0;j<curriculum.length;j++){
					  		    		 
					  		    		 
					  		    	    if(data[i].xq==actualTerm && data[i].xn==yearSpan){//判断学年和学期满足条件后调用插入操作
					  		    	    	dealString(curriculum[j],position[j],data[i].bjmc,data[i].kcmc);
					  		    	    
					  		    	    }else{
					  		    	    
					  		    	    }
					  		    		 
					  		    	 }
					  		    	 
					  		     }
					  		     
					  		     $(function(){
					  		    	 
					  		     
					  		    	 //取得当年9月1号的第一周的第一天
					  		    	 /*
					  		    	   var september=getWeekByDayNumber(datelocalyear+"-"+9+"-"+
									  					1);
								  		         september=september==0? 7:september;
								  		    
								  		      
								  		     var   beginDay= dateAdd(datelocalyear+"-"+9+"-"+
									  					1,-(september-1));
								  		   var nowDayStr=datelocalyear+"-"+datelocalmonth+"-"+
						  					datelocalday; 
					  		        if(DateDiffActual(nowDayStr, beginDay )>=0){
								  		     var diff= DateDiff(nowDayStr,  beginDay)  ;  
								  		  	var  weeks="<br>第"+(Math.ceil((diff+1)/7))+"周";
					  		        	
					  		        }else{
					  		        
					  		        		var september=getWeekByDayNumber((datelocalyear-1)+"-"+9+"-"+
								  					1);
							  		         september=september==0? 7:september;
								  		     var   beginDay= dateAdd((datelocalyear-1)+"-"+9+"-"+
									  					1,-(september-1));
								  		     var  lastYear=(datelocalyear-1)+"-"+12+"-"+31;
								  		      var lastYearDiff= DateDiff(beginDay,  lastYear);
								  		       
								  		      var  thisYearDiff=DateDiff(datelocalyear+"-"+1+"-"+
									  					1,  datelocalyear+"-"+datelocalmonth+"-"+
									  					datelocalday)+1;
								  		      var totaolDiff=lastYearDiff+thisYearDiff;
								  		  var  showWeek=(Math.ceil((totaolDiff+1)/7));								  		
								  		var  find=null;
								  		for(var i=0;i<firstTermWeek.length;i++){
								  			if(firstTermWeek[i].name==(datelocalyear-1)){
								  				find=firstTermWeek[i].value;
								  			}
								  		} 	if( find!=null){
								  		    		showWeek=showWeek-find;
								  		    		
								  		    	}else{//没办法确定第二学期的开始周。
								  		    		
								  		    	}
								  			  var  weeks="<br>第"+showWeek+"周";
					  		        }
					  		        */
					  		    
					  		    	var willchange=[ ['时间',80,true],['星期一',150,true],['星期二',150,true]
					  		    	,['星期三',150,true],['星期四',150,true],['星期五',150,true]
			  		         		];
					  		   
					  		     	willchange[0][0]+=weeks;
					  		    	for(var i=1;i<6;i++){
					  		    		willchange[i][0]+=("<br>"+willShowDays[i-1]);
					  		    		
					  		    	}
					  		    	
					  		       
					  		    	 var  html=getTableLine(willchange,true,910,"#f6f6f6",{height:60});
					  		    	//html+=getTableLine([ ['第1节',70,true],['',70,true],['数学',70,true]
						  		    //	,['',70,true],['',70,true],['',70,true],['',70,true],['',70,true]
				  		         		//]);
					  		    	for(var i=0;i<showSeeOriginal.length;i++){
					  		    		html+=getTableLine( showSeeOriginal[i],false,910,"white",{height:80});
					  		    	}
					  		    	/*
					  		    	html+=getTableLine(showSee[0]);
					  		    	html+=getTableLine([ ['第2节',70,true],['',70,true],['数学',70,true]
					  		    	,['',70,true],['',70,true],['',70,true],['',70,true],['',70,true]
			  		         		]);
					  		    	html+=getTableLine([ ['第3节',70,true],['',70,true],['数学',70,true]
					  		    	,['',70,true],['',70,true],['',70,true],['',70,true],['',70,true]
			  		         		]);
					  		    	html+=getTableLine([ ['第4节',70,true],['',70,true],['数学',70,true]
					  		    	,['',70,true],['',70,true],['',70,true],['',70,true],['',70,true]
			  		         		]);
					  		    	html+=getTableLine([ ['第5节',70,true],['',70,true],['数学',70,true]
					  		    	,['',70,true],['',70,true],['',70,true],['',70,true],['',70,true]
			  		         		]);
					  		    	html+=getTableLine([ ['第6节',70,true],['',70,true],['数学',70,true]
					  		    	,['',70,true],['',70,true],['',70,true],['',70,true],['',70,true]
			  		         		]);
					  		    	html+=getTableLine([ ['第7节',70,true],['',70,true],['数学',70,true]
					  		    	,['',70,true],['',70,true],['',70,true],['',70,true],['',70,true]
			  		         		]);
					  		    	html+=getTableLine([ ['第8节',70,true],['',70,true],['数学',70,true]
					  		    	,['',70,true],['',70,true],['',70,true],['',70,true],['',70,true]
			  		         		]);
					  		    	*/
					  		    	 $("#teachingArrange").html(html);
					  		    	
					  		    	 setTimeout(function(){
											$(".line .lineUnit  .label").tipsStaticTwo();
									 },0);
					  		     });
					  		        
					  		      	     
					  		     	
					  		     	</script>
				  		    </div>
				     	</div>
				     </div>
				     
				     
				     
				    <div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>指导学生情况</h3>
					  		</div>
					  		<div  class="pageWrap"     style="overflow:hidden;"  id="zdxsqkID">
					  		     <div  class="table  "   >
					  		     </div>
				  		    </div>	
				  		    <%  
					  		    	    try {  
					  		    	  		ArrayList  al=new  ArrayList<HashMap>();
							  		  		HashMap    hm=null;
							  		  		for(int  i=0;i<1;i++){
							  		  			hm=new  HashMap();
							  		  			hm.put("XSLB", "本科生");
							  		  			hm.put("ND", "2017");
							  		  			hm.put("XQ", "1");
					  		  					hm.put("ZDLX", "test");
							  					hm.put("ZS", "164");
							  		  			//al.add(hm);
								  		  		hm=new  HashMap();
							  		  			hm.put("XSLB", "研究生");
							  		  			hm.put("ND", "2017");
							  		  			hm.put("XQ", "1");
					  		  					hm.put("ZDLX", "test");
							  					hm.put("ZS", "164");
							  		  			//al.add(hm);
							  		  		} 
					  		    	        request.setAttribute("zdxsqkInformation", al);  
					  		    	    } catch (Exception e) {  
					  		    	        request.setAttribute("result", "很抱歉，页面产生错误！");  
					  		    	    }  
					  		    	%> 
					  		    
				  		    <script>
						    
				  		    
					  		       $(function(){
						  		    	//修改
						  		      var zdxsqk_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'学生类别',name:'XSLB', width: 130, align:'center' },
								        { title:'年度',name:'ND', width: 130, align:'center' },
								        { title:'学期',name:'XQ', width: 130, align:'center' },
								        { title:'指导类型',name:'ZDLX', width: 130, align:'center' },
								        { title:'总数',name:'ZS',width: 130, align:'center'}
								        
								     ];
						  		        
						  		     	var zdxsqk_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${zdxsqkInformation}" var="wI"   varStatus="status">
											       	 {
											       		XSLB:'${wI.XSLB }',
											       		ND:'${wI.ND }',
											       		XQ:'${wI.XQ }',
											       		ZDLX:'${wI.ZDLX }',
											       		ZS:'${wI.ZS }'
											       		
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${zdxsqkInformation != null && fn:length(zdxsqkInformation)>0}">
												insertTable("zdxsqkID",zdxsqk_cols,zdxsqk_data,false);
											</c:when>
											<c:otherwise>
												$("#zdxsqkID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
												//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
											</c:otherwise>
										 </c:choose>  		    
													  		     		
					  		       });
						     </script>	
				     	</div>
				     </div>
				     
				  	 
		     </div>
		</div>
</div>	
<!-- 
<div  id="informationChange"  style="position:fixed;top:350px;right:10px;" >
	<a  href="javascript:void(0);"  target="_blank"  >
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
	  //按照顺序给本tab中右边加入id
	  var content=$("#tab3Right  .content");
	  content.each(function(i,d){
		  var index=content.index(this);
		  $(this).attr("id","content3"+index);
	  });
	  
	  //记录本tab content的位置，
	  var record3=[];
	  var  $outline3;
	 var length=$("#fixLeft3  .outline-item").length;
	 function  updateRecord3(){
		 record3=[];
		 $outline3=$("#fixLeft3  .outline-item");;
		 $outline3.each(function(i,d){
			  record3.push($('#content3'+i).offset().top);
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
	 
	  $outline3=$("#fixLeft3 .outline-item");
	  $("#fixLeft3   .outline-item").click(function(){
		  var  index=$outline3.index(this);
		  
		  var from=$(document).scrollTop();
		  var to=$('#content3'+index).offset().top;
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
		  $('html,body').animate({scrollTop:$('#content3'+index).offset().top},timeSpan);	
		  setTimeout(function(){activeLeft3(index);},timeSpan+17);
		  
		  
		//  $('html,body').animate({scrollTop:$('#content3'+index).offset().top},800);	
		//  setTimeout(function(){activeLeft3(index);},850);
	  });
	  
	  
	  var h3= $("#tab3Right  .nav-wrapper  .nav  h3");	  
	  $("#tab3Right .nav-wrapper  .nav  h3").click(function(){	
		  var index=h3.index(this);
			$(this).closest(".nav-wrapper").find(".pageWrap").slideToggle("500","swing");
			$(this).closest(".nav-wrapper").find(".pagerContainer").slideToggle("200","swing");
			setTimeout(function(){updateRecord3();},550);
			setTimeout(function(){activeLeft3(index);},600);
	  });
	  updateRecord3();
	  var dv=$("#fixLeft3");
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
					 'top': ( scrollY - $($("#tab3Right")[0]).offset().top +"px") ,
					 'margin-top':"0px" 
					 });
			 }else{
				 dv.css({'position': "static", 'margin-top':"20px"});
			 }
			 
			
		});
		$("#myDiv3").html($("#myDiv").html());
		
	  
	
	
});

</script>

