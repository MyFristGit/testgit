<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
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
				       <div  class="outline-itemText bh-str-cut">工资信息</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   
		   
		   <div  class="outline-item   " id="basicNav">		       
		        	   <div  class="outline-itemIndex">2</div>
				       <div  class="outline-itemText bh-str-cut">项目账信息</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   
		   <div  class="outline-item   " id="basicNav">		       
		        	   <div  class="outline-itemIndex">3</div>
				       <div  class="outline-itemText bh-str-cut">个人往来款</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">4</div>
		       <div  class="outline-itemText bh-str-cut">图书欠费</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">5</div>
		       <div  class="outline-itemText bh-str-cut">校园消费</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   
		   
		   
		  
		 
		   
		   
		</div>
		
		<div  class="basicInformationRight"   id="tab5Right">
		  
		
		     <div class="basic" >
		     
		     		<div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>工资信息</h3>
					  		</div>
					  		<div  class="pageWrap"     style="overflow:hidden;"  id="gzxxID">
					  		     <div  class="table  "   >
					  		     </div>
				  		    </div>	
				  		    <%  
					  		    	    try {  
					  		    	  		ArrayList  al=new  ArrayList<HashMap>();
							  		  		HashMap    hm=null;
							  		  		for(int  i=0;i<1;i++){
							  		  			hm=new  HashMap();
							  		  			hm.put("ND", "2017");
							  		  			hm.put("YF", "3");
							  		  			hm.put("JBGZ", "3593");
					  		  					hm.put("BT", "3134");
							  					hm.put("KK", "164");
							  					hm.put("SFJE", "test");
							  		  			//al.add(hm);
								  		  		hm=new  HashMap();
							  		  			hm.put("ND", "2017");
							  		  			hm.put("YF", "4");
							  		  			hm.put("JBGZ", "3593");
					  		  					hm.put("BT", "3334");
							  					hm.put("KK", "364");
							  					hm.put("SFJE", "test");
							  		  		//	al.add(hm);
							  		  		} 
					  		    	        request.setAttribute("gzxxInformation", al);  
					  		    	    } catch (Exception e) {  
					  		    	        request.setAttribute("result", "很抱歉，页面产生错误！");  
					  		    	    }  
					  		    	%> 
					  		    
				  		    <script>
						    
				  		    
					  		       $(function(){
						  		    	//修改
						  		      var gzxx_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'年度',name:'ND', width: 130, align:'center' },
								        { title:'月份',name:'YF', width: 130, align:'center' },
								        { title:'岗位工资',name:'JBGZ', width: 130, align:'center' },
								        { title:'补贴',name:'BT', width: 130, align:'center' },
								        { title:'基本绩效',name:'KK',width: 130, align:'center'},
								        { title:'应发合计',name:'KK',width: 130, align:'center'},
								        { title:'失业保险',name:'SFJE',width: 130, align:'center'},
								        { title:'公积金(个人)',name:'SFJE',width: 130, align:'center'},
								        { title:'医保缴费',name:'SFJE',width: 130, align:'center'},
								        { title:'应纳费所得额',name:'SFJE',width: 130, align:'center'},
								        { title:'会费',name:'SFJE',width: 130, align:'center'},
								        { title:'扣款合计',name:'SFJE',width: 130, align:'center'},
								        { title:'实发金额',name:'SFJE',width: 130, align:'center'},
								        { title:'公积金(单位)',name:'SFJE',width: 130, align:'center'},
								        { title:'扣款合计',name:'SFJE',width: 130, align:'center'},
								        { title:'实发金额',name:'SFJE',width: 130, align:'center'}
								        
								     ];
						  		        
						  		     	var gzxx_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${gzxxInformation}" var="wI"   varStatus="status">
											       	 {
											       		ND:'${wI.ND }',
											       		YF:'${wI.YF }',
											       		JBGZ:'${wI.JBGZ }',
											       		BT:'${wI.BT }',
											       		KK:'${wI.KK }',
											       		SFJE:'${wI.SFJE }'
											       		
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${gzxxInformation != null && fn:length(gzxxInformation)>0}">
												insertTable("gzxxID",gzxx_cols,gzxx_data,true,2300);
											</c:when>
											<c:otherwise>
												$("#gzxxID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>项目账信息</h3>
					  		</div>
					  		<div  class="pageWrap"     style="overflow:hidden;"  id="xmzxxID">
					  		     <div  class="table  "   >
					  		     </div>
				  		    </div>	
				  		    <%  
					  		    	    try {  
					  		    	  		ArrayList  al=new  ArrayList<HashMap>();
							  		  		HashMap    hm=null;
							  		  		for(int  i=0;i<1;i++){
							  		  			hm=new  HashMap();
							  		  			hm.put("BH", "2017111");
							  		  			hm.put("LX", "入款");
							  		  			hm.put("JE", "30000");
					  		  					hm.put("BLR", "test");
							  		  			//al.add(hm);
								  		  		hm=new  HashMap();
									  		  	hm.put("BH", "2017111");
							  		  			hm.put("LX", "出款");
							  		  			hm.put("JE", "1300");
					  		  					hm.put("BLR", "test");
							  		  			//al.add(hm);
							  		  		} 
					  		    	        request.setAttribute("xmzxxInformation", al);  
					  		    	    } catch (Exception e) {  
					  		    	        request.setAttribute("result", "很抱歉，页面产生错误！");  
					  		    	    }  
					  		    	%> 
					  		    
				  		    <script>
						    
				  		    
					  		       $(function(){
						  		    	//修改
						  		      var xmzxx_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'项目编号',name:'BH', width: 130, align:'center' },
								        { title:'类型',name:'LX', width: 130, align:'center' },
								        { title:'金额',name:'JE', width: 130, align:'center' },
								        { title:'办理人',name:'BLR', width: 130, align:'center' }
								        
								     ];
						  		        
						  		     	var xmzxx_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${xmzxxInformation}" var="wI"   varStatus="status">
											       	 {
											       		BH:'${wI.BH }',
											       		LX:'${wI.LX }',
											       		JE:'${wI.JE }',
											       		BLR:'${wI.BLR }'
											       		
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${xmzxxInformation != null && fn:length(xmzxxInformation)>0}">
												insertTable("xmzxxID",xmzxx_cols,xmzxx_data,false);
											</c:when>
											<c:otherwise>
												$("#xmzxxID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>个人往来款</h3>
					  		</div>
					  		<!-- height=33*行数+1（首行的上边边框）+统一留白33 
					  		
					  		
					  		-->
					  			<div  class="pageWrap   testContainer"   id="container5-exchange"  style="width:930px;height:100%;overflow:auto;">
					  		      <div  class="table  "   id="container5-exchange-table">
					  		      
					  		       <script>
					  		           
					  		         $(function(){
					  		        	/*
						  		    	  var tempStr=getTableLine([ ['操作',100,true],['凭证日期',130,true],['凭证编号',130,true],['摘要',,true]
							  		         
			  		       					,['借款金额',130,true],['还款金额',130,true],['借款余额',130,true]
			  		         			  ],true,1300,"#f6f6f6");
						  		    	  tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20161229',130],['07639',130],['冲水建姚汝方借检验费']
							  		         
			  		       					,['0',130],['15487',130],['0',130]	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20161128',130],['06989',130],['水建姚汝方借检验费']
						  		         
			  		       					,['100000',130],['0',130],['100000',130]	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20161124',130],['06294',130],['冲水建姚汝方借检验费']
						  		         
			  		       					,['0',130],['9720',130],['0',130]	],false,1300);
						  		    	 tempStr+= getTableLine([ ['<a class="viewDetail">查看</a>',100],['20161110',130],['02515',130],['水建姚汝方借检验费']
						  		         
			  		       					,['9720',130],['0',130],['9720',130]	],false,1300);
						  		    	 
						  		    	  
						  		    	  $("#container5-exchange-table").html(tempStr);
						  		    	  //滚动条范围宽度的修正
						  		    	  $("#container5-exchange-table>.line").css({"width":"1000px"});
						  		    	  //或者将line中的1300改为1000
						  		    	  
						  		    	  $("#container5-exchange").mCustomScrollbar({
								            	scrollButtons:{
								            		enable:true
								            	},
								            	autoHideScrollbar: false, 
								             	horizontalScroll:true
								            });
						  		    	   var  $willInsert=$(getPagination("personalExchangePagination","1-4","4"));
						  		    	//  var  $willInsert=$(getPagination("personalExchangePagination",4,1,4));
						  		    	   $willInsert.insertAfter($("#container5-exchange").closest(".pageWrap"));
						  		    	   $willInsert.css({"margin-left":"7px"});
						  		    	   
						  		    	//修改滚动条
							  		    	$("#personalExchangePagination   .itemPerPage").css({"display":"block"});
						  		         	$("#personalExchangePagination   .itemPerPage").mCustomScrollbar({
						  		                theme: "#004e90"
						  		            });
							  		    	$("#personalExchangePagination   .itemPerPage").css({"display":"none"});
							  		    	*/
							  		    	
							  		    	
								  		    	//将上边的代码改为后台获取
								  		           var cols_finance = [
										        {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
										            return '<a class="viewDetail">查看</a>';
										        }},
										        { title:'凭证日期',name:'date', width:130, align:'center' },
										        { title:'凭证编号',name:'number', width:180, align:'center'},
										        { title:'摘要',name:'summary', width:130 },
										        { title:'借款金额',name:'loan_amount', width:130 },
										        { title:'还款金额',name:'repayment_amount', width:130 },
										        { title:'借款余额', name:'loan_balance',width:130 }
										     ];
								  		        /*
								  		     	var items_finance =[
									  		        	     {
									  		        		   	date:'20161110',number:'07639',
									  		        		   	summary:'冲水建姚汝方借检验费',loan_amount:'0',
									  		        			repayment_amount:'15487',loan_balance:'0'
									  		        		 },
									  		        		{
										  		        		date:'20161128',number:'06989',
										  		        		summary:'水建姚汝方借检验费',loan_amount:'100000',
										  		        		repayment_amount:'0',loan_balance:'100000'
										  		        	},
									  		        		{
										  		        		date:'20161124',number:'06294',
										  		        		summary:'冲水建姚汝方借检验费',loan_amount:'0',
										  		        		repayment_amount:'9720',loan_balance:'0'
										  		        	},
									  		        		{
										  		        		date:'20161110',number:'02515',
										  		        		summary:'水建姚汝方借检验费',loan_amount:'9720',
										  		        		repayment_amount:'0',loan_balance:'9720'
										  		        	}
									  		        	];
								  		     	*/
								  		     	
								  		  	var items_finance =[
								  		  	           <c:forEach items="${financeInformation}" var="wI"   varStatus="status">
															 {
																 date:'${wI.date }',
																 number:'${wI.number }',
																 summary:'${wI.summary }',
																 loan_amount:'${wI.loan_amount }',
																 repayment_amount:'${wI.repayment_amount }',
																 loan_balance:'${wI.loan_balance }'
														     }
														    <c:if test="${status.last eq false}">,</c:if>	  					  		       
													    </c:forEach>              
								  		  	                    
								  		  	 ];
								  		     	
										  		
								  		 	 <c:choose>
												<c:when test="${financeInformation != null && fn:length(financeInformation)>0}">
													insertTable("container5-exchange",cols_finance,items_finance,true,1100);
									  		    	
									  		  	    insertPagination("container5-exchange","personalExchangePagination",
									  		  	    	${financeInformationTotal},1,10,'personalCenter/personalExchange.html'); 
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
										      //  { title:'交易地点',name:'JYDD' ,display:"none"}, 
										        { title:'交易金额',name:'JYJE',renderer: function(val,item,rowIndex){
										        	if(val===undefined)
										        		return "";
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
										    	   if(val===undefined)
										        		return "";
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

