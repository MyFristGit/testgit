<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
 <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
 <script>
 if(!${Login}){
	 window.location="findex.html";
 }else{
 } 
 </script>
<style>

.myData {
    padding:  0;
    margin-bottom: 20px;
}
.content {
    width: 950px;
    margin: 0 auto;
    overflow-x:hidden;
   
}

.content.last{
   margin-bottom:10px;
}

.basicData{
 float:left;
}
.basicDataCon1 {
    height: 86px;
    padding: 20px 30px 0 20px;
}
.basName {
    display: block;
    float: left;
    font-size: 24px;
    color: #151515;
    margin-right: 34px;
}

.basicDataCon1 span {
    display: block;
    float: left;
    font-size: 16px;
    color: #555;
    margin: 8px 22px 0 0;
    font-family: "微软雅黑";
}

.amendBtn {
    display: block;
    float: right;
    width: 22px;
    height: 21px;
    background: url(./static/proscenium/images/amendBtn.jpg) no-repeat;
    margin-top: 8px;
}
.basicDataCon2 {
    height: 158px;
    padding-left: 20px;
}
.basicDataCon2 p {
    height: 46px;
    font-size: 16px;
    color: #333;
}


.nav h3 {
    height: 28px;
    font-size: 24px;
    color: #333;
    font-weight: normal;
    padding-left: 14px;
    border-left: 4px solid #50cafc;
    line-height: 24px;
    margin-bottom: 14px;
}
.coleDeep {
    background: #f6f6f6 !important;
}


.cole {
    width: 1007px;
}
.title {
    width: 1007px;
    height: 90px;
}
.inforTxt {
    width: 494px;
    float: left;
    padding: 20px 0 0 8px;
    padding-right: 80px;
}
.infor01, .infor02 {
    height: 28px;
}

.inforTxt a {
    font-size: 16px;
    display: inline-block;
    float: left;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    text-decoration: none;
}

.infor01 a {
    color: #282828;
    height: 28px;
    width: 346px;
}
.infor01 em {
    display: inline-block;
    float: right;
    color: #f46254;
    width: 140px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    text-align: right;
    font-size: 16px;
}
.infor01, .infor02 {
    height: 28px;
}
.infor02 span {
    display: inline-block;
    float: left;
    color: #717171;
    width: 108px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    text-align: right;
    margin-right: 14px;
    font-size: 16px;
}
.infor02 small {
    display: inline-block;
    float: left;
    color: #717171;
}
.infor02 font {
    display: inline-block;
    float: left;
    color: #717171;
    width: 106px;
    text-align: right;
    font-size: 16px;
}

.title i {
    display: block;
    width: 40px;
    height: 69px;
    float: right;
    background: url(./static/proscenium/images/arr_down.png) no-repeat 7px 32px;
    cursor: pointer;
    margin-right: 100px;
}
.detail {
    padding: 0px 14px 16px 42px;
    overflow: hidden;
    display: none;
}

i.arrowUp {
    background: url(./static/proscenium/images/arr_up.png) no-repeat 7px 32px;
    width: 40px;
    height: 69px;
    float: right;
    cursor: pointer;
}
 a {
    color: #282828;
}


.coleBtn {
    padding-top: 28px;
    margin-right: 20px;
}
.coleBtn {
    padding-top: 28px;
    float: left;
    position: relative;
}


.coleBtn .btn_a1 {
    display: block;
    float: left;
    width: 32px;
    height: 30px;
    background: url(./static/proscenium/images/up.png) no-repeat;
    cursor: pointer;
    display:none;
}

.coleBtn .btn_a2{
  display: block;
    float: left;
    width: 32px;
    height: 30px;
   background: url(./static/proscenium/images/down.png) no-repeat;
    cursor: pointer;
    display:none;
}


.coleBtn a {
    font-size: 16px;
}

.cole:hover  .coleBtn .btn_a1,.cole:hover  .coleBtn .btn_a2{
	display:inline;
		
}

.cole:first-child  .btn_a1{
display:inline-block;
visibility:hidden;
}

.cole:last-child  .btn_a2{
display:inline-block;
visibility:hidden;
}

.nav-wrapper  .nav  h3{
	cursor:pointer;
	min-width:130px;
}

.basicInformationLeft{
float:left;width:200px;
margin-top:20px;
}
.basicInformationRight{
margin-left:200px;

}

</style>


  </style>
  
 
		
