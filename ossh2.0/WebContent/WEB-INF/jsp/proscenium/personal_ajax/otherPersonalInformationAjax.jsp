<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <div class="gridly">
        
      	<!-- 
      	 <div class="brick small  detail"  id="1">
  		 <div id="assets" style="width: 472px;height:300px;"  class="assets">
	           	        <div   class="showDetail">
	           	           <a  href="javascript:;" class="move ui-sortable-handle" title="详情"></a>
	           	        </div>
	           	        <b>我的财务</b>
	           	        <div>
	           	        	<div  class="pos">
		           	    		<div  class="circle">
		           	    		3
		           	    		</div>
		           	    		<span>项目账</span>
		           	    	</div>
		           	    	<div class="pos">
		           	    		<div  class="circle2">
		           	    		12
		           	    		</div>
		           	    		<span>往来账</span>
		           	    	</div>
	           	        
	           	        </div>
	       </div>
  
 	 </div>
  
      	<div class="brick small  detail"  id="2">
  		 <div id="assets" style="width: 472px;height:300px;"  class="assets">
	           	        <div   class="showDetail">
	           	           <a  href="javascript:;" class="move ui-sortable-handle" title="详情"></a>
	           	        </div>
	           	        <b>科研项目</b>
	           	        <div    id="researchProject2"  style="width: 453px;height:290px;">
	           	        </div>
	       </div>
 	 </div>
	   -->
	   <!-- 
	  <div class="brick small"  id="1">
	      <div id="MyFinance" style="width: 472x;height:300px;"></div>
	  </div>
	    
	  <div class="brick small"  id="3">
	      <div id="qualityTeaching" style="width: 472x;height:300px;"></div>
	  </div>
	    -->
	   
	  <div class="brick small"  id="2">
	      <div id="researchProject2" style="width: 472x;height:300px;"></div>
	  </div>
	 
	
	  <div class="brick small" id="4">
	       <div id="guideStudent" style="width: 472px;height:300px;"></div>
	  </div>
	  <div class="brick small"  id="5">
	  		<div id="achievements" style="width: 472px;height:300px;"></div>
	  
	  </div>
	  <div class="brick small"  id="6">
	         <div id="researchFunding" style="width: 472px;height:300px;"></div>
	  </div>

</div>

