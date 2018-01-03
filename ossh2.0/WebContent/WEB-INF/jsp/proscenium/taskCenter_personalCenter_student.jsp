<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>



  <script>
  /*根据出生日期算出年龄*/  
  function jsGetAge(strBirthday){ 
	  if(strBirthday == ""  ||   strBirthday === undefined){
		  return "";
	  }
      var returnAge;  
      var strBirthdayArr=strBirthday.split("-");  
      var birthYear = strBirthdayArr[0];  
      var birthMonth = strBirthdayArr[1];  
      var birthDay = strBirthdayArr[2];  
        
      d = new Date();  
      var nowYear = d.getFullYear();  
      var nowMonth = d.getMonth() + 1;  
      var nowDay = d.getDate();  
        
      if(nowYear == birthYear){  
          returnAge = 0;//同年 则为0岁  
      }  
      else{  
          var ageDiff = nowYear - birthYear ; //年之差  
          if(ageDiff > 0){  
              if(nowMonth == birthMonth) {  
                  var dayDiff = nowDay - birthDay;//日之差  
                  if(dayDiff < 0)  
                  {  
                      returnAge = ageDiff - 1;  
                  }  
                  else  
                  {  
                      returnAge = ageDiff ;  
                  }  
              }  
              else  
              {  
                  var monthDiff = nowMonth - birthMonth;//月之差  
                  if(monthDiff < 0)  
                  {  
                      returnAge = ageDiff - 1;  
                  }  
                  else  
                  {  
                      returnAge = ageDiff ;  
                  }  
              }  
          }  
          else  
          {  
              returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天  
          }  
      }  
        
      return returnAge;//返回周岁年龄  
        
  }  
  
  
  $(function(){
	  $(".coleArrow").click(
			   function(){
			    	$(this).toggleClass('arrowUp');
			    	$(this).toggleClass('arrowDown');
			    	$(this).closest(".cole").find(".detail").toggle(100);
			    	setTimeout(function(){updateRecord();},150);
			    	
			    }
			);
	  
	  
	  $(".cole:even  ").addClass("coleDeep");
	 // $(".cole:odd  ").addClass("coleDeep");
	 
	 function chageOrderInServer(id,idOrder,otherId,otherIdOrder){
		 $.ajax({
				type: "POST",
							url: 'changeLearningOrder.html',
					    	data: {'id':id,'idOrder':idOrder,'otherId':otherId,'otherIdOrder':otherIdOrder},
							dataType:'json',
							cache: false,
							success: function(data){
							}
		 	});
	 }
	 	
	 //上移一位
	 $(".cole  .btn_a1").click(function(){
		 var  coleTarget=$(this).closest(".cole");
		  //保存到数据库
		  //交换order
		  var tempOrder=coleTarget.attr("order");
		  coleTarget.attr("order",coleTarget.prev().attr("order"));
		  coleTarget.prev().attr("order",tempOrder);
		 chageOrderInServer(coleTarget.attr("id"),coleTarget.attr("order"),coleTarget.prev().attr("id"),
				 coleTarget.prev().attr("order"));
		 if(coleTarget.prev().size()>0){
			 coleTarget.prev().before(coleTarget);
		 }
		 $(".coleDeep").removeClass("coleDeep");
		  $(".cole:even  ").addClass("coleDeep");
		
		  
	 });
	 
	 //下移一位
	 $(".cole  .btn_a2").click(function(){
		 var  coleTarget=$(this).closest(".cole");
		  //保存到数据库
		  //交换order
		  var tempOrder=coleTarget.attr("order");
		  coleTarget.attr("order",coleTarget.next().attr("order"));
		  coleTarget.next().attr("order",tempOrder);
		  chageOrderInServer(coleTarget.attr("id"),coleTarget.attr("order"),coleTarget.next().attr("id"),
					 coleTarget.next().attr("order"));
		  
		 if(coleTarget.next().size()>0){
			 coleTarget.next().after(coleTarget);
		 }
		 $(".coleDeep").removeClass("coleDeep");
		  $(".cole:even  ").addClass("coleDeep");
	 });
	 
	
    });
  </script>
  
  
  
<style>

.myData {
    padding:  0;
    margin-bottom: 20px;
}
.content {
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
    background: url(${contextPath}/static/proscenium/images/amendBtn.jpg) no-repeat;
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
    background: url(${contextPath}/static/proscenium/images/arr_down.png) no-repeat 7px 32px;
    cursor: pointer;
    margin-right: 100px;
}
.detail {
    padding: 0px 14px 16px 42px;
    overflow: hidden;
    display: none;
}

