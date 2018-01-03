<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://bangxue.com/springTag" prefix="springTag" %>
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
				       <div  class="outline-itemText bh-str-cut">科研项目</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   <div  class="outline-item  " id="basicNav">		       
		        	   <div  class="outline-itemIndex">2</div>
				       <div  class="outline-itemText bh-str-cut">科研论文</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">3</div>
		       <div  class="outline-itemText bh-str-cut">科研专利</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">4</div>
		       <div  class="outline-itemText bh-str-cut">书籍著作权</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">5</div>
		       <div  class="outline-itemText bh-str-cut">软件著作权</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">6</div>
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
					  			 <h3>科研项目</h3>
					  		</div>
					  		<div  class="pageWrap  "     id="test1Container"  >
					  		      <div  class="table  "   id="test1">
					  		      
					  		
					  		        
					  		       <script>
					  		           
					  		         $(function(){
						  		         var research_project_cols = [
										        {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
										            return '<a class="viewDetail">查看</a>';
										        }},
										        { title:'项目名称',name:'XMMC', width: 230, align:'center' },
										        { title:'年度',name:'ND',width: 130, align:'center'},
										        { title:'单位名称',name:'DWMC',renderer: function(val,item,rowIndex){
										          
										           if(val===undefined){
										        	   return "";
										           }
										           return val;
										        } },
										        { title:'项目类型',name:'type' }
										     ];
						  		      
						  		       justGridWidth(research_project_cols);

	 						  		     	var research_project_data =[   	
	 	  							  		 	 <c:forEach items="${researchInformation2}" var="wI"   varStatus="status">
	 	  								       	 {
	 	  								         	XMMC:'${wI.XMMC }',
	 	  								        	ND:'${wI.ND }',
	 	  								        	DWMC:'${wI.DWMC }',
	 	  								        	type:'${wI.type }'
	 	  							             }
	 	  				  		                 <c:if test="${status.last eq false}">,</c:if>	  					  		       
	 	  					  		   			 </c:forEach>
	 	  					  		   			 
  					  		        	];	
						  		    	
						  		    
						  		      	
						  		 	 <c:choose>
										<c:when test="${researchInformation2 != null && fn:length(researchInformation2)>0}">
											insertTable("test1Container",research_project_cols,research_project_data,false);
							  		      	//insertPagination("test1Container","researchProjectPagination",
						  		  			// ${researchInformationTotal},1,10,'personalCenter/researchProject.html');
							  		      	
							  		    //  insertPagination("test1Container","researchProjectPagination",
								  		 // 			 ${researchInformation2Total},1,10,'personalCenter/researchProject.html');
							  		      
							  		 
							  		      	insertPagination("test1Container","researchProjectPagination",
						  		  			 ${researchInformation2Total},1,10,'personalCenter/researchProject.html',function (){},function (){},
						  		  			 {width:930,topMargin:-19});
							  		    
										</c:when>
										<c:otherwise>
											$("#test1Container").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
										</c:otherwise>
									 </c:choose>
									 
						  		    	
						  		      });
					  		         
					  		         
					  		   
					  		         
					  		      </script>	
					  		        
					  		     </div>
				  		    </div>
				  		    
				     	</div>
				     </div>
				     
				     <div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>科研论文</h3>
					  		</div>
					  		
					  		<div  class="pageWrap"     style="overflow:hidden;" id="kylwID">
					  		    <div  class="table  "   >
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
							  		  		//	al.add(hm);
							  		  		} 
					  		    	     //   request.setAttribute("kylwInformation", al);  
					  		    	    } catch (Exception e) {  
					  		    	        request.setAttribute("result", "很抱歉，页面产生错误！");  
					  		    	    }  
					  		    	%> 
						  		    	//修改
						  		      var kylw_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'论文名称',name:'LWMC', width: 280, align:'center' },
								        { title:'论文英文名称',name:'LWYWMC',width: 130, align:'center'},
								        { title:'发布日期',name:'FBRQ',width: 130, align:'center', renderer: function(val,item,rowIndex){
								            return val.replace("12.00.00.000000000 ","")
								        }},
								        { title:'ISSN',name:'ISSN',width: 130, align:'center'}
								        
								     ];
						  			   justGridWidth(kylw_cols,930);
						  		        
						  		     	var kylw_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${kylwInformation}" var="wI"   varStatus="status">
											       	 {
											       		LWMC:'${wI.LWMC }',
											       		LWYWMC:'${wI.LWYWMC }',
											       		FBRQ:'${wI.FBRQ }',
											       		ISSN:'${wI.ISSN }'
											       		
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${kylwInformation != null && fn:length(kylwInformation)>0}">
												insertTable("kylwID",kylw_cols,kylw_data,false);
												insertPagination("kylwID","kylwInformationPagination",
									  		  			 ${kylwInformationTotal},1,10,'personalCenter/kylwInformation.html',function (){},function (){},
									  		  			 {width:930,topMargin:-19});
											</c:when>
											<c:otherwise>
												$("#kylwID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>科研专利</h3>
					  		</div>
					  		<div  class="pageWrap   testContainer"   id="test2Container"  style="">
					  		      <div  class="table  "   id="test2">
					  		      
					  		       <script>
					  		           
					  		         $(function(){
					  		        	 /*
								  			
						  		    	  var tempStr=getTableLine([ ['操作',100,true],['专利名称',350,true],['专利号',130,true],['专利权人',200,true]
							  		         
				  		       				,['排名',130,true]
				  		         		],true,1300,"#f6f6f6");
						  		    	  tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['一种密封胶与被粘基材粘接试样界面抗剪强度的测试方法',350],['',130],['西安科技大学',200]
							  		         
					       					,['6',130]
					         			],false,1300);
						  		    	  
						  		    	  tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['密封胶与被粘基材粘接试样剥离强力测试方法',350],['',130],['西安科技大学',200]
							  		         
					       					,['6',130]
					         			],false,1300);
						  		    	  
						  		    	  tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['密封材料与混凝土粘结试样界面抗渗性能的测试方法',350],['',130],['西安科技大学',200]
							  		         
					       					,['5',130]
					         			],false,1300);
						  		    	tempStr+= getPagination("researchPatentPagination","1-3","3");
						  		    	$("#test2").html(tempStr);
						  		    	
						  		    	//修改滚动条
						  		    	$("#researchPatentPagination   .itemPerPage").css({"display":"block"});
					  		         	$("#researchPatentPagination   .itemPerPage").mCustomScrollbar({
					  		                theme: "#004e90"
					  		            });
						  		    	$("#researchPatentPagination   .itemPerPage").css({"display":"none"});
						  		    	*/
						  		    //将上边的代码改为后台获取
						  		    
						  		           var research_patent_cols = [
										        {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
										            return '<a class="viewDetail">查看</a>';
										        }},
										        { title:'申请日期',name:'ZLSQRQ', width: 130, align:'center' },
										        { title:'专利权人',name:'ZLQR',width: 130, align:'center'},
										        { title:'专利状态',name:'ZLZT' },
										        { title:'授权专利号',name:'SQZLH ' }
										       
										     ];
						  		    	 justGridWidth(research_patent_cols,930);
						  		        /*
						  		     	var research_patent_data =[
							  		        	     {
							  		        	    	name:'一种密封胶与被粘基材粘接试样界面抗剪强度的测试方法',number:'',
							  		        	    	holder:'西安科技大学',ranking:'6'
							  		        		 },
							  		        		 {
								  		        	    	name:'密封胶与被粘基材粘接试样剥离强力测试方法',number:'',
								  		        	    	holder:'',ranking:'6'
								  		        	 },
								  		        	 {
									  		        	    	name:'密封材料与混凝土粘结试样界面抗渗性能的测试方法',number:'',
									  		        	    	holder:'',ranking:'5'
									  		         }
							  		        	];
						  		     	*/
						  		     	
						  		  	var research_patent_data =[   	
						  		 	 <c:forEach items="${patentInformation}" var="wI"   varStatus="status">
							       	 {
							       		ZLSQRQ:'${wI.ZLSQRQ }',
							       		ZLQR:'${wI.ZLQR }',
							       		ZLZT:'${wI.ZLZT }',
							       		SQZLH:'${wI.SQZLH }'
						             }
			  		                 <c:if test="${status.last eq false}">,</c:if>
				  		       
				  		   			 </c:forEach>  
				  		   		 
				  		        	];	
						  		     	
						  		     	//如果有数据显示，否则显示暂无数据
						  		     	 <c:choose>
											<c:when test="${patentInformation != null && fn:length(patentInformation)>0}">
											    insertTable("test2Container",research_patent_cols,research_patent_data,false);
								  		      	insertPagination("test2Container","zlIdProjectPagination",
							  		  			 ${zlInformationTotal},1,10,'personalCenter/zlProject.html',function (){},function (){},
							  		  			 {width:930,topMargin:-19});
											    </c:when>
											<c:otherwise>
												$("#test2Container").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
											</c:otherwise>
										 </c:choose>
								
						  		    	  
						  		      });
					  		         
					  		      </script>	
					  		        
					  		     </div>
				  		    </div>
				     	</div>
				     </div>
				     
				     
				    <div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>书籍著作权</h3>
					  		</div>
					  		
					  		<div  class="pageWrap"     style="width:930px;overflow:hidden;"   id="sjzzqID">
					  		    <div  class="table  "   >
					  		    </div>
				  		    </div>
				  		    	<%  
					  		    	    try {  
					  		    	  		ArrayList  al=new  ArrayList<HashMap>();
							  		  		HashMap    hm=null;
							  		  		for(int  i=0;i<1;i++){
							  		  			hm=new  HashMap();
							  		  			hm.put("ISBN", "test");
							  		  			hm.put("HJSJ", "2015-04-17");
							  		  			hm.put("HJMS", "test");
							  		  			hm.put("CBS", "test");
							  		  			//al.add(hm);
							  		  		} 
					  		    	      //  request.setAttribute("sjzzqInformation", al);  
					  		    	    } catch (Exception e) {  
					  		    	        request.setAttribute("result", "很抱歉，页面产生错误！");  
					  		    	    }  
					  		    	%> 
					  		    
				  		    <script>
						    
				  		    
					  		       $(function(){
						  		    	//修改
						  		      var sjzzq_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'著作名称',name:'ZZMC', width: 282, align:'center' },
								        { title:'著作类别',name:'LZLBDM', width: 159, align:'center' },
								        { title:'出版单位名称',name:'CBSMC',width: 221, align:'center'},
								        { title:'ISBN',name:'ISBN',width: 162, align:'center'}
								        
								        
								     ];
						  		//   justGridWidth(sjzzq_cols,930);
						  		        
						  		     	var sjzzq_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${sjzzqInformation}" var="wI"   varStatus="status">
											       	 {
											       		ZZMC:'${wI.ZZMC }',
											       		LZLBDM:'${wI.LZLBDM }',
											       		CBSMC:'${wI.CBSMC }',
											       		ISBN:'${wI.ISBN }'
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${sjzzqInformation != null && fn:length(sjzzqInformation)>0}">
												insertTable("sjzzqID",sjzzq_cols,sjzzq_data,false);								  		 
								  		      	insertPagination("sjzzqID","sjzzqIdProjectPagination",
							  		  			 ${sjzzqInformationTotal},1,10,'personalCenter/sjzzqProject.html',function (){},function (){},
							  		  			 {width:930,topMargin:-19});
								  		      	
												
												</c:when>
											<c:otherwise>
												$("#sjzzqID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>软件著作权</h3>
					  		</div>
					  		
					  		<div  class="pageWrap"      style="width:930px;overflow:hidden;"  id="rjzzqID">
					  		     <div  class="table  "   >
					  		     </div>
				  		    </div>	
				  		 
					  		    
				  		    <script>
						    
				  		    
					  		       $(function(){
						  		    	//修改
						  		      var rjzzq_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'登记号',name:'DJH', width: 130, align:'center' },
								        { title:'著作权人',name:'ZZQR', width: 330, align:'center' },
								        { title:'登记日期',name:'DJRQ', width: 165, align:'center' }
								        
								     ];
						  		       
						  		      justGridWidth(rjzzq_cols,930);
						  		     	var rjzzq_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${rjzzqInformation}" var="wI"   varStatus="status">
											       	 {
											       		DJH:'${wI.DJH }',
											       		ZZQR:'${wI.ZZQR }',
											       		DJRQ:'${wI.DJRQ }'
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${rjzzqInformation != null && fn:length(rjzzqInformation)>0}">
												insertTable("rjzzqID",rjzzq_cols,rjzzq_data,false);
												insertPagination("rjzzqID","rjzzqIdProjectPagination",
									  		  			 ${rjzzqInformationTotal},1,10,'personalCenter/rjzzqProject.html',function (){},function (){},
									  		  			 {width:930,topMargin:-19});
											</c:when>
											<c:otherwise>
												$("#rjzzqID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  		
					  		<div  class="pageWrap"     style="width:930px; height:379px;overflow:hidden;"  id="hjqkID"   >
					  		     <div  class="table  "   >
					  		     </div>
				  		    </div>	
				  		  
					  		    
				  		    <script>
						    
				  		    
					  		       $(function(){
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
 