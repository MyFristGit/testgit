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
	<div  class="basicInformationLeft"  id="fixLeft6">
		   <div  class="profile"   >
		        <img src="./static/proscenium/images/person2.jpg"  width="80px" height="120px"/>
		        <div  class="profile-content"  id="myDiv6">
		             
		        </div>
		   </div>
		   
		   <div  class="outline-item   outline-active" id="basicNav">		       
		        	   <div  class="outline-itemIndex">1</div>
				       <div  class="outline-itemText bh-str-cut">体检指标结果</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		  
		 
		   
		   
		</div>
		
		<div  class="basicInformationRight"   id="tab6Right">
		  
		   
		    
		     <div class="basic" > 
		     
		     		<div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>体检指标结果</h3>
					  		</div>
					  		<!-- height=33*行数+1（首行的上边边框）+统一留白33 
					  		
					  		
					  		-->
					  			<div  class="pageWrap   testContainer"   id="container6-physicExamination"  style="width:930px;height:380px;overflow:auto;">
					  		      <div  class="table  "   id="container6-physicExamination-table">
					  		       <script>
					  		  
					  		   var  maxLineLength=1600;
			  		        	 var  titleBackgroundColor="#f6f6f6";
			  		        	  var cols = [
							        {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
							            return '<a class="viewDetail">查看</a>';
							        }},
							        { title:'体检日期',name:'date', width:130, align:'center' },
							        { title:'体检类别',name:'category', width:180, align:'center'},
							        { title:'体检编号',name:'number', width:130 },
							        { title:'体检科室',name:'department', width:130 },
							        { title:'体检项目',name:'project', width:130 },
							        { title:'检查时间', name:'time',width:130 },
							        { title:'检查人', name:'examiner',width:130 },
							        { title:'检查指标',name:'index', width:130 },
							        { title:'结果',name:'result', width:130 }
							     ];
			  		        	 /*
			  		        	var items =[
					  		        	     {
					  		        		   date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
					  		        		   project:'心电图',time:'2015-05-26',
					  		        		   examiner:'刘天云',index:'心率',result:'88'
					  		        		 },
					  		        		 {
					  		        			  date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
						  		        		   project:'心电图',time:'2015-05-26',
						  		        		   examiner:'刘天云',index:'ST段 ',result:'未见偏移'
						  		        	 },
					  		        		 {
					  		        			  date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
						  		        		   project:'心电图',time:'2015-05-26',
						  		        		   examiner:'刘天云',index:'T波 ',result:'未见异常'
						  		        	 },
					  		        		 {
					  		        			  date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
						  		        		   project:'心电图',time:'2015-05-26',
						  		        		   examiner:'刘天云',index:'P波',result:'未见异常'
						  		        	 },
					  		        		 {
					  		        			  date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
						  		        		   project:'心电图',time:'2015-05-26',
						  		        		   examiner:'刘天云',index:'P-R间期',result:'未见异常'
						  		        	 },
					  		        		 {
					  		        			  date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
						  		        		   project:'心电图',time:'2015-05-26',
						  		        		   examiner:'刘天云',index:'QRS时间',result:'未见异常'
						  		        	 },
					  		        		 {
					  		        			  date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
						  		        		   project:'心电图',time:'2015-05-26',
						  		        		   examiner:'刘天云',index:'QRS',result:'未见异常'
						  		        	 },
					  		        		 {
					  		        			  date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
						  		        		   project:'心电图',time:'2015-05-26',
						  		        		   examiner:'刘天云',index:'Q-T间期',result:'未见异常'
						  		        	 },
					  		        		 {
					  		        			  date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
						  		        		   project:'心电图',time:'2015-05-26',
						  		        		   examiner:'刘天云',index:'传导',result:'未见异常'
						  		        	 },
					  		        		 {
					  		        			  date:'2015-04-17',category:'西安科技大学医职工团体体检',number:'150417000179',department:'心电图室',
						  		        		   project:'心电图',time:'2015-05-26',
						  		        		   examiner:'刘天云',index:'电轴',result:'未见异常'
						  		        	 }
						  		        	 
				  		        	 
				  		        	   ];
			  		        
			  		        	     */
			  		        	   var items =[
			  		        	      <c:forEach items="${healthInformation}" var="wI"   varStatus="status">
											 {
												 date:'${wI.date }',
												 category:'${wI.category }',
												 number:'${wI.number }',
												 department:'${wI.department }',
												 project:'${wI.project }',
												 time:'${wI.time }',
												 examiner:'${wI.time }',
												 index:'${wI.time }',
												 result:'${wI.time }'
										     }
										    <c:if test="${status.last eq false}">,</c:if>	  					  		       
									    </c:forEach> 			  		        	               
			  		        	    ];
			  		        	      
			  		        	 //
			  		        	 
			  		        	 
					  		           
					  		         $(function(){
					  		        	 //数据改为json
					  		        	/*
						  		    	  var tempStr=getTableLine([ ['操作',100,true],['体检日期',130,true],['体检类别',180,true],['体检编号',,true]
							  		         
			  		       					,['体检科室',130,true],['体检项目',130,true],['检查时间',130,true],['检查人',130,true],['检查指标',130,true],['结果',130,true]	 ],true,1600,"#f6f6f6");
						  		    	  
					  		        	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']							  		         
			  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['心率 ',130],['88 ',130]	],false,1600);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']						  		         
			  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['ST段 ',130],['未见偏移 ',130]	],false,1600);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']						  		         
			  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['T波 ',130],['未见异常 ',130]	],false,1600);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']						  		         
			  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['P波 ',130],['未见异常 ',130]	],false,1600);
						  		    	tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']						  		         
		  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['P-R间期 ',130],['未见异常 ',130]	],false,1600);
						  		    	tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']						  		         
		  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['QRS时间 ',130],['未见异常 ',130]	],false,1600);
						  		    	tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']						  		         
		  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['QRS ',130],['未见异常 ',130]	],false,1600);
						  		    	tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']						  		         
		  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['Q-T间期 ',130],['未见异常 ',130]	],false,1600);
						  		    	tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']						  		         
		  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['传导 ',130],['未见异常 ',130]],false,1600);
						  		    	
						  		    	tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['2015-04-17',130],['西安科技大学医职工团体体检',180],['150417000179']						  		         
		  		       					,['心电图室',130],['心电图',130],['2015-05-26 ',130],['刘天云 ',130],['电轴 ',130],['正常 ',130]],false,1600);
						  		    	 */
						  		    	  
						  		    	
						  		    	
						  		    	
						  		    	
						  		    	 <c:choose>
											<c:when test="${healthInformation != null && fn:length(healthInformation)>0}">
												insertTable("container6-physicExamination",cols,items);
								  		    	insertPagination("container6-physicExamination","physicaExaminationPagination",
								  		    			${healthInformationTotal},1,10,'personalCenter/getHealth.html');
											</c:when>
											<c:otherwise>
												$("#container6-physicExamination").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
<div  id="informationChange"  style="position:fixed;top:350px;right:10px;" >
	<a  href="javascript:void(0);"  >
	   <img src="./static/proscenium/images/informationChange.png"     class="anim_image"
	      style="width: 35px;height: 35px;" />
	   <div  style="text-align: center; margin-top: 10px;">
		   信息变更
		</div>
	</a>
</div>

<script>
$(function(){
	  //为了复制时修改方便
	  var  leftId="fixLeft6";
	  var  rightId="tab6Right";
	  var  contentIdPrev="content6";
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
		 $outline3=$("#"+leftId+"  .outline-item");;
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
		$("#myDiv6").html($("#myDiv").html());
		
	  
	
	
});

</script>