i.arrowUp {
    background: url(${contextPath}/static/proscenium/images/arr_up.png) no-repeat 7px 32px;
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
    background: url(${contextPath}/static/proscenium/images/up.png) no-repeat;
    cursor: pointer;
    display:none;
}

.coleBtn .btn_a2{
  display: block;
    float: left;
    width: 32px;
    height: 30px;
   background: url(${contextPath}/static/proscenium/images/down.png) no-repeat;
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
margin-bottom:20px;
max-width:930px;
}

.showDiv2 .table .line {
    width: 624px;
    margin-left: -15px;
}

</style>
	
<div style="min-width:1150px;">
		
		<div  class="basicInformationLeft"  id="fixLeft">
		   <div  class="profile"   >
		       <!-- 
		        <img src="${contextPath}/static/proscenium/images/person2.jpg"  width="80px" height="120px"/>
		         -->
		        	<%@ include file="taskCenter_personalCenter_profile.jsp"%>
		   </div>
		   
		   <div  class="outline-item   outline-active" id="basicNav">		       
		        	   <div  class="outline-itemIndex">1</div>
				       <div  class="outline-itemText bh-str-cut">基本信息</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		  
		  
		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">3</div>
		       <div  class="outline-itemText bh-str-cut">通讯信息</div>
		       <div  class="outline-itemCount"></div>
		   </div>		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">4</div>
		       <div  class="outline-itemText bh-str-cut">学习经历</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">5</div>
		       <div  class="outline-itemText bh-str-cut">家庭成员</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">6</div>
		       <div  class="outline-itemText bh-str-cut">工作经历</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		
		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">7</div>
		       <div  class="outline-itemText bh-str-cut">其它</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   
		</div>
		
		
	
		<div  class="basicInformationRight">
		     <div class="basic" style="">  
				    <div  class="content  myData"  id="content0" >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>基本信息</h3>
					  		</div>
					  		<div  class="pageWrap"  style="overflow:hidden;">
					  		      <div  class="table  notOne">
					  		      <script>
					  		   function   xjztStateChange(text){
					  			   switch(text){
					  			   case  "0":
					  				   return  "正常";
					  				   break;
					  			   case  "1":
					  				 return  "复学";
					  				   break;
					  			   case  "2":
					  				 return  "停学";
					  				   break;
					  			 case  "3":
					  				 return  "休学";
					  				   break;
					  			
					  			 case  "4":
					  				 return  "转学";
					  				   break;
					  			 case  "6":
					  				 return  "毕业";
					  				   break;
					  			 case  "7":
					  				 return  "取消学籍";
					  				   break;
					  			case  "8":
					  				 return  "转博";
					  				   break;
					  			case  "9":
					  				 return  "超期";
					  				   break;
					  		    default:
					  		    	return text;
					  			   	   
					  			   }
					  		    	
					  		    }
							  		 document.write(getLine([ ['学号','${userId}'],['姓名','${studentInformation == null ? '': studentInformation.XM}'],
							  		                          ['姓名拼音','${studentInformation == null ? '': studentInformation.XMPY}'] ],true));
							  		 document.write( getLine([ ['年龄',jsGetAge('${studentInformation == null ? '': studentInformation.CSRQ}')],
							  		                   //        ['出生地','${studentInformation == null ? '': studentInformation.CSDDM}'],
							  		                   //        ['籍贯','${studentInformation == null ? '': studentInformation.JGDM}'] ]));
							  		                              ['学生类别','${studentInformation == null ? '': studentInformation.XSLBDM}'],
									  		                          ['学籍状态',xjztStateChange('${studentInformation == null ? '': studentInformation.XJZTDM}')] ]));
							  		 document.write( getLine([ ['何省市报考','${studentInformation == null ? '': studentInformation.HSSBKDM}'],
							  		                           ['民族','${studentInformation == null ? '': studentInformation.MZDM}'],
							  		                           ['入学日期','${studentInformation == null ? '': studentInformation.RXRQ}'] ]));
							  		 document.write( getLine([ ['身份证件号','${studentInformation == null ? '': studentInformation.SFZJH}'],
							  		                          // ['港澳台侨','${studentInformation == null ? '': studentInformation.GATQDM}'],
							  		                          // ['生源地','${studentInformation == null ? '': studentInformation.SYDDM}'] ]));
							  		                       ['学生类别','${studentInformation == null ? '': studentInformation.XSLBDM}'],
								  		                          ['院系','${studentInformation == null ? '': studentInformation.DWDM}'] ]));
							  	//	 document.write( getLine([ ['专业','${studentInformation == null ? '': studentInformation.ZYDM}'],
							  		                      //     ['英文名','${studentInformation == null ? '': studentInformation.YWM}'],
							  		                       //    ['院系','${studentInformation == null ? '': studentInformation.DWDM}'] ]));
							  		//	 document.write( getLine([ ['专业','${studentInformation == null ? '': studentInformation.ZYDM}'],
							  		//                           ['学制','${studentInformation == null ? '': studentInformation.XZDM}'],
							  		//                           ['院系','${studentInformation == null ? '': studentInformation.DWDM}'] ]));
							  	//	 document.write( getLine([ ['学生类别','${studentInformation == null ? '': studentInformation.XSLBDM}'],
							  		                  //         ['学籍状态',xjztStateChange('${studentInformation == null ? '': studentInformation.XJZTDM}')],
							  		                  //         ['学制','${studentInformation == null ? '': studentInformation.XZDM}'] ]));
							  		
						  		//	showLine([ ['宿舍号','${qualificationInformation.workers_technical_date}'],['','','none'],['','','none'] ]);
							  	     
							  	     
							  	     
							  	     $(function(){
							  			 //因为全局的on,不能传递envet事件，导致一开始提示框移动不能显示，改为一旦页面加载就手工触发绑定函数
							  			 //内部有data,防止多次绑定后的重复处理。
							  			$(".line .lineUnit  .labelValue").tipsStaticTwo();
							  		 });
					  		      </script>
					  		     
					  		         <style>
					  		        
									
					  		         </style>
					  		         
					  		         <script>
					  		         
					  		         /*给分页写入下拉展开效果*/
					  		         
					  		     
					  		         
					  		        $(function(){
					  		        	$("#test1").css({"display":"block"});
						  		          $("#test1").mCustomScrollbar({
						  		                theme: "#004e90"
						  		           });
						  		    	$("#test1").css({"display":"none"});
					  		        }); 
					  		       
					  		         
					  		         </script>
					  		         

					  		    
					  		         
					  		           <style>
					  		           .pageList{
					  		              height: 24px; top: 0px; left: 0px;position:relative;
					  		           }
					  		            .pageListSpan{
					  		            box-sizing:border-box;
					  		            background-clip:border-box;
					  		            display: block; visibility: inherit; width: 43px;padding-left:10px;
					  		            }
					  		         .pageListSpan:hover{
					  		          background: #D3F4F8;
    									cursor: pointer;
					  		         }
					  		         
					  		         
					  		        
					  		         </style>
					  		       
					  		         
					  		        
					  		      
					  		      </div>
					  		</div>
				  		</div>
				  	</div>
				  	
				 
				  	
				  
				   <div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>通讯信息</h3>
					  		</div>
					  		<div  class="pageWrap"  style="overflow:hidden;">
					  		      <div  class="table  notOne">
					  		      <script>
					  		      
					  		      
					  		    showLine([ ['有效通信地址','${userInformation.valid_address}'],['电子信箱','${userInformation.email}'],['手机','${userInformation.mobile}'] ],true);
					  		    
					  		    
					  		    //showLine([ ['有效通信地址','${userInformation.valid_address}'],['有效邮政编码','${userInformation.zip_code}'],['手机','${userInformation.mobile}'] ],true);
					  		   // showLine([ ['办公联系电话','${userInformation.office_phone}'],['电子信箱','${userInformation.email}'],['家庭电话','${userInformation.home_phone}'] ]);
					  		    //showLine([ ['紧急联系人姓名','${userInformation.emergency_contact_name}'],['紧急联系人电话','${userInformation.emergency_contact_phone}'],[' ',' ','none'] ]);
					  		      </script>					  		    
					  		      </div>
					  		</div>
				  		</div>
				  	</div>
				  	
				  	 
				     <div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>学习经历</h3>
					  		</div>
					  		<div  class="pageWrap   testContainer"     style="width:930px; height:100%;overflow:auto;" id="studyExperienceContainer">
					  		      <div  class="table  notOne">
					  		      
					  		           <script>
					  		         
					  		      </script>	
					  		        
					  		     </div>
				  		    </div>
				  		     <script>
						    
				  		       //修改滚动条
					  		       $(function(){
					  		    	
						  		    	
						  		    	//修改
						  		      var study_experience_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'入学年月',name:'start_date', width: 130, align:'center' },
								        { title:'毕业年月',name:'end_date',width: 130, align:'center'},
								        { title:'毕肄业学校或单位',name:'name_unit' },
								        { title:'所学专业',name:'major' },
								        { title:'学历',name:'education' },
								        { title:'学位',name:'degree' }
								        
								        
								     ];
						  		        
						  		     	var study_experience_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${studyInformation}" var="wI"   varStatus="status">
											       	 {
										            	  start_date:'${wI.start_date }',
										            	  end_date:'${wI.end_date }',
								  		        	      name_unit:'${wI.name_unit }',
									  		        	    major:'${wI.major }',
								  		        	    	education:'${wI.education }',
								  		        	    	degree:'${wI.degree }'
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${studyInformation != null && fn:length(studyInformation)>0}">
												insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
											</c:when>
											<c:otherwise>
												$("#studyExperienceContainer").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
					  			 <h3>家庭成员</h3>
					  		</div>
					  		<div  class="pageWrap"     style="overflow:hidden;"   id="jtcyID">
					  		    <div  class="table  notOne">
					  		    </div>
				  		    </div>
				  		    <script>
						    
				  		       //修改滚动条
					  		       $(function(){
					  		    	
						  		    	
						  		    	//修改
						  		      var jtgx_cols = [
										 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
								            return '<a class="viewDetail">查看</a>';
								        }},
								        { title:'关系姓名',name:'QJXM', width: 130, align:'center' },
								        { title:'关系',name:'GX',width: 130, align:'center'},
								        { title:'身份证号',name:'SFZH' }
								        
								     ];
						  		    justGridWidth(jtgx_cols);
						  		     	var jtgx_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${jtgxInformation}" var="wI"   varStatus="status">
											       	 {
											       		QJXM:'${wI.QJXM }',
											       		GX:'${wI.GX }',
											       		SFZH:'${wI.SFZH }'
										             }
							  		                 <c:if test="${status.last eq false}">,</c:if>
								  		       
								  		   		 </c:forEach>                       
							  		        	     				  		        
								  		        ];	
						  		     	
						  		     		//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
						  		            
						  		     	<c:choose>
											<c:when test="${jtgxInformation != null && fn:length(jtgxInformation)>0}">
												insertTable("jtcyID",jtgx_cols,jtgx_data,false);
											</c:when>
											<c:otherwise>
												$("#jtcyID").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
												//insertTable("studyExperienceContainer",study_experience_cols,study_experience_data,true,1200);
											</c:otherwise>
										 </c:choose>  		    
													  		     		
					  		       });
						     </script>
				     	</div>
				     </div>
				  	
				  	
				  
				  	
				  	<div  class="content  myData"  id="content1" >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>工作经历</h3>
					  		</div>
					  		<div  class="pageWrap"     style="overflow:hidden;"   id="workExperienceContainer">
					  		      <div  class="table  notOne">
					  		      
					  		           <script>
					  		      
					  		       //修改滚动条
					  		       $(function(){
					  		    	
							  		    
							  		           var work_experience_cols = [
									        {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
									            return '<a class="viewDetail">查看</a>';
									        }},
									        { title:'起始年月',name:'start_date', width: 130, align:'center' },
									        { title:'截止年月',name:'end_date',width: 130, align:'center'},
									        { title:'所在单位名称',name:'name_unit',width:200 },
									        { title:'从事工作内容',name:'work_content' ,width:350}
									     ];
							  		         justGridWidth(work_experience_cols);
							  		       
							  		     	var work_experience_data =[
							  		    
								       	   
								       	 <c:forEach items="${workInformation}" var="wI"   varStatus="status">
										       	 {
									            	  start_date:'${wI.start_date }',
									            	  end_date:'${wI.end_date }',
							  		        	      name_unit:'${wI.name_unit }',
							  		        	      work_content:'${wI.work_content }'
									             }
						  		                 <c:if test="${status.last eq false}">,</c:if>
						  		       
						  		   		 </c:forEach>
						  		    
								       	  ];
							  		     	
							  		     	
							  		     	
							  		     	<c:choose>
												<c:when test="${workInformation != null && fn:length(workInformation)>0}">
													insertTable("workExperienceContainer",work_experience_cols,work_experience_data,false);
												</c:when>
												<c:otherwise>
													$("#workExperienceContainer").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
													//insertTable("workExperienceContainer",work_experience_cols,work_experience_data,false);
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
					  			 <h3>其它</h3>
					  		</div>
					  		<div  class="pageWrap"  style="overflow:hidden;">
					  		      <div  class="table  notOne">
					  		      <script>
					  		    showLine([ ['身高','${userInformation.height}'],
					  		               ['血型','${studentInformation == null ? '': studentInformation.XXDM}'],
					  		               ['备注','${userInformation.remarks}'] ],true);
					  		     </script>					  		    
					  		      </div>
					  		</div>
				  		</div>
				  	</div>
				  	
				  	
			
				 
				<script>
			
				
				
				 //记录content的位置，
				  var record=[];
				  
				 var length=$("#fixLeft  .outline-item").length;
				 function  updateRecord(){
					
					 record=[];
					 $outline=$("#fixLeft  .outline-item");;
					 $outline.each(function(i,d){
						// console.log($('#content'+i).length);
						  record.push($('#content'+i).offset().top);
					  });
					 $(document).trigger("scroll");
				 }
				 var  $outline;
				  $(function(){
					    $outline=$(".outline-item");
					  $(".outline-item").click(function(){
						  var  index=$outline.index(this);
						  //移动的距离计算，如果不用移动，就要立即显示切换						
						  var from=$(document).scrollTop();
						  var to=$('#content'+index).offset().top;
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
						  $('html,body').animate({scrollTop:$('#content'+index).offset().top},timeSpan);	
						  setTimeout(function(){activeLeft(index);},timeSpan+17);
						  
						  
						  
					  });
					  var h3= $(".nav-wrapper  .nav  h3");
					  $(".nav-wrapper  .nav  h3").click(function(){	
						  var index=h3.index(this);
							$(this).closest(".nav-wrapper").find(".pageWrap").slideToggle("500","swing");
							$(this).closest(".nav-wrapper").find(".pagerContainer").slideToggle("200","swing");
							setTimeout(function(){updateRecord();},550);
							setTimeout(function(){activeLeft(index);},600);
						});
					  //按照顺序给右边加入id
					  var content=$(".content");
					  content.each(function(i,d){
						  var index=content.index(this);
						  $(this).attr("id","content"+index);
						  
					  });
					
					  updateRecord();			
					  var dv=$("#fixLeft");
					  var originTop=dv.offset().top;
						$(window).scroll(function(){
							 var scrollY = $(document).scrollTop();// 
							for(var i=0;i<record.length;i++){
								if(record[i]<=scrollY &&  ( (i==(record.length-1)) ||  (record[i+1]>scrollY)  )  ){
								    activeLeft(i);
								    //纠正dom操作后，浏览器滚动的印象。
									//if($(document).scrollTop()<scrollY ){
										// $(document).scrollTop(scrollY);
										
									//}else if(i!=(record.length-1) && ($(document).scrollTop()>scrollY)){
									//	 $(document).scrollTop(scrollY);
								//	}
									
								}
							}
							 
							 //固定左边
							 if(scrollY>originTop){							 
								 dv.css({position: "absolute"});
								 dv.css({
									 'top': (scrollY-$($(".basicInformationRight")[0]).offset().top +"px"),
									 'margin-top':"0px" 
									 });
							 }else{
								 dv.css({'position': "static", 'margin-top':"20px"});
							 }
							 
							
						});
						
						
						
						  //高亮左边
						  
						function  activeLeft(i){
							  if(i>=0  && i<record.length){
									$outline.removeClass("outline-active");
									$outline.eq(i).addClass("outline-active");
							  }
						
						}
						  $(document).trigger("scroll");
						  
						  
						
						  
					
						  
					 
				  });
				/*测试滚动条和分页*/
				
				 (function ($) {
				        $(window).load(function () {
				          
				        });
				    })(jQuery);
				
				</script>
				  <!-- .content 学习经历 -->
				  <!-- 
				  <div  class="content  myData  last" id="content2" >
				  	<div  class="nav-wrapper">
				  		<div class="nav">
				  			 <h3>学习经历</h3>
				  		</div>
				  		<div  class="pageWrap" style="overflow:hidden;">
				  		     <c:if test="${userLearning != null && fn:length(userLearning) eq  0}">
				  		                     没有数据
				  		     </c:if>
				  			 <c:forEach items="${userLearning}" var="ul">
				  			 	<div class="cole   "  id="${ul.id }"  order="${ul.orders }">
					  				<div  class="title">
					  					<div class="inforTxt">
					  						<div  class="info01">
					  							<a href="javscript:void(0);">${ul.place}
					  							</a>&nbsp;&nbsp;
					  							<em>${ul.time}</em>
					  						</div>
					  						<div  class="info02">
					  							<a href="javscript:void(0);">${ul.major}
					  							</a>&nbsp;&nbsp;
					  							<span>${ul.education}</span>
					  							<samll>|</samll>
					  							<font>${ul.detail_time_span}</font>
					  						</div>
					  					</div>
					  				
					  					<div  class="coleBtn">
					  					
					  					   <a class="btn_a btn_a1"  title="上移"></a>
					  					   <a class="btn_a btn_a2"  title="下移"></a>
					  					   
					  					</div>
					  					<i class="coleArrow  "  ></i>
					  					
					  				
					  				</div>
					  			
					  				<div  class="detail">
					  				  ${ul.detail}
					  				</div>
					  			
					  			</div>
					  		
				                            
				             </c:forEach>
				  			
				  		
				  		</div>
				  	
				  	  
				  	   
				  	</div>
				 
				  </div>
				
				  <div  class="content  myData  last"   id="content3">
				  	<div  class="nav-wrapper">
				  		<div class="nav">
				  			 <h3>工作经历</h3>
				  		</div>
				  		<div  class="pageWrap" style="overflow:hidden;">
				  		     <c:if test="${userLearning != null && fn:length(userLearning) eq  0}">
				  		                     没有数据
				  		     </c:if>
				  			 <c:forEach items="${userLearning}" var="ul">
				  			 	<div class="cole   "  id="${ul.id }"  order="${ul.orders }">
					  				<div  class="title">
					  					<div class="inforTxt">
					  						<div  class="info01">
					  							<a href="javscript:void(0);">${ul.place}
					  							</a>&nbsp;&nbsp;
					  							<em>${ul.time}</em>
					  						</div>
					  						<div  class="info02">
					  							<a href="javscript:void(0);">${ul.major}
					  							</a>&nbsp;&nbsp;
					  							<span>${ul.education}</span>
					  							<samll>|</samll>
					  							<font>${ul.detail_time_span}</font>
					  						</div>
					  					</div>
					  				
					  					<div  class="coleBtn">
					  					
					  					   <a class="btn_a btn_a1"  title="上移"></a>
					  					   <a class="btn_a btn_a2"  title="下移"></a>
					  					   
					  					</div>
					  					<i class="coleArrow  "  ></i>
					  					
					  				
					  				</div>
					  			
					  				<div  class="detail">
					  				  ${ul.detail}
					  				</div>
					  			
					  			</div>
				                            
				             </c:forEach>
				  		</div>
				  	   
				  	</div>
				  
				  </div>
				  -->
				  
				  
				
				           	
				</div>
				  <!-- /.basic -->
				  
		
				
		</div> <!-- /.basicInformationRight -->
</div>
<!-- 
<div  id="informationChange"  style="position:fixed;bottom:250px;right:10px;" >
	<a  href="http://flowser.xust.edu.cn/infoplus/form/null/start"  target="_blank" >
	   <img src="${contextPath}/static/proscenium/images/informationChange.png"     class="anim_image"
	      style="width: 35px;height: 35px;" />
	   <div  style="text-align: center; margin-top: 10px;">
		   信息变更
		</div>
	</a>
	
</div>
 -->
<style>
@-webkit-keyframes glow {
    0% {
        -webkit-box-shadow: 0 0 12px rgba(72, 106, 170, 0.5);
        border-color: rgba(160, 179, 214, 0.5);         
    }
    100% {
        -webkit-box-shadow: 0 0 12px rgba(72, 106, 170, 1.0), 0 0 18px rgba(0, 140, 255, 1.0);
        border-color: rgba(160, 179, 214, 1.0); 
    }
}
.anim_image {
    padding:3px;
    border:1px solid #beceeb;
    border-radius:30px;
    background-color:white;
    -moz-box-shadow: 0 0 8px rgba(72, 106, 170, 0.5);
    -webkit-box-shadow: 0 0 8px rgba(72, 106, 170, 0.5);
    box-shadow: 0 0 8px rgba(72, 106, 170, 0.5);
}
.anim_image:hover {
    background-color:#f0f3f9;
    -webkit-animation-name: glow;
    -webkit-animation-duration: 1s;
    -webkit-animation-iteration-count: infinite;
    -webkit-animation-direction: alternate;
    -webkit-animation-timing-function: ease-in-out;    
}
</style>

