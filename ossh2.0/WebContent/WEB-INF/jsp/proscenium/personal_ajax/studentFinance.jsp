<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

 <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>


		
<div style="min-width:1150px;">
	<div  class="basicInformationLeft"  id="fixLeft3">
		   <div  class="profile"   >
		        <%@ include file="../taskCenter_personalCenter_profile.jsp"%>
		   </div>
		   
		   <div  class="outline-item   outline-active" id="basicNav">		       
		        	   <div  class="outline-itemIndex">1</div>
				       <div  class="outline-itemText bh-str-cut">学费缴纳</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">2</div>
		       <div  class="outline-itemText bh-str-cut">资助发放</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">3</div>
		       <div  class="outline-itemText bh-str-cut">校园消费</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">4</div>
		       <div  class="outline-itemText bh-str-cut">图书欠费</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   
		 
		   
		   
		</div>
		
		<div  class="basicInformationRight"   id="tab3Right">
		  
		    
		  
		     <div class="basic" > 
		     
		     		<div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>学费缴纳</h3>
					  		</div>
					  		<div  class="pageWrap"    id="containerXFJN" style="overflow:hidden;">
					  		     <div  class="table  "   >
					  		      
					  		       <script>
					  		           
					  		         $(function(){
					  		        	
							  		     //将上边的代码改为后台获取
						  		           var research_project_cols = [
										        {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
										            return '<a class="viewDetail">查看</a>';
										        }},
										        { title:'收费年度',name:'SFQJDM' },
										        { title:'收费项目名称',name:'SFXMMC' },
										        { title:'应交金额',name:'YJJE', width: 130, align:'center' ,renderer: function(val,item,rowIndex){
										        	if(val.length>0  && val.substr(0,1)=="-"){
										        		val=val.substring(1);
										        	}
										        	if(typeof val=="undefined"  ||val.length==0){
										        		return "";
										        	}
										        	if(val.indexOf(".")!=(-1)){
										        		var  index=val.indexOf(".");
										        		val=val.substr(0,index);
										        	}
										            return  val;
										        } },
										      //  { title:'入校年度',name:'RXND',width: 130, align:'center'},
										    
										       // { title:'收费项目代码',name:'SFXMDM' }, 
										     
										        { title:'实缴金额', name:'SJJE' ,renderer: function(val,item,rowIndex){
										        	if(val.length>0  && val.substr(0,1)=="-"){
										        		val=val.substring(1);
										        	}
										        	if(typeof val=="undefined"  ||val.length==0){
										        		return "";
										        	}
										        	if(val.indexOf(".")!=(-1)){
										        		var  index=val.indexOf(".");
										        		val=val.substr(0,index);
										        		
										        	}
										            return  val;
										        } },
										        { title:'退费金额', name:'TFJE' ,renderer: function(val,item,rowIndex){
										        	if(val.length>0  && val.substr(0,1)=="-"){
										        		val=val.substring(1);
										        	}
										        	if(typeof val=="undefined"  ||val.length==0){
										        		return "";
										        	}
										        	if(val.indexOf(".")!=(-1)){
										        		var  index=val.indexOf(".");
										        		val=val.substr(0,index);
										        		
										        	}
										            return  val;
										        } }
										     ];
						  		         justGridWidth(research_project_cols);
						  		    	
						  		     	var research_project_data =[   	
	  							  		 	 <c:forEach items="${tuitionInformation}" var="wI"   varStatus="status">
	  								       	 {
	  								       		QFJE:'${wI.QFJE }',
	  								       		RXND:'${wI.RXND }',
	  								       		SFQJDM:'${wI.SFQJDM }',
	  								       		SFXMDM:'${wI.SFXMDM }',
	  								     		SFXMMC:'${wI.SFXMMC }',
	  								   			SJJE:'${wI.SJJE }',
	  								   			TFJE:'${wI.TFJE }',
	  								   			YJJE:'${wI.YJJE }'
	  							             }
	  				  		                 <c:if test="${status.last eq false}">,</c:if>	  					  		       
	  					  		   			 </c:forEach>
  					  		        	];	
						  		    	
						  		    
						  		      	
						  		 	 <c:choose>
										<c:when test="${tuitionInformation != null && fn:length(tuitionInformation)>0}">
											insertTable("containerXFJN",research_project_cols,research_project_data,false,1100);
							  		      	insertPagination("containerXFJN","xfjnPagination",
						  		  			 ${tuitionInformationTotal},1,10,'personalCenter/getTuition.html',function (){},function (){},
						  		  			 {width:930,topMargin:-19});
							  		      	
							  		      	
							  		      	
							  		 
							  		  	
							  		  	
										</c:when>
										<c:otherwise>
											$("#containerXFJN").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>资助发放</h3>
					  		</div>
					  		<div  class="pageWrap"     style="overflow:hidden;" id='zzffID'>
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
							  		  			hm.put("TYPE", "奖学金");
							  		  			
							  		  		
							  		  			hm.put("HJMS", "test");
							  		  			//al.add(hm);
							  		  		} 
									  		  	hm=new  HashMap();
							  		  			hm.put("HJSJ", "2015-07-17");
							  		  			hm.put("TYPE", "助学金");
							  		  			
							  		  		
							  		  			hm.put("HJMS", "test");
							  		  			//al.add(hm);
					  		    	        request.setAttribute("zzffInformation", al);  
					  		    	    } catch (Exception e) {  
					  		    	        request.setAttribute("result", "很抱歉，页面产生错误！");  
					  		    	    }  
					  		    	%> 
						  		    	//修改
						  		      var zzff_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'发放时间',name:'HJSJ', width: 130, align:'center' },
								        { title:'发放类型',name:'TYPE', width: 130, align:'center' },
								        { title:'发放金额',name:'HJMS',width: 130, align:'center'}
								        
								     ];
						  		        
						  		     	var zzff_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${zzffInformation}" var="wI"   varStatus="status">
											       	 {
											       		HJSJ:'${wI.HJSJ }',
											       		TYPE:'${wI.TYPE }',
											       		HJMS:'${wI.HJMS }'
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${zzffInformation != null && fn:length(zzffInformation)>0}">
												insertTable("zzffID",zzff_cols,zzff_data,false);
											</c:when>
											<c:otherwise>
												$("#zzffID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>校园消费</h3>
					  		</div>
					  		<div  class="pageWrap"    id="containerCampusConsumption" style="width:930px;overflow:hidden;">
					  		    <div  class="table  "   >
					  		      
					  		       <script>
					  		           
					  		         $(function(){
					  		        	
							  		     //将上边的代码改为后台获取
						  		           var campus_consumption_cols = [
										        {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
										            return '<a class="viewDetail">查看</a>';
										        }},
										      //  { title:'卡号',name:'KH', width: 130, align:'center' },
										        { title:'交易日期',name:'JYRQ',width: 130, align:'center'},
										        { title:'交易时间',name:'JYSJ' },
										     //   { title:'交易地点',name:'JYDD' ,display:"none"}, 
										        { title:'交易金额',name:'JYJE',renderer: function(val,item,rowIndex){
										        	if(val===undefined){
										        		return "";
										        	}
										        	if(val.length>0  && val.substr(0,1)=="-"){
										        		val=val.substring(1);
										        	}
										        	if(typeof val=="undefined"  ||val.length==0){
										        		return "";
										        	}
										        	if(val.indexOf(".")!=(-1)){
										        		var  index=val.indexOf(".");
										        		val=val.substr(0,index);
										        	}
										        	var  yuan=parseFloat(val);
										        	yuan=yuan/100;
										        	val=yuan.toFixed(2)+"";
										            return  val;
										        } },
										       { title:'交易余额', name:'JYYE',renderer: function(val,item,rowIndex){
										    	   if(val===undefined){
										        		return "";
										        	}
										    	   if(val.length>0  && val.substr(0,1)=="-"){
										        		val=val.substring(1);
										        	}
										        	if(typeof val=="undefined"  ||val.length==0){
										        		return "";
										        	}
										        	if(val.indexOf(".")!=(-1)){
										        		var  index=val.indexOf(".");
										        		val=val.substr(0,index);
										        		
										        	}
										        	var  yuan=parseFloat(val);
										        	yuan=yuan/100;
										        	val=yuan.toFixed(2)+"";
										            return  val;
										        }  }//,
										      //  { title:'商户代码', name:'SHDM'show },
										      //  { title:'终端机号', name:'ZDJH' },
										       // { title:'交易流水号', name:'JYLSH' }
										     ];
						  		      
						  		         justGridWidth(campus_consumption_cols);
						  		     	var campus_consumption_data =[   	
	  							  		 	 <c:forEach items="${campusConsumptionInformation}" var="wI"   varStatus="status">
	  								       	 {
	  								       		KH:'${wI.KH }',
	  								       		JYRQ:'${wI.JYRQ }',
	  								       		JYSJ:'${wI.JYSJ }',
	  								       		JYDD:'${wI.JYDD }',
	  								      		JYJE:'${wI.JYJE }',
	  								    		JYYE:'${wI.JYYE }',
	  								    		SHDM:'${wI.SHDM }',
	  								    		ZDJH:'${wI.ZDJH }',
	  								    		JYLSH:'${wI.JYLSH }'
	  							             }
	  				  		                 <c:if test="${status.last eq false}">,</c:if>	  					  		       
	  					  		   			 </c:forEach>
  					  		        	];	
						  		    	
						  		    
						  		      	
						  		 	 <c:choose>
										<c:when test="${campusConsumptionInformation != null && fn:length(campusConsumptionInformation)>0}">
											insertTable("containerCampusConsumption",campus_consumption_cols,campus_consumption_data,false);//1600);
							  		      	insertPagination("containerCampusConsumption","campusConsumptionPagination",
						  		  			 ${campusConsumptionInformationTotal},1,10,'personalCenter/getCampusConsumption.html',function (){},function (){},
						  		  			 {width:930,topMargin:-19});
										</c:when>
										<c:otherwise>
											$("#containerCampusConsumption").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>图书欠费</h3>
					  		</div>
					  		<div  class="pageWrap"   id="containerBooks_arrearage"  style="width:930px;overflow:hidden;">
					  		     <div  class="table  "   >
					  		      
					  		       <script>
					  		           
					  		         $(function(){
					  		        	
							  		     //将上边的代码改为后台获取
						  		           var books_arrearage_cols = [
										        {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
										            return '<a class="viewDetail">查看</a>';
										        }},										   
										        { title:'欠费处理日期',name:'QFCLRQ',width: 130, align:'center'},
										        { title:'题名',name:'TM' },
										        { title:'应罚金额',name:'YFJE' }, 
										        { title:'实罚金额',name:'SYJE',renderer: function(val,item,rowIndex){
										        	if(val.length>0  && val.substr(0,1)=="-"){
										        		val=val.substring(1);
										        	}
										            return  val;
										        } }
										     ];
						  		         justGridWidth(books_arrearage_cols);
						  		    	
						  		     	var  books_arrearage_data =[   	
	  							  		 	 <c:forEach items="${books_arrearageInformation}" var="wI"   varStatus="status">
	  								       	 {
	  								       		QFCLRQ:'${wI.QFCLRQ }',
	  								       		TM:'${wI.TM }',
	  								     		YFJE:'${wI.YFJE }',
	  								    		SYJE:'${wI.SYJE }'
	  							             }
	  				  		                 <c:if test="${status.last eq false}">,</c:if>	  					  		       
	  					  		   			 </c:forEach>
  					  		        	];	
						  		    	
						  		    
						  		      	
						  		 	 <c:choose>
										<c:when test="${books_arrearageInformation != null && fn:length(books_arrearageInformation)>0}">
											insertTable("containerBooks_arrearage",books_arrearage_cols,books_arrearage_data,false);//1600);
							  		      	insertPagination("containerBooks_arrearage","books_arrearagePagination",
						  		  			 ${books_arrearageInformationTotal},1,10,'personalCenter/getBooks_arrearage.html',function (){},function (){},
						  		  			 {width:930,topMargin:-19});
										</c:when>
										<c:otherwise>
											$("#containerBooks_arrearage").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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