<script>
$(function(){
	
/*
	
	var MyFinance = echarts.init(document.getElementById('MyFinance'));
	 var option1 = {
    	 color: ['#3398DB'],
         title: {
             text: '我的财务'
         },
         grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
         tooltip: {
        	  trigger: 'axis',
              axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                  type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
              }
         },
         
         legend: {
             data:['项']
         },
         xAxis: {
             data: ["项目账","往来账"],
	         type : 'category',
	      
	         axisTick: {
	             alignWithLabel: true
	         }
         
         },
         yAxis : [
                  {
                      type : 'value'
                  }
          ],
         series: [{
             name: '项',
             type: 'bar',
             data: [${projectAccount},${comeAndGo}]
         }],
         toolbox: { //可视化的工具箱
             show: true,
             feature: {
                
                 saveAsImage: {//保存图片
                     show: true
                 },
               
                 myTool : {  
                     show : true,  
                     title : '详情',  
                     icon : 'image://${contextPath}/static/proscenium/images/favicon.png',  
                     onclick : function (){  
                         alert("I do");
                     }  
                  } 
             }
         }
     };

     // 使用刚指定的配置项和数据显示图表。
     MyFinance.setOption(option1);
	 
	 */
	 
	/*
	 var qualityTeaching = echarts.init(document.getElementById('qualityTeaching'));
     var option = {
    	 color: ['#3398DB'],
         title: {
             text: '教学质量'
         },
         grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
         tooltip: {
        	  trigger: 'axis',
              axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                  type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
              }
         },
         
         legend: {
             data:['课时']
         },
         xAxis: {
             data: ["2014","2015","2016","2017"],
	         type : 'category',
	      
	         axisTick: {
	             alignWithLabel: true
	         }
         
         },
         yAxis : [
                  {
                      type : 'value'
                  }
          ],
         series: [{
             name: '课时',
             type: 'bar',
             data: [5, 20, 36, 10]
         }],
         toolbox: { //可视化的工具箱
             show: true,
             feature: {
                
                 saveAsImage: {//保存图片
                     show: true
                 },
               
                 myTool : {  
                     show : true,  
                     title : '详情',  
                     icon : 'image://${contextPath}/static/proscenium/images/favicon.png',  
                     onclick : function (){  
                         alert("I do");
                     }  
                  } 
             }
         }
     };

     // 使用刚指定的配置项和数据显示图表。
     qualityTeaching.setOption(option);
     
     */
     
     
     guideStudent = echarts.init(document.getElementById('guideStudent'));
     var option2 = {
    	 color: ['#3398DB'],
         title: {
             text: '指导学生情况'
         },
         grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
         tooltip: {
        	  trigger: 'axis',
              axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                  type : 'line'        // 默认为直线，可选为：'line' | 'shadow'
              }
         },
         legend: {
             data:['人']
         },
         xAxis: {
             data: ["本科生","硕士生","博士生"]
         },
         yAxis: {},
         series: [{
             name: '人',
             type: 'bar',
             data: [${undergraduate}, ${master},${doctor}]
         }]
         /*,
         toolbox: { //可视化的工具箱
             show: true,
             feature: {
                
                 saveAsImage: {//保存图片
                     show: true
                 },
               
                 myTool : {  
                     show : true,  
                     title : '详情',  
                     icon : 'image://${contextPath}/static/proscenium/images/favicon.png',  
                     onclick : function (){  
                         alert("I do");
                     }  
                  } 
             }
         }*/
     };
     // 使用刚指定的配置项和数据显示图表。
     guideStudent.setOption(option2);
     
     
     
      achievements = echarts.init(document.getElementById('achievements'));
     var option3 = {
    		 title: {
                 text: '科研成果',
               //  subtext: '副标题',
                 x:'left'
             },
    		 series : [
       		        {
       		            name: '科研成果',
       		            type: 'pie',
       		            radius: '62%',
       		       		center: ['50%', '65%'],
       		           // roseType: 'angle',
       		             minAngle:'15',
       		            data:[
       		                {value:${sci}, name:'(S)SCI/EI'},
       		                {value:${dissertation}, name:'其它论文'},
       		                {value:${patent}, name:'专利'},
       		                {value:${achievements}, name:'成果'}
       		            ],
	       		         itemStyle: {
	 	                    normal:{
	 	                        label:{
	 	                            show:true,
	 	                            formatter: "{b} :\n  {c} ",
	 	                            position:"inner"
	 	                        }
	 	                    }
	 	                }
       		        }
       		    ],
       		 grid: {
 		        left: '3%',
 		        right: '4%',
 		        bottom: '3%',
 		        containLabel: true
 		    },
       		tooltip: {
       			show: true,
       		 	formatter: '{b} <br/> {c} '//默认值null，内容格式器
            },
            //图例，每个图表最多仅有一个图例
	        legend: {
	           // orient: 'vertical',
	           // left: 'left',
			   right:50,
	            data: ['(S)SCI/EI','其它论文','专利','成果']
	        }
            /*,
	        toolbox: { //可视化的工具箱
	             show: true,
	             feature: {
	                
	                 saveAsImage: {//保存图片
	                     show: true
	                 },
	               
	                 myTool : {  
	                     show : true,  
	                     title : '详情',  
	                     icon : 'image://${contextPath}/static/proscenium/images/favicon.png',  
	                     onclick : function (){  
	                         alert("I do");
	                     }  
	                  } 
	             }
	         }
	        */
     };
     // 使用刚指定的配置项和数据显示图表。
     achievements.setOption(option3);
     
      researchFunding = echarts.init(document.getElementById('researchFunding'));
     var option4 = {
    		  //标题
    	        title : {
    	            text: '科研经费',
    	            x:'left',
    	        },


    	        //提示框，鼠标悬浮交互时的信息提示
    	        tooltip : {
    	            show: true,//默认值true，可选为：true（显示） | false（隐藏）
    	            zlevel: 1,//默认值1，一级层叠控制。每一个不同的zlevel将产生一个独立的canvas，相同zlevel的组件或图标将在同一个canvas上渲染。zlevel越高越靠顶层，canvas对象增多会消耗更多的内存和性能，并不建议设置过多的zlevel，大部分情况可以通过二级层叠控制z实现层叠控制。
    	            z: 8,//默认值8，二级层叠控制，同一个canvas（相同zlevel）上z越高约靠顶层。
    	            showContent: true,//默认值true，tooltip主体内容显示策略，只需tooltip触发事件或显示axisPointer而不需要显示内容时可配置该项为false，
    	            trigger: 'axis',//默认值'item'，触发类型，默认数据触发，见下图，可选为：'item' | 'axis'
    	            position: null,//默认值null，位置指定，传入{Array}，如[x, y]， 固定位置[x, y]；传入{Function}，如function([x, y]) {return [newX,newY]}，默认显示坐标为输入参数，用户指定的新坐标为输出返回。
    	            formatter: '{a} < br/>{b} : {c}',//默认值null，内容格式器
    	            //折线（区域）图、柱状（条形）图、K线图 : a（系列名称），b（类目值），c（数值）, d（无）
    	            //散点图（气泡）图 : a（系列名称），b（数据名称），c（数值数组）, d（无）
    	            //地图 : a（系列名称），b（区域名称），c（合并数值）, d（无）
    	            //饼图、雷达图、仪表盘、漏斗图: a（系列名称），b（数据项名称），c（数值）, d（饼图：百分比 | 雷达图：指标名称）
    	            islandFormatter: '{a} < br/>{b} : {c}',//默认值'{a} < br/>{b} : {c}'，拖拽重计算独有，数据孤岛内容格式器
    	            showDelay: 20,//默认值20，显示延迟，添加显示延迟可以避免频繁切换，特别是在详情内容需要异步获取的场景，单位ms
    	            hideDelay: 100,//默认值100，隐藏延迟，单位ms
    	            transitionDuration: 0.4,//默认值0.4，动画变换时长，单位s，如果你希望tooltip的跟随实时响应，showDelay设置为0是关键，同时transitionDuration设0也会有交互体验上的差别。
    	            enterable: false,//默认值false，鼠标是否可进入详情气泡中，默认为false，如需详情内交互，如添加链接，按钮，可设置为true。
    	            backgroundColor: 'rgba(0,0,0,0.7)',//默认值，提示背景颜色，默认为透明度为0.7的黑色
    	            borderColor: '#333',//默认值，提示边框颜色
    	            borderRadius: 4,//默认值，提示边框圆角，单位px，默认为4
    	            borderWidth: 0,//默认值，提示边框线宽，单位px，默认为0（无边框）
    	            padding: 5,//默认值，提示内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距，同css
    	            axisPointer: {//默认值，坐标轴指示器，默认type为line，可选为：'line' | 'cross' | 'shadow' | 'none'(无)，指定type后对应style生效，见下 
    	            //lineStyle设置直线指示器（详见lineStyle）, 
    	            //crossStyle设置十字准星指示器（详见lineStyle）, 
    	            //shadowStyle设置阴影指示器（详见shadowStyle），areaStyle.size默认为'auto'自动计算，可指定具体宽度
    	                type: 'none',//默认值，可选值：'line' | 'cross' | 'shadow' | 'none'(无)，指定type后对应style生效（如下）
    	                lineStyle: {//默认值各异，
    	                    color: 'rgba(0,0,0,0.7)',//默认值各异，颜色rgba
    	                    type: 'solid',//默认值，
    	                    width: 0,//默认值，
    	                    shadowColor: 'rgba(0,0,0,0)',//默认值，折线主线(IE8+)有效，阴影色彩，支持rgba
    	                    shadowBlur: 5,//默认值，折线主线(IE8+)有效，阴影模糊度，大于0有效
    	                    shadowOffsetX: 3,//默认值，折线主线(IE8+)有效，阴影横向偏移，正值往右，负值往左
    	                    shadowOffsetY: 3,//默认值，折线主线(IE8+)有效，阴影纵向偏移，正值往下，负值往上
    	                },
    	                crossStyle: {//默认值，
    	                    color: 'rgba(0,0,0,0.7)',//默认值，
    	                    type: 'solid',//默认值，
    	                    width: 0,//默认值，
    	                    shadowColor: 'rgba(0,0,0,0)',//默认值，
    	                    shadowBlur: 5,//默认值，
    	                    shadowOffsetX: 3,//默认值，
    	                    shadowOffsetY: 3,//默认值，
    	                },
    	                shadowStyle: {//默认值，
    	                    color: 'rgba(0,0,0,0.7)',//默认值，
    	                    type: 'default',//默认值，
    	                },
    	                textStyle: {//默认值，
    	                    fontFamily: 'Arial, Verdana, sans...',//默认值，
    	                    fontSize: 12,//默认值，
    	                    fontStyle: 'normal',//默认值，
    	                    fontWeight: 'normal',//默认值，
    	                },
    	            },
    	            textStyle: {//默认值，
    	                color: 'rgba(0,0,0,0.7)',//默认值各异，
    	                decoration: 'none',//默认值，
    	                align: 'rgba(0,0,0,0.7)',//默认值，
    	                baseline: 'rgba(0,0,0,0.7)',//默认值，
    	                fontFamily: 'Arial, Verdana, sans...',//默认值，
    	                fontSize: 12,//默认值，
    	                fontStyle: 'italic',//默认值，样式，可选为：'normal' | 'italic' | 'oblique'
    	                fontWeight: 'bolder',//默认值，粗细，可选为：'normal' | 'bold' | 'bolder' | 'lighter' | 100 | 200 |... | 900
    	            },
    	        },
    	        grid: {
    		        left: '3%',
    		        right: '4%',
    		        bottom: '3%',
    		        containLabel: true
    		    },



    	        //图例，每个图表最多仅有一个图例
    	        legend: {
    	           // orient: 'vertical',
    	            right:50,
    	            data: ['合同经费','到款经费','经费余额']
    	        },
    	        // 系列列表,每个系列通过 type 决定自己的图表类型
    	        series : [
    	            {
    	                name: '访问',
    	                type: 'pie',
    	                radius : '62%',
    	                center: ['50%', '65%'],
    	                minAngle:'15',
    	                data:[
    	                    {name:"合同经费",value:${contractFunding}},
    	                    {name:"到款经费",value:${incomeFunding}},
    	                    {name:"经费余额",value:${fundBalance}}
    	                ],
    	                itemStyle: {
    	                    normal:{
    	                        label:{
    	                            show:true,
    	                            formatter: "{b} :\n  {c} \n ({d}%)",
    	                            position:"inner"
    	                        }
    	                    }
    	                }
    	            }
    	        ]
    	        /*,
    	        toolbox: { //可视化的工具箱
    	             show: true,
    	             feature: {
    	                
    	                 saveAsImage: {//保存图片
    	                     show: true
    	                 },
    	               
    	                 myTool : {  
    	                     show : true,  
    	                     title : '详情',  
    	                     icon : 'image://${contextPath}/static/proscenium/images/favicon.png',  
    	                     onclick : function (){  
    	                         alert("I do");
    	                     }  
    	                  } 
    	             }
    	         }*/
     };
     // 使用刚指定的配置项和数据显示图表。
     researchFunding.setOption(option4);
     
     
     
     
   
     
     
  //   assets
  
      researchProject2 = echarts.init(document.getElementById('researchProject2'));
     var option6 = {
    	        title : {
    	            text: '科研项目',
    	            x:'left',
    	        },	 
    		 tooltip : {
    		        trigger: 'axis',
    		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
    		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
    		        }
    		    },
    		    legend: {    	         
					 right:50,
    		        data: ['国家级', '省部级','市厅级','其它']
    		    },
    		    grid: {
    		        left: '3%',
    		        right: '4%',
    		        bottom: '3%',
    		        containLabel: true
    		    },
    		    xAxis:  {
    		        type: 'value'
    		    },
    		    yAxis: {
    		        type: 'category',
    		        data: ['主持','参与']
    		    },
    		    series: [
    		        {
    		            name: '国家级',
    		            type: 'bar',
    		            stack: '总量',
    		            label: {
    		                normal: {
    		                    show: true,
    		                    position: 'insideRight'
    		                }
    		            },
    		            // data: [0, 2]
    		            data:${country}
    		        },
    		        {
    		            name: '省部级',
    		            type: 'bar',
    		            stack: '总量',
    		            label: {
    		                normal: {
    		                    show: true,
    		                    position: 'insideRight'
    		                }
    		            },
    		            data:${province}
    		        },
    		        {
    		            name: '市厅级',
    		            type: 'bar',
    		            stack: '总量',
    		            label: {
    		                normal: {
    		                    show: true,
    		                    position: 'insideRight'
    		                }
    		            },
    		            data:${city}
    		        },
    		        {
    		            name: '其它',
    		            type: 'bar',
    		            stack: '总量',
    		            label: {
    		                normal: {
    		                    show: true,
    		                    position: 'insideRight'
    		                }
    		            },
    		            data:${other}
    		        }
    		    ]
    		    /*
    		    ,
    		      toolbox: { //可视化的工具箱
	             show: true,
	             feature: {
	                
	                 saveAsImage: {//保存图片
	                     show: true
	                 },
	               
	                 myTool : {  
	                     show : true,  
	                     title : '详情',  
	                     icon : 'image://${contextPath}/static/proscenium/images/favicon.png',  
	                     onclick : function (){  
	                         alert("I do");
	                     }  
	                  } 
	             }
	         }*/
				
     };

     // 使用刚指定的配置项和数据显示图表。
     researchProject2.setOption(option6);
     
     //
    
     //按照从数据库中的次序排序div
      var orderArray="${order}".split(",");
     
     function customFunc(x,y){
    	    var xValue=$(x).attr("id") ;//<li valueByOrder="25"></li>
    	    var yValue=$(y).attr("id") ;
    	    for(var i=0;i<orderArray.length;i++){
    	    	if(orderArray[i]==xValue){
    	    		xValue=i;
    	    		break;
    	    	}
    	    		
    	    }
    	    for(var i=0;i<orderArray.length;i++){
    	    	if(orderArray[i]==yValue){
    	    		yValue=i;
    	    		break;
    	    	}
    	    		
    	    }
    	   if (xValue>yValue)
    	     return 1;
    	   else 
    	    return -1;
    	}
     
     var ts = new Array();
     $(".gridly").find(".brick").each(function (i, v) {                
         ts.push(v);                
     });
     ts.sort(customFunc); //数组的内部排序     
     $(".gridly").empty();
     for (var k = 0; k < ts.length; k++) {
        $(ts[k]).appendTo($(".gridly"));
     }
     
     
     $('.gridly').gridly({
    	    base: 493, // px 
    	    gutter: 20, // px
    	    columns: 1,
    	    callbacks: {
    			reordered: function ($elements) {
    				 
    				// Called after the drag and drop ends with the elements in their ending position.
    				// 当前对象
    				var currentObj = this.reordered.arguments[1];
    				var currentId = currentObj[0].id;
    				var arr = $elements;
    				// 前一个对象
    				var prevObj;
    				// 后一个对象
    				var afterObj;
    				
    				for (i = 0; i < arr.length; i++) {
    					if (arr[i].id == currentId) {
    						if (i > 0) {
    							prevObj = arr[i - 1];
    						}
    						if(i + 1 < arr.length){
    							afterObj = arr[i+1];
    						}
    					}
    				}
    				if(prevObj != undefined){
    					//alert('前一个对象：' + prevObj.id);
    				}
    				if(afterObj != undefined){
    					//alert('后一个对象：' + afterObj.id);
    				}
    			    var save=[];
    				for (i = 0; i < arr.length; i++) {    					
    					save.push($(arr[i]).attr("id"))    					
    				}
    				if  (orderArray==save.join(','))
    					return;
    				orderArray=save.join(',');
    				$.ajax({
    					type: "POST",
    					url: 'user/saveOrder.html',
    					data: {'order':save.join(',')},
    					dataType:'json',
    					cache: false,
    					success: function(data){    					
    						if(data.result=="ok"){
    							//showTip("提示","修改成功"); 
    							/*
    					    	showOneSecondDialog("提示","修改成功",1000);
    							*/
    						}else{
    							showTip("提示","修改失败");
    						}
    							
    						
    					},
    					error:function(){
    						 showTip("提示","修改失败(请检查网络)");
    						
    					}
    				});
    				
    				
    				 
    				//执行保存排序，更新数据
    				//sortData...
    			},
    			reordering:function($elements) {
    			      // Called before the drag and drop starts with the elements in their starting position.
    				 
    			    }
    		}
    	  });
});

</script>


