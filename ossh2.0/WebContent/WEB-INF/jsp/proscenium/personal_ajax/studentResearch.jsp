<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@taglib uri="http://bangxue.com/grid" prefix="mmt" %>
 <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<script>
 if(!${Login}){
	 window.location="findex.html";
 }else{
 } 
 </script>

	
<div style="min-width:1150px;">
	<div  class="basicInformationLeft"  id="fixLeft5">
		   <div  class="profile"   >
		        <%@ include file="../taskCenter_personalCenter_profile.jsp"%>
		   </div>
		   
		   <div  class="outline-item   outline-active" id="basicNav">		       
		        	   <div  class="outline-itemIndex">1</div>
				       <div  class="outline-itemText bh-str-cut">科研项目</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   
		   
		   <div  class="outline-item   " id="basicNav">		       
		        	   <div  class="outline-itemIndex">2</div>
				       <div  class="outline-itemText bh-str-cut">科研论文</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   
		   <div  class="outline-item   " id="basicNav">		       
		        	   <div  class="outline-itemIndex">3</div>
				       <div  class="outline-itemText bh-str-cut">科研专利</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   <div  class="outline-item   " id="basicNav">		       
		        	   <div  class="outline-itemIndex">4</div>
				       <div  class="outline-itemText bh-str-cut">书籍著作权</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   <div  class="outline-item   " id="basicNav">		       
		        	   <div  class="outline-itemIndex">5</div>
				       <div  class="outline-itemText bh-str-cut">软件著作权</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   
		   
		  
		 
		   
		   
		</div>
		
		<div  class="basicInformationRight"   id="tab5Right">
		  
		
		     <div class="basic" >
		     
		     		<div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>科研项目</h3>
					  		</div>
					  		<div  class="pageWrap"    id="test1Container"   style="width:930px;height:100%;overflow:hidden;">
					  		      <div  class="table  "   id="test1">
					  		      
					  		       <script>
					  		           
					  		         $(function(){
					  		        	
							  		     //将上边的代码改为后台获取
						  		       
							  		     
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
					  		<!-- height=33*行数+1（首行的上边边框）+统一留白33 
					  		
					  		
					  		-->
					  			<div  class="pageWrap   testContainer"   id="container5-exchange"  style="width:930px;height:100%;overflow:hidden;">
					  		      <div  class="table  "   id="container5-exchange-table">
					  		      
					  		      
					  		       <script>
					  		           
					  		         $(function(){
					  		        	
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
											    insertTable("container5-exchange",research_patent_cols,research_patent_data,false);
								  		      	insertPagination("container5-exchange","zlIdProjectPagination",
							  		  			 ${zlInformationTotal},1,10,'personalCenter/zlProject.html',function (){},function (){},
							  		  			 {width:930,topMargin:-19});
											    </c:when>
											<c:otherwise>
											     $("#container5-exchange").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  		<div  class="pageWrap"     style="overflow:hidden;"   id="sjzzqID">
					  		    <div  class="table  "   >
					  		    </div>
				  		    </div>
				  		     
					  		    
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
					  		<div  class="pageWrap"     style="overflow:hidden;"  id="rjzzqID">
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
				     
				     
				     
				     
				     
				    
				  	 
		     </div>
		</div>
</div>	
<!-- 
<div  id="informationChange"  style="position:fixed;top:350px;right:10px;" >
	<a  href="javascript:void(0);" >
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
	  var  leftId="fixLeft5";
	  var  rightId="tab5Right";
	  var  contentIdPrev="content5";
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
		  
		 // $('html,body').animate({scrollTop:$('#'+contentIdPrev+index).offset().top},800);	
		 // setTimeout(function(){activeLeft3(index);},850);
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
		$("#myDiv5").html($("#myDiv").html());
	  
	
	
});

</script>