<div style="min-width:1150px;">
	<div  class="basicInformationLeft"  id="fixLeft2">
		   <div  class="profile"   >
		        <%@ include file="../taskCenter_personalCenter_profile.jsp"%>
		       
		   </div>
		   
		   <div  class="outline-item   outline-active" id="basicNav">		       
		        	   <div  class="outline-itemIndex">1</div>
				       <div  class="outline-itemText bh-str-cut">个人课表</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   <div  class="outline-item  " id="basicNav">		       
		        	   <div  class="outline-itemIndex">2</div>
				       <div  class="outline-itemText bh-str-cut">学习成绩</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">3</div>
		       <div  class="outline-itemText bh-str-cut">等级考试</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   
		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">4</div>
		       <div  class="outline-itemText bh-str-cut">获奖情况</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		  
		   
		   
		</div>
		
		<div  class="basicInformationRight"   id="tab2Right">
		     <style>
		        /*科研信息中的类staff-search-detail-chart 的echarts样式*/
		        .staff-search-detail-chart{
		           overflow: hidden;
		           margin-bottom: 8px!important;
		           -webkit-tap-highlight-color: rgba(0,0,0,0);
		        }
		        .staff-search-detail-chart-box{		        	
				    width: -webkit-calc( (100% - 64px) / 3);
				    height: 289px;
				    float: left;
				    margin-right: 32px;
		        	width: calc( (100% - 64px) / 3);
		        	text-align: left;
		        	margin-top: 20px;
		        	box-sizing: border-box;
		        }
		        .chart-title{
		        	width: 100%;
				    padding-left: 16px;
				    line-height: 26px;
				    border: 1px solid #ddd;
				    border-bottom: 0;
				    font-size: 14px;
				    box-sizing: border-box;
		        }
		        .chart-item{
		           width: 100%;
				    height: 260px;
				    border: 1px solid #ddd;
				    padding-bottom: 12px;
				    -webkit-tap-highlight-color: transparent;
				    user-select: none;
				    position: relative;
				    background-color: transparent;
				    box-sizing: border-box;
		        }
		     </style>
		     <script>
		     
		   //第一次不加总计时构建的series对象
		   
	    	 var  series=series || function series(result,names){
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
		    	 /*
		    	 var paperChart = echarts.init(document.getElementById("paperChart"));
		    	 paperChart.showLoading('default', {text:'统计中，请稍候...',maskColor: '#404a59',textColor:
		    		 '#fff',});
		    	 var  result={
						    title:"科研论文",
						    month:[
						        'SCI',
						        'SSCI',
						        'EI',
						      	'自然'
						    ],
						    "主编":[
						        0,
						        0,
						        0,
						        1
						    ],
						    "参与":[
							        1,
							        0,
							        0,
							        
							],						   
						    name:[
						        "主编",
						        "参与"
						    ]
						};
		    	 setTimeout(function(){
		    		 paperChart.hideLoading();
					 var names = result.name;
					 paperChart.setOption(option={
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
					                 data: ['主编', '参与'],  
					                 inactiveColor: '#999',  
					                 selectedMode: 'single',  
					                 selected: {  
					                    '主编': true,  
					                    '参与': false
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
		    	
		    	//科研项目
		     
		     
		  	 var  result2={
					    title:"科研项目",
					    month:["国家","省部","地市","校级","横向","厅级","其它"],
					    "主持":[
					        0,0,0,3,0,0,1
					       
					    ],
					    "参与":[
					          0,0,0,0,0,0,0						        
						],						   
					    name:[
					        "主持",
					        "参与"
					    ]
					};
		       var names2 = result2.name;
		       var searchChartOption={
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
			                 data: ['主持', '参与'],  
			                 inactiveColor: '#999',  
			                 selectedMode: 'single',  
			                 selected: {  
			                    '主持': true,  
			                    '参与': false
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
					};
		    	   var searchChart = echarts.init(document.getElementById("searchChart"));
		    	   searchChart.showLoading('default', {text:'统计中，请稍候...',maskColor: '#404a59',textColor:
		    		 '#fff',});
		    	
		    	 setTimeout(function(){
		    		 searchChart.hideLoading();
		    		 searchChart.setOption(searchChartOption);
		    	 },1100);
		    	 
		    	 
		    	 
		    	
		    	
		    	
		    	 
		    	
		    	//fundChart
		    	   
		  	 var  result3={
					    title:"科研经费",
					    month:["合同经费","到款经费","经费余额"],
					    "经费":["18.947","49.124","49.124"],						   
					    name:[
					        "经费"
					    ]
					};
		       var names3 = result3.name;
		       var fundChartOption={
					   color:['#F9BE3E','#0099FF','#ddd'],
						
				         tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        }
					    },
					    legend:{
					    	 show: false
					    },
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
					};
		    	   var fundChart = echarts.init(document.getElementById("fundChart"));
		    	   fundChart.showLoading('default', {text:'统计中，请稍候...',maskColor: '#404a59',textColor:
		    		 '#fff',});
		    	
		    	 setTimeout(function(){
		    		 fundChart.hideLoading();
		    		 fundChart.setOption(fundChartOption);
		    	 },1150);
		    	 
		    	 */
		    	/* 参考1
		    	var  fundChartOption={
		    			"color":["#0099FF"],
		    			"xAxis":[
		    			         {
		    			        	 "type":"category",
		    			        	 "boundaryGap":false,
		    			        	 "nameTextStyle":{"color":"#ddd"},
		    			        	 "axisLine":{"show":false},
		    			        	 "axisLabel":{"interval":0},
		    			        	 "axisTick":{"show":false},
		    			        	 "splitLine":{"show":false},
		    			        	 "data":["合同经费","到款经费","经费余额"]
		    			        	 }
		    			         ],
		    			 "yAxis":[
		    			          {"type":"value","show":false}
		    			         ],
		    			 "grid":{
		    				 "show":false,
		    				 "top":20,
		    				 "bottom":22
		    				 },
		    			"legend":{
		    				"show":false,
		    				"data":["经费"]
		    			 },
		    			 "series":[
		    			           {
		    			        	   "type":"bar",
		    			        	   "barMinHeight":2,
		    			        	   "barCategoryGap":"10%",
		    			        	   "barWidth":30,
		    			        	   "label":{
		    			        		  "normal":{
		    			        			 "show":true,
		    			        			 "position":"top",
		    			        			 "textStyle":{
		    			        				 "color":"black"
		    			        			 }
		    			                   }
		    			                },
		    			               "name":"经费",
		    			               "data":["18.947","49.124","49.124"]
		    			             }
		    			           ]
		    	  };
		    	 var fundChart = echarts.init(document.getElementById("fundChart"));
		    	 fundChart.showLoading();
		    	
		    	 setTimeout(function(){
		    		 fundChart.hideLoading();
		    		 fundChart.setOption(fundChartOption);
							 	    		 
		    	 },1200);
		    	 */
		    	 /* 参考2
		    	 var searchChartOption={
		    			 "tooltip":{"trigger":"item"},
		    			 "legend":{
		    				 "x":"right",
		    				 "y":"center",
		    				 "data":[
		    				         {"name":"在校","icon":"circle"},
		    				         {"name":"毕业","icon":"circle"}
		    				        ],
		    				  "orient":"vertical",
		    					  "show":false//添加
		    			
		    			 },
		    			 "series":[
		    			           {
		    			        	   "name":"本科生",
		    			        	   "type":"pie",
		    			        	   "radius":[30,40],
		    			        	   "center":["15%","46%"],
		    			        	   "x":"0%",
		    			        	   "itemStyle":{
		    			        		   "normal":{
		    			        			   "label":{
		    			        				   "textStyle":{
		    			        					   "color":"#b4b4b4",
		    			        					   "fontSize":"14",
		    			        					   "fontFamily":"微软雅黑"
		    			        					   }
		    			                         }
		    			                    }
		    			                },
		    			                "color":["#ddd"],
		    			                "data":[
		    			                        {
		    			                        	"name":"在校",
		    			                        	"value":0.000001,
		    			                        	"itemStyle":{
		    			                        		"normal":{
		    			                        			"label":{
		    			                        				"show":true,
		    			                        				"position":"center",
		    			                        				"textStyle":{
		    			                        					"color":"#000",
		    			                        					"fontSize":"24",
		    			                        					"fontFamily":"微软雅黑"
		    			                        				}
		    			                                      },
		    			                                      "labelLine":{
		    			                                    	  "show":false
		    			                                       }
		    			                                  }
		    			                              }
		    			                        },
		    			                        {
		    			                        	"name":"毕业",
		    			                        	"value":"0",
		    			                        	"itemStyle":{
		    			                        		"normal":{
		    			                        			"label":{
		    			                        				"show":true,
		    			                        				"position":"center",
		    			                        				"textStyle":{
		    			                        					"fontFamily":"微软雅黑"
		    			                        				}
		    			                                     },
		    			                                     "labelLine":{
		    			                                    	 "show":false
		    			                                     }
		    			                                  }
		    			                           }
		    			                        }
		    			                    ]
		    			                },
		    			                {"name":"硕士生",
		    			                	"type":"pie",
		    			                	"radius":[30,40],
		    			                	"center":["40%","46%"],
		    			                	"x":"0%",
		    			                	"itemStyle":{"normal":
			    			                	     {"label":{
			    			                	    	 "textStyle":{
			    			                	    		 "color":"#b4b4b4","fontSize":"14","fontFamily":"微软雅黑"
			    			                	    }}}},"color":["#ddd"],
			    			                	    "data":[{"name":"在校","value":0.000001,
			    			                	    	"itemStyle":{"normal":{"label":
			    			                	    	{"show":true,"position":"center",
			    			                	    		"textStyle":{"color":"#000",
			    			                	    			"fontSize":"24","fontFamily":"微软雅黑"}},
			    			                	    			"labelLine":{"show":false}}}},

                                       {"name":"毕业","value":"0","itemStyle":{"normal":{"label":
                                       {"show":true,"position":"center","textStyle":{"fontFamily":"微软雅黑"}},
                                       "labelLine":{"show":false}}}}]},
                                       {"name":"博士生","type":"pie","radius":
                                    	   [30,40],"center":["65%","46%"],"x":"0%","itemStyle":{"normal":
                                    	   {"label":{"textStyle":{"color":"#b4b4b4","fontSize":"14",
                                    		   "fontFamily":"微软雅黑"}}}},"color":["#ddd"],"data":[{"name":"在校",
                                    			   "value":0.000001,"itemStyle":{"normal":{"label":
                                    			   {"show":true,"position":"center","textStyle":{"color":"#000",
                                    				   "fontSize":"24","fontFamily":"微软雅黑"}},"labelLine":{
                                    					   "show":false}}}},{"name":"毕业","value":"0",
                                    						   "itemStyle":{"normal":{"label":{"show":true,
                                    	"position":"center","textStyle":{"fontFamily":"微软雅黑"}},
                                    	"labelLine":{"show":false}}}}]}
                                     ]};
		    	 
		    	 
		    	 */
		    	 
		    	
		    	
		    	
		    
		    	 
		    	 
		});
		     
		    
		     
		     
		     </script>
		      <!-- 
		     <div  class="staff-search-detail-chart">
		     	<div class="staff-search-detail-chart-box">
		     		<div  class="chart-title">
		     		      科研论文(篇)
		     		</div>
		     		<div  class="chart-item "  id="paperChart">
		     		</div>
		     	</div>
		     	
		     	<div class="staff-search-detail-chart-box">
		     		<div  class="chart-title">
		     		      科研项目(项)
		     		</div>
		     		<div  class="chart-item "  id="searchChart" >
		     		</div>
		     	</div>
		     	
		     	<div class="staff-search-detail-chart-box"   style="margin-right:0px;">
		     		<div  class="chart-title">
		     		      科研经费(万)
		     		</div>
		     		<div  class="chart-item "   id="fundChart">
		     		</div>
		     	</div>
		     
		     
		     </div>
		     
		     -->
		     <div class="basic" > 
		     
		     		<div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>个人课表</h3>
					  		</div>
					  		<div  class="pageWrap   testContainer"    style="width:930px; overflow:auto;">
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
																 jsxm:'${wI.JSXM }',
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
							  		    
							  		
							  		     
							  		     
							  		     
							  		       
							  		     function dealString(time,position,course,jsxm){
							  		    	 
							  		        
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
							  		    	
							  		    	//可能有的时间是这样写的 周二第5,6节;周六第9,10节     有的   周四第7,8节{第14-18周};周日第5,6节{第14-18周}
							  		    	
							  		    	var   sections=section.split("节{第")[0].split(",");
							  		    	sections[0]=sections[0].substr(1,1);
							  		    	var   week=section.split("节{第")[1].split("周}")[0];
							  		   
							  		    	for(var  i=0;i<sections.length;i++){
							  		    	    var row=parseInt(sections[i]); if(row<1 ||  row>8) return;
							  		    	    var col=parseInt(col);if(col<1 ||  col>5) return;
							  		    	  
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
							  		    	  			showSeeOriginal[row-1][col][3]={tip:(course+"<br>"+position+"<br>"+week+"<br>"+jsxm+"<br>"),tipClass:"customRight"};
							  		    	  		
							  		    	  			
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
							  		    	    	dealString(curriculum[j],position[j],data[i].kcmc,data[i].jsxm);
							  		    	    
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
					  			 <h3>学习成绩</h3>
					  		</div>
					  		
					  		<div  class="pageWrap"    style="overflow:hidden;"  id="xxcjID">
					  		    <div  class="table  notOne">
					  		    </div>
				  		    </div>
				  		     <script>
						    
				  		       //修改滚动条
					  		       $(function(){
					  		    	
						  		    	
						  		    	//修改
						  		      var xxcj_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'学年',name:'XN', width: 130, align:'center' },
								        { title:'学期',name:'XQDM', width: 130, align:'center' },
								        { title:'考试科目',name:'KCMC', width: 130, align:'center' },
								        { title:'分数',name:'ZPCJ',width: 130, align:'center'},
								        { title:'学分',name:'XF',width: 130, align:'center'}
								        
								     ];
						  		        
						  		     	var xxcj_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${xxcjInformation}" var="wI"   varStatus="status">
											       	 {
											       		XN:'${wI.XN }',
											       		XQDM:'${wI.XQDM }',
											       		KCDM:'${wI.KCDM }',
											       		ZPCJ:'${wI.ZPCJ }',
											       		XF:'${wI.XF }',
											       		KCMC:'${wI.KCMC }'
											       		
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${xxcjInformation != null && fn:length(xxcjInformation)>0}">
												insertTable("xxcjID",xxcj_cols,xxcj_data,false);
											
												
												//insertTable("containerBooks_arrearage",books_arrearage_cols,books_arrearage_data,true,900);//1600);
								  		      	insertPagination("xxcjID","xxcj_arrearagePagination",
							  		  			 ${xxcjInformationTotal},1,10,'personalCenter/getXXCJ.html',function (){},function (){},
							  		  			 {width:(100+130+130+130+130+130)+7,topMargin:-19});
												
												
												
											</c:when>
											<c:otherwise>
												$("#xxcjID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>等级考试</h3>
					  		</div>
					  		<div  class="pageWrap   testContainer"   id="djxsID"  style="">
					  		    <div  class="table  notOne">
					  		    </div>
				  		    </div>
				  		     <script>
						    
				  		       //修改滚动条
					  		       $(function(){
					  		    	
						  		    	
						  		    	//修改
						  		      var djxs_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'科目',name:'KSKMDM', width: 130, align:'center' },
								        { title:'分数',name:'FSKSCJ',width: 130, align:'center'}
								        
								     ];
						  		        
						  		     	var djxs_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${djxsInformation}" var="wI"   varStatus="status">
											       	 {
											       		KSKMDM:'${wI.KSKMDM }',
											       		FSKSCJ:'${wI.FSKSCJ }'
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${djxsInformation != null && fn:length(djxsInformation)>0}">
												insertTable("djxsID",djxs_cols,djxs_data,false);
											</c:when>
											<c:otherwise>
												$("#djxsID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>获奖情况</h3>
					  		</div>
					  		
					  		<div  class="pageWrap"    style="width:930px;overflow:hidden;"   id="hjqkID">
					  		     <div  class="table  notOne">
					  		    </div>
				  		    </div>	
				  		    
				  		     <script>
						    
				  		       //修改滚动条
					  		       $(function(){
					  		    	
					  		    	
					  		    		<%  
					  		    	    try {  
					  		    	  		ArrayList  al=new  ArrayList<HashMap>();
							  		  		HashMap    hm=null;
							  		  		for(int  i=0;i<1;i++){
							  		  			hm=new  HashMap();
							  		  			hm.put("HJSJ", "2015-04-17");
							  		  			hm.put("HJMS", "test");
							  		  			//al.add(hm);
							  		  		} 
					  		    	     //   request.setAttribute("hjqkInformation", al);  
					  		    	    } catch (Exception e) {  
					  		    	        request.setAttribute("result", "很抱歉，页面产生错误！");  
					  		    	    }  
					  		    	%> 
						  		    	//修改
						  		       var hjqk_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'奖励名称',name:'JLMC', width: 130, align:'center' },
								        { title:'成果名称',name:'CGMC', width: 180, align:'center' },
								        { title:'获奖日期',name:'HJRQ', width: 130, align:'center' },
								        { title:'获奖级别',name:'HJJBDM',width: 130, align:'center'},
								        { title:'授奖等级',name:'SJDJDM',width: 130, align:'center'},
								        { title:'授奖单位',name:'SJDW',width: 130, align:'center'},
								        { title:'完成单位',name:'WCDW',width: 230, align:'center'}
								        
								     ];
						  		 	var hjqk_data =[
		  		     	                            
			  		     	                      	 <c:forEach items="${hjqkInformation}" var="wI"   varStatus="status">
												       	 {
												       		JLMC:'${wI.JLMC }',
												       		CGMC:'${wI.CGMC }',
												       		HJRQ:'${wI.HJRQ }',
												       		HJJBDM:'${wI.HJJBDM }',
												       		SJDJDM:'${wI.SJDJDM }',
												       		SJDW:'${wI.SJDW }',
												       		WCDW:'${wI.WCDW }'
											             }
								  		                 <c:if test="${status.last eq false}">,</c:if>
									  		       
									  		   		 </c:forEach>                       
								  		        	     				  		        
									  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     
										 
										<c:choose>
											<c:when test="${hjqkInformation != null && fn:length(hjqkInformation)>0}">
												insertTable("hjqkID",hjqk_cols,hjqk_data,true,1200);
												insertPagination("hjqkID","hjqkIdProjectPagination",
									  		  			 ${hjqkInformationTotal},1,10,'personalCenter/hjqkProject.html');
											</c:when>
											<c:otherwise>
												$("#hjqkID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
	<a   href="javascript:void(0);"  target="_blank"  >
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
	  var content=$("#tab2Right  .content");
	  content.each(function(i,d){
		  var index=content.index(this);
		  $(this).attr("id","content2"+index);
	  });
	  
	  //记录本tab content的位置，
	  var record2=[];
	  var  $outline2;
	 var length=$("#fixLeft2  .outline-item").length;
	 function  updateRecord2(){
		 record2=[];
		 $outline2=$("#fixLeft2  .outline-item");;
		 $outline2.each(function(i,d){
			  record2.push($('#content2'+i).offset().top);
		  });
		 $(document).trigger("scroll");
	 }
	 
	 
	 
	 //高亮左边
		function  activeLeft2(i){
			  if(i>=0  && i<record2.length){
					$outline2.removeClass("outline-active");
					$outline2.eq(i).addClass("outline-active");
			  }
		}
	 
	  $outline2=$("#fixLeft2 .outline-item");
	  $("#fixLeft2   .outline-item").click(function(){
		  var  index=$outline2.index(this);
		  
		  //移动的距离计算，如果不用移动，就要立即显示切换						
		  var from=$(document).scrollTop();
		  var to=$('#content2'+index).offset().top;
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
		  $('html,body').animate({scrollTop:$('#content2'+index).offset().top},timeSpan);	
		  setTimeout(function(){activeLeft2(index);},timeSpan+17);
		  
		 // $('html,body').animate({scrollTop:$('#content2'+index).offset().top},800);	
		 // setTimeout(function(){activeLeft2(index);},850);
	  });
	  
	  
	  var h3= $("#tab2Right  .nav-wrapper  .nav  h3");	  
	  $("#tab2Right .nav-wrapper  .nav  h3").click(function(){	
		  var index=h3.index(this);
			$(this).closest(".nav-wrapper").find(".pageWrap").slideToggle("500","swing");
			$(this).closest(".nav-wrapper").find(".pagerContainer").slideToggle("200","swing");
			setTimeout(function(){updateRecord2();},550);
			setTimeout(function(){activeLeft2(index);},600);
	  });
	  updateRecord2();
	  var dv=$("#fixLeft2");
	  var originTop=dv.offset().top;
		$(window).scroll(function(){
			 var scrollY = $(document).scrollTop();// 
			for(var i=0;i<record2.length;i++){
				if(record2[i]<=scrollY &&  ( (i==(record2.length-1)) ||  (record2[i+1]>scrollY)  )  ){
				    activeLeft2(i);
				}
			}
			
			 
			//固定左边
			 if(scrollY>originTop){							 
				 dv.css({position: "absolute"});
				 dv.css({
					 'top': ( scrollY - $($("#tab2Right")[0]).offset().top +"px") ,
					 'margin-top':"0px" 
					 });
			 }else{
				 dv.css({'position': "static", 'margin-top':"20px"});
			 }
			 
			
		});
    	$("#myDiv2").html($("#myDiv").html());
    
       
      
	
});

</script>
 