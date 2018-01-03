<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



  <script>
  /*根据出生日期算出年龄*/  
  function jsGetAge(strBirthday){ 
	  if(strBirthday == ""  ||   strBirthday === undefined){
		  return "";
	  }
      var returnAge;  
      //出生日期有两种 ：可能"19800101",可能"1982-1-1",避免麻烦，显示出生日期。
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
		       	<%@ include file="taskCenter_personalCenter_profile.jsp"%>
		   </div>
		   
		   <div  class="outline-item   outline-active" id="basicNav">		       
		        	   <div  class="outline-itemIndex">1</div>
				       <div  class="outline-itemText bh-str-cut">基本信息</div>
				       <div  class="outline-itemCount"></div>		       
		   </div>
		  
		  
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">2</div>
		       <div  class="outline-itemText bh-str-cut">岗位信息</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">3</div>
		       <div  class="outline-itemText bh-str-cut">通讯信息</div>
		       <div  class="outline-itemCount"></div>
		   </div>		   
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">4</div>
		       <div  class="outline-itemText bh-str-cut">工作经历</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">5</div>
		       <div  class="outline-itemText bh-str-cut">学习经历</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">6</div>
		       <div  class="outline-itemText bh-str-cut">家庭成员</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <!-- 
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">8</div>
		       <div  class="outline-itemText bh-str-cut">岗位信息</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		    -->
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">7</div>
		       <div  class="outline-itemText bh-str-cut">职称信息</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   <div  class="outline-item   ">
		       <div  class="outline-itemIndex">8</div>
		       <div  class="outline-itemText bh-str-cut">其它</div>
		       <div  class="outline-itemCount"></div>
		   </div>
		   
		</div>
		
		<style>
		/*table  代背景的单元格*/
		.TableLabel{
		color:#444; background:#f6f6f6;border: 1px solid #50cafc;
		border-collapse: collapse;width:146px; height:33px;word-wrap: break-word;   
		 vertical-align: middle;text-align: center; display: table-cell;  
		  font-weight: 700; font-size: 12px;
		}
		.TableLabelValue{
		color:#444; border: 1px solid #50cafc;
		border-collapse: collapse;width:162px; height:33px;word-wrap: break-word;   
		 vertical-align: middle;text-align: center; display: table-cell;  
		  font-size: 12px;
		}
		
		</style>
	
	
		<div  class="basicInformationRight">
		     <div class="basic" style="">  
				    <div  class="content  myData"  id="content0" >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>基本信息</h3>
					  		</div>
					  		<div  class="pageWrap"  style="overflow:hidden;">
					  		    <!-- 因为div布局太不稳定，改为table -->
					  		    <table  style="table-layout:fixed;"  cellspacing="0"  cellpadding="0">
					  		    <tr>
					  		      <td     class="TableLabel">    职工号  </td> <td  class="TableLabelValue">   <c:out value="${userId}"/>  </td> 
					  		      <td  class="TableLabel">    姓名  </td> <td  class="TableLabelValue">    <c:out value="${userName}"/>  </td>
					  		      <td  class="TableLabel">   姓名拼音  </td> <td  class="TableLabelValue">    <c:out value="${t_jzg.XMPY}"/>  </td>
					  		    </tr>
					  		    <tr>
					  		      <td     class="TableLabel">   出生日期  </td> <td  class="TableLabelValue">   <c:out value="${t_jzg.CSRQ}"/>  </td> 
					  		      <td  class="TableLabel">    曾用名  </td> <td  class="TableLabelValue">    <c:out value="${t_jzg.CYM}"/>  </td>
					  		      <td  class="TableLabel">   籍贯  </td> <td  class="TableLabelValue">    <c:out value="${t_jzg.JGDM}"/>  </td>
					  		    </tr>
					  		    <tr>
					  		      <td     class="TableLabel">   国家(地区)  </td> <td  class="TableLabelValue">   <c:out value="${userInformation.country}"/>  </td> 
					  		      <td  class="TableLabel">    民族  </td> <td  class="TableLabelValue">    <c:out value="${userInformation.nation}"/>  </td>
					  		      <td  class="TableLabel">   身份证件号  </td> <td  class="TableLabelValue">    <c:out value="${t_jzg.SFZJH}"/>  </td>
					  		    </tr>
					  		    <tr>
					  		      <td     class="TableLabel"> 身份证件号  </td> <td  class="TableLabelValue">   <c:out value="${t_jzg.SFZJH}"/>  </td> 
					  		      <td  class="TableLabel">   港澳台侨  </td> <td  class="TableLabelValue">    <c:out value="${userInformation.hong_kong}"/>  </td>
					  		      <td  class="TableLabel"> 是否持有绿卡  </td> <td  class="TableLabelValue">    <c:out value="${userInformation.green_card}"/>  </td>
					  		    </tr>
					  		    
					  		    </table>
					  		      <div  class="table  notOne">
					  		      <script>
							  	//	 document.write(getLine([ ['职工号','<c:out value="${userId}"/>'],['姓名','<c:out value="${userName}"/>'],['姓名拼音','${t_jzg.XMPY}'] ],true));
							  	//	 document.write( getLine([ ['出生日期','${t_jzg.CSRQ}'],['曾用名','${t_jzg.CYM}'],['籍贯','${t_jzg.JGDM}'] ]));
							  	//	 document.write( getLine([ ['国家(地区)','${userInformation.country}'],['民族','${userInformation.nation}'],['身份证件号','${t_jzg.SFZJH}'] ]));
							  	//	 document.write( getLine([ ['身份证件号','${t_jzg.SFZJH}'],['港澳台侨','${userInformation.hong_kong}'],['是否持有绿卡','${userInformation.green_card}'] ]));
							  		
							  		 /*
							  		 document.write( getLine([ ['绿卡国别','${userInformation.green_card_country}'],['健康状况','${userInformation.health}'],['婚姻状况','${userInformation.marital_status}'] ]));
							  		 document.write( getLine([ ['结婚时间','${userInformation.wedding_time}'],['参加工作年月','${userInformation.work_attendance_date}'],['从教年月',jsGetAge('${userInformation.work_attendance_date}')] ]));
							  		 document.write( getLine([ ['户口所在地','${userInformation.registered_residence}'],['户口性质','${userInformation. household_type}'],['政治面貌','${userInformation.political_outlook}'] ]));
							  		 document.write( getLine([ ['参加党派日期','${userInformation.party_date}'],['第二党派','${userInformation.second_party}'],['第二党派日期','${userInformation.party_date}'] ]));
							  	     document.write(getLine([ ['来校年月','${userInformation.school_year}'],['所在单位','${userInformation.unit_name}'],['当前状态','${userInformation.current_state}'] ]));
							  		 
							  	  	showLine([ ['最高学历','${qualificationInformation.highest_education}'],['毕业年月','${qualificationInformation.graduation_date}'],['毕业学校','${qualificationInformation.graduation_school}'] ]);
						  		    showLine([ ['最高学位','${qualificationInformation.highest_degree}'],['授学位年月','${qualificationInformation.give_degrees}'],['授予学位单位','${qualificationInformation.degree_unit}'] ]);
						  		  	showLine([ ['教师资格证号','${qualificationInformation.qualification_number}'],['教师资格获得日期','${qualificationInformation.date_qualification}'],['学科类别','${qualificationInformation.subject_category}'] ]);
						  			showLine([ ['一级学科','${qualificationInformation.first_class_discipline}'],['二级学科','${qualificationInformation.second_class_discipline}'],['研究方向','${qualificationInformation.research_direction}'] ]);
						  			showLine([ ['所学专业','${qualificationInformation.major}'],['党政职务','${qualificationInformation.party_government_posts}'],['党政职务级别','${qualificationInformation.party_government_ranks}'] ]);
						  			showLine([ ['党政职务任职年月','${qualificationInformation.party_government_date}'],['专业技术职务','${qualificationInformation.technical_position}'],['专业技术职务级别','${qualificationInformation.professional_technical_rank}'] ]);
						  			showLine([ ['专业技术职务评定年月','${qualificationInformation.professional_technical_date}'],['聘任专业技术职务','${qualificationInformation.professional_technical_posts}'],['聘任专业技术职务级别','${qualificationInformation.appointment_professional_rank}'] ]);
						  			showLine([ ['聘任专业技术职务年月','${qualificationInformation.appointment_professional_date}'],['工人技术工种','${qualificationInformation.workers_technical_jobs}'],['工人技术等级','${qualificationInformation.workers_technical_rank}'] ]);
						  			showLine([ ['工人技术等级评定年月','${qualificationInformation.workers_technical_date}'],['','','none'],['','','none'] ]);
							  	     */
							  	     
							  	     
							  	     $(function(){
							  			 //因为全局的on,不能传递envet事件，导致一开始提示框移动不能显示，改为一旦页面加载就手工触发绑定函数
							  			 //内部有data,防止多次绑定后的重复处理。
							  			$(".line .lineUnit  .labelValue").tipsStaticTwo();
							  		 });
					  		      </script>
					  		      <!--  
					  		         
					  		        <div  class="line  ">
					  		            <div  class="lineUnit   lineFirst">
					  		            	<div  class="label">工号</div>
					  		           		<div  class="labelValue">fdfd</div>
					  		           		<div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">

				           		         	  		<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
					           		         		<div class="jq_tips_info2" style="">
					           		         		fdddddddddddddddddddddddddddddddddddddddddd

					           		         		</div>
				           		         	</div>
					  		            </div>
					  		            <div  class="lineUnit">
					  		            	<div  class="label">单位</div>
					  		           		<div  class="labelValue">dfdf</div>
					  		           		<div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">

				           		         	  		<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
					           		         		<div class="jq_tips_info2" style="">

					           		         		评论:${zx.comment_count==null ?   0: zx.comment_count}条<br/>点赞:${zx.praise_count == null ? 0:  zx.praise_count}个<br/>收藏:${zx.collection_count ==  null?  0:zx.collection_count}个<br/></div>
				           		         	</div>
					  		            </div>
					  		            <div  class="lineUnit">
					  		            	<div  class="label">职称</div>
					  		           		<div  class="labelValue">
											     fff
											</div>
											<div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;">

				           		         	  		<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
					           		         		<div class="jq_tips_info2" style="">

					           		         		评论:${zx.comment_count==null ?   0: zx.comment_count}条<br/>点赞:${zx.praise_count == null ? 0:  zx.praise_count}个<br/>收藏:${zx.collection_count ==  null?  0:zx.collection_count}个<br/></div>
				           		         	</div>
					  		            </div>
					  		         </div>
					  		         -->
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
					  		         

					  		    
					  		         <!-- 
					  		         <div  class="pagerContainer"  >  
					  		            <div  class="pager"   style="width:100%;height:100%;position:relative;">
					  		            	<div  class="bh-pager">
					  		            		<div class="bh-pull-left">
					  		            			<a style="cursor:pointer;" class="bh-pager-btn  waves-effect" pager-flag="prev">
					  		            			 
					  		            			   <i class="fa fa-chevron-left"   aria-hidden="true" style="font-size:24px;color:#50cafc;margin-top:2px;"></i>	  
					  		            			</a>
					  		            			<a style="cursor:pointer;" class="bh-pager-btn  waves-effect" pager-flag="next">
					  		            			    <i class="fa fa-chevron-right"   aria-hidden="true" style="font-size:24px;color:#50cafc;margin-top:2px;"></i>
					  		            			</a>
					  		            			<span  class="bh-pager-num">1-10 总记录数 10 </span>
					  		            			<label  class="bh-pager-label">跳转至</label>
					  		            			<input type="text" class="bh-form-control bh-pager-input" pager-flag="gotoPager"  onfocus="this.select();"  onkeypress="return checkNum(event);">
					  		            			<span>页</span>
					  		            		</div>
					  		            		<div class="bh-pull-right">
					  		            			<div  pager-flag="pagerOptionSel"  
					  		            				class="bh-pull-right jqx-widget jqx-dropdownlist-state-normal jqx-rc-all jqx-fill-state-normal  jqx-fill-state-pressed jqx-rc-b-expanded"
					  		            				 style="width:60px;height:26px;">
					  		            				 <div   class="pageDropDown"  style="background-color: transparent; -webkit-appearance: none; outline: none; width:100%; height: 100%; padding: 0px; margin: 0px; border: 0px; position: relative;">
					  		            					<div    class="dropdownlist-state-selected"  style="outline: none; background-color: transparent;  float: left; width:100%; height: 100%; position: relative;">
					  		            						<div  style="box-sizing: border-box;outline: none; background-color: transparent; border: none; float: left; position: relative; width: 33px; height: 24px; left: 0px; top: 0px;" 
					  		            						     class="jqx-dropdownlist-content jqx-disableselect">
					  		            						     10
					  		            						</div>
					  		            						<div  style="background-color: transparent; border: none; float: right; position: relative; width: 19px; height: 24px;">
					  		            						    <div  unselectable="on"   class="jqx-icon-arrow-down jqx-icon">
					  		            						    </div>
					  		            						</div>
					  		            					
					  		            					</div>	
					  		            					<div  style="position:relative;">
					  		            						 <div  class="itemPerPage" id="test1"  style="box-shadow: 0 2px 8px rgba(0,0,0,.28);width:58px;height:120px;overflow:auto;position:absolute;top:-120px;background:#f6f6f6;">
												  		           <div  style="width:58px ;height:165px;overflow:visible;">
												  		              <div  class="pageList" style="">
												  		         	      	<span   class="pageListSpan"  	>
												  		         	      						   5
												  		         	      	</span>
												  		         	   </div>
												  		         	    <div  class="pageList">
												  		         	      	<span class="pageListSpan"  	>
												  		         	      						   10
												  		         	      	</span>
												  		         	   </div>
												  		         	    <div  class="pageList">
												  		         	      	<span class="pageListSpan" 	>
												  		         	      						   15
												  		         	      	</span>
												  		         	   </div>
												  		         	    <div  class="pageList">
												  		         	      	<span class="pageListSpan" 	>
												  		         	      						   20
												  		         	      	</span>
												  		         	   </div>
												  		         	    <div  class="pageList">
												  		         	      	<span class="pageListSpan" 	>
												  		         	      						   50
												  		         	      	</span>
												  		         	   </div>
												  		         	    <div  class="pageList">
												  		         	      	<span class="pageListSpan" >
												  		         	      						   100
												  		         	      	</span>
												  		         	   </div>
												  		         	   <div  class="pageList">
												  		         	      	<span class="pageListSpan" >
												  		         	      						   200
												  		         	      	</span>
												  		         	   </div>
												  		           
												  		           
												  		           </div>
												  		         </div>
					  		            					
					  		            					</div>
					  		            					
					  		            				
					  		            				
					  		            				 </div>
					  		            				 
					  		            				
					  		            				
					  		            			</div>
					  		            			<label class="bh-pull-right bh-pager-label">每页显示</label>
					  		            			
					  		            		
					  		            		</div>
					  		            	</div>
					  		            
					  		            </div>
					  		         
					  		         </div>
					  		    --> 
					  		         
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
					  		       
					  		         
					  		         <script>
					  		           $(function(){
					  		        	
					  		        	   
					  		        	   /*
					  		        	  $("#listBoxjqxWidget4").mCustomScrollbar({
					  		                theme: "#004e90", //主题颜色
					  		                scrollButtons: {
					  		                    enable: true //是否使用上下滚动按钮
					  		                },
					  		                autoHideScrollbar: true, //是否自动隐藏滚动条
					  		                scrollInertia:500,//滚动延迟
					  		                horizontalScroll: false,//水平滚动条
					  		            });
					  		        	   */
					  		        	 
					  		        	 /*
					  		        	$("#listBoxjqxWidget4").mCustomScrollbar({
							            	
							            	
							            	scrollButtons:{
							            		enable:true
							            		//scrollType:"continuous",
							            		//scrollSpeed:20,
							            	//	scrollAmount:40
							            	},
							            	autoHideScrollbar: false, //是否自动隐藏滚动条
							             //	horizontalScroll:true//,
							               verticalScroll: true//水平滚动条
							             	
							             	
							             //   theme: "#004e90"//, //主题颜色
							              //  scrollButtons: {
							                 //   enable: true //是否使用上下滚动按钮
							               // },
							              //  alwaysShowScrollbar:2,
							            //    axis:"yx"//, // vertical and horizontal scrollbar
							               // autoHideScrollbar: true, //是否自动隐藏滚动条
							              //  scrollInertia:500//,//滚动延迟
							              //  horizontalScroll: true,//水平滚动条
							              //  verticalScroll: true//水平滚动条
							            	// axis:"x" // horizontal scrollbar
							            	// axis:"yx" // vertical and horizontal scrollbar
							            });
					  		        	 */
					  		           });
					  		         </script>
					  		         
					  		      
					  		      <!--
					  		      	<div  class="line  firstLine">
					  		            <div  class="lineUnit   lineFirst">
					  		            	<div  class="label">姓名</div>
					  		           		<div  class="labelValue">${userName}</div>
					  		            </div>
					  		            <div  class="lineUnit">
					  		            	<div  class="label">性别</div>
					  		           		<div  class="labelValue">${userInformation.sex}</div>
					  		            </div>
					  		            <div  class="lineUnit">
					  		            	<div  class="label">年龄</div>
					  		           		<div  class="labelValue">
												<script>document.write(jsGetAge('${userInformation.birthday}'));</script>岁
											</div>
					  		            </div>
					  		         </div>
					  		         -->
					  		         
					  		         
					  		         <!--
					  		         
					  		        
					  		          <div  class="line  ">
					  		            <div  class="lineUnit   lineFirst">
					  		            	<div  class="label">工号</div>
					  		           		<div  class="labelValue">${userId}</div>
					  		            </div>
					  		            <div  class="lineUnit">
					  		            	<div  class="label">单位</div>
					  		           		<div  class="labelValue">${userInformation.unit_id}</div>
					  		            </div>
					  		            <div  class="lineUnit">
					  		            	<div  class="label">职称</div>
					  		           		<div  class="labelValue">
												<c:forEach items="${userRanks}" var="ur"   varStatus="status">
									  		           <c:if test="${status.last eq false}">${ur.rank },</c:if>
									  		           <c:if test="${status.last eq true}">${ur.rank }</c:if>
									  		    </c:forEach>
											</div>
					  		            </div>
					  		         </div>
					  		            -->
					  		      
					  		      
					  		      </div>
					  		</div>
				  		</div>
				  	</div>
				  	
				 
				  	
				  	
				  <div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>岗位信息</h3>
					  		</div>
					  		<div  class="pageWrap" style="overflow:hidden;">
					  		
					  		   <table  style="table-layout:fixed;"  cellspacing="0"  cellpadding="0">
					  		    <tr>
					  		      <td     class="TableLabel">  职务名称  </td> <td  class="TableLabelValue">   <c:out value="${T_JZG_RZ.ZWMC}"/>  </td> 
					  		      <td  class="TableLabel">     </td> <td  class="TableLabelValue">   </td>
					  		      <td  class="TableLabel">     </td> <td  class="TableLabelValue">     </td>
					  		    </tr>
					  		   </table>
					  		    
					  		      <div  class="table  notOne">
					  		      <script>
					  		   // showLine([ ['管理岗位等级','${qualificationInformation.management_rank}'],['管理岗位聘任日期','${qualificationInformation.management_date}'],['专业技术岗位等级','${qualificationInformation.professional_technical_level}'] ],true);
					  		    //showLine([ ['专业技术岗位聘任年月','${qualificationInformation.posts_date}'],['工勤岗位等级','${qualificationInformation.job_level}'],['工勤岗位聘任日期','${qualificationInformation.job_date}'] ]);
					  		   // showLine([ ['是否双肩挑','${qualificationInformation.double_shoulder}'],['',' ','none'],[' ',' ','none'] ]);
					  		  // showLine([ ['职务名称','${T_JZG_RZ.ZWMC}'],[' ',' ','none'],[' ',' ','none'] ],true);
					  		      </script>					  		    
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
					  		   <table  style="table-layout:fixed;"  cellspacing="0"  cellpadding="0">
					  		    <tr>
					  		      <td     class="TableLabel">  有效通信地址  </td> <td  class="TableLabelValue">   <c:out value="${userInformation.valid_address}"/>  </td> 
					  		      <td  class="TableLabel"> 电子信箱    </td> <td  class="TableLabelValue"> ${userInformation.email}  </td>
					  		      <td  class="TableLabel"> 手机    </td> <td  class="TableLabelValue">   ${userInformation.mobile}  </td>
					  		    </tr>
					  		   </table>
					  		   
					  		      <div  class="table  notOne">
					  		      <script>
					  		   // showLine([ ['有效通信地址','<c:out value="${userInformation.valid_address}"/>'],['电子信箱','${userInformation.email}'],['手机','${userInformation.mobile}'] ],true);
					  		  //  showLine([ ['有效通信地址','${userInformation.valid_address}'],['有效邮政编码','${userInformation.zip_code}'],['手机','${userInformation.mobile}'] ],true);
					  		  //  showLine([ ['办公联系电话','${userInformation.office_phone}'],['电子信箱','${userInformation.email}'],['家庭电话','${userInformation.home_phone}'] ]);
					  		 //   showLine([ ['紧急联系人姓名','${userInformation.emergency_contact_name}'],['紧急联系人电话','${userInformation.emergency_contact_phone}'],[' ',' ','none'] ]);
					  		      </script>					  		    
					  		      </div>
					  		</div>
				  		</div>
				  	</div>
				  	
				  	
				  	
				  
				  	
				  	<div  class="content  myData"  id="content1" >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>工作经历</h3>
					  		</div>
					  		<div  class="pageWrap"     style="width:930px;overflow:hidden;"   id="workExperienceContainer">
					  		
					  		
					  		 <!-- mmGrid test 
					  		 <table id="tableWorkExperience"   ></table>   -->
					  		 <script>
					  		
					  	
					  	  /*
					  	  
					  	  //保留两位小数
					  	    var fixed2 = function(val){
					  	        return val.toFixed(2);
					  	    }

					  	    //加百分号
					  	    var fixed2percentage = function(val){
					  	        return fixed2(val)+'%';
					  	    }
					  	    //高亮
					  	    var highliht = function(val){
					  	        if(val > 0){
					  	            return '<span style="color: #b00">' + fixed2(val) + '</span>';
					  	        }else if(val < 0){
					  	            return '<span style="color: #0b0">' + fixed2(val) + '</span>';
					  	        }
					  	        return fixed2(val);
					  	    };*/
					  		var cols3 = [
					  		           {title:'操作', name:'operation', width: 110, align: 'center', sortable: true, renderer: function(val,item,rowIndex){
					  		               return '<a class="viewDetail">查看</a>';
					  		           }},
					  		           { title:'起始年月', name:'start_date' ,width:100, align:'center', sortable: true, sortName:'start_date'},
					  		           { title:'截止年月', name:'end_date' ,width:100, align:'center', sortable: true, sortName:'end_date'},
					  		           { title:'所在单位名称', name:'name_unit' ,width:100, align:'center'},
					  		           { title:'从事工作内容', name:'work_content' ,width:260, align:'center'}
					  		          
					  		       ];
					  		// $('#table3-1').mmGrid({
					  	     //   cols: cols3,
					  	      //  items: items, fullWidthRows: true
					  	   //});
					  		 
					  	//	 $('#table3-1').mmGrid({
					  	    //    cols: cols,
					  	    //    url: 'data/stockQuote.json',
					  	    //    method: 'get'
					  	   // });
					  		 
					  		 </script> 
					  		 
					  		 <!-- 
					  		 
					  		  <table  style="table-layout:fixed;"  cellspacing="0"  cellpadding="0">
					  		    <tr  id="trGZJL">
					  		      <td     class="TableLabel"  style="width:100px;">操作  </td> 
					  		      <td  class="TableLabel" style="width:130px;"> 起始年月  </td> 
					  		      <td  class="TableLabel" style="width:130px;"> 截止年月    </td> 
					  		      <td  class="TableLabel" style="width:200px;"> 所在单位名称  </td>
					  		      <td  class="TableLabel" style="width:350px;"> 从事工作内容   </td> 
					  		    </tr>
					  		    <tr>
					  		      <td     class="TableLabelValue">查看  </td> 
					  		      <td  class="TableLabelValue"> 起始年月  </td> 
					  		      <td  class="TableLabelValue"> 截止年月    </td> 
					  		      <td  class="TableLabelValue"> ${userInformation.email}  </td>
					  		      <td  class="TableLabelValue"> 手机    </td>
					  		    </tr>
					  		   </table>
					  		    -->
					  		   <script>
					  	
					  		 
					  		 if (!justTr){
					  		  	var justTr=function(trId,targetGridCols,gridWidth){
					  		  		var gridWidth=gridWidth||930;
					  		  		var length=targetGridCols.length;
					  		  		var sumWidth=gridWidth-targetGridCols[0].width;
					  		  		var useWidth=0;
					  		  		var planWidth=0;
					  		  		for(var i=1;i<length;i++){
					  		  			targetGridCols[i].width=targetGridCols[i].width||170;
					  		  			planWidth+=targetGridCols[i].width;
					  		  		}
					  		  		var trs=$("#"+trId).find("td");;
					  		  		
					  		  		for(var i=1;i<length;i++){
					  		  		
					  		  			if(i!=(length-1)){
					  		  				targetGridCols[i].width=parseInt(targetGridCols[i].width/planWidth*sumWidth);
					  		  			trs.eq(i).css({"width":targetGridCols[i].width});
					  		  				useWidth+=targetGridCols[i].width;
					  		  				
					  		  			}else{//last
					  		  				targetGridCols[i].width=sumWidth-useWidth;
					  		  			   trs.eq(i).css({"width":targetGridCols[i].width});
					  		  				
					  		  			}
					  		  			
					  		  			
					  		  		}
					  		  		
					  		  		
					  		  	}
					  		  }
					  		   
					  		   </script>
					  		   
					  		     
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
									        { title:'从事工作内容',name:'work_content' ,width:250}
									     ];
							  		         justGridWidth(work_experience_cols,930);
							  		         
							  		     //  justTr("trGZJL",work_experience_cols,930);
							  		     	var work_experience_data =[
							  		    
								       	   
								       	 <c:forEach items="${workInformation}" var="wI"   varStatus="status">
										       	 {
									            	  start_date:'${wI.start_date }',
									            	  end_date:'${wI.end_date }',
							  		        	      name_unit:'<c:out value="${wI.name_unit }"/>',
							  		        	      work_content:'<c:out value="${wI.work_content }"/>'
									             }
						  		                 <c:if test="${status.last eq false}">,</c:if>
						  		       
						  		   		 </c:forEach>
						  		    
								       	  ];
							  		     	
							  		     	
							  		     		//insertTable("workExperienceContainer",work_experience_cols,work_experience_data,false);
							  		     	<c:choose>
												<c:when test="${workInformation != null && fn:length(workInformation)>0}">
													insertTable("workExperienceContainer",work_experience_cols,work_experience_data,false);
												
												  // $("#tableWorkExperience").TanGrid({
													//   cols: work_experience_cols,
											  	   //    items: work_experience_data
												  // });
													
													
													/*
													 $('#table3-1').mmGrid({
												  	        cols: work_experience_cols,
												  	        items: work_experience_data, //fullWidthRows: true,
												  	        height: 'auto'
												  	   });*/
												  		 
												  	//	 $('#table3-1').mmGrid({
												  	    //    cols: cols,
												  	    //    url: 'data/stockQuote.json',
												  	    //    method: 'get'
												  	   // });	
													
												</c:when>
												<c:otherwise>
													$("#workExperienceContainer").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
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
						  		    justGridWidth(study_experience_cols,930);
						  		        
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
					  		<div  class="pageWrap"    style="width:930px; height:100%;overflow:hidden;"   id="jtcyID">
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
						  		    justGridWidth(jtgx_cols,930);
						  		        
						  		     	var jtgx_data =[
						  		     	                            
		  		     	                      	 <c:forEach items="${jtgxInformation}" var="wI"   varStatus="status">
											       	 {
											       		QJXM:'${wI.QJXM }',
											       		GX:'<c:out value="${wI.GX }"/>',
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
				     <!--  
				      <div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>岗位信息</h3>
					  		</div>
					  		<div  class="pageWrap"    style="overflow:hidden;"  id="jobContainer">
					  		      <div  class="table  notOne">
					  		      
					  		           <script>
					  		    /*      showTableLine([ ['操作',100,true],['岗位类别',202,true],['岗位等级',202,true],['聘用文号',203,true]
					  		         
					  		       					,['岗位聘任开始年月',203,true]
					  		         			],true,1300,"#f6f6f6");					  		         
					  		      	 showTableLine([ ['<a class="viewDetail">查看</a>',100],['专业技术岗位',202],['专业技术岗位九级',202],
					  		      	                 ['',203],['2008-01',203]	],false,1300);				  		   
					  		       
					  		      	 showTableLine([ ['<a class="viewDetail">查看</a>',100],['专业技术岗位',202],['专业技术岗位九级',202],
					  		      	                 ['',203],['2008-01',203]	],false,1300);
					  		       document.write( getPagination("jobInformationPagination","1-2","2")); */
					  		   //修改滚动条
					  		       $(function(){
					  		    	/*   $("#jobInformationPagination   .itemPerPage").css({"display":"block"});
						  		          $("#jobInformationPagination   .itemPerPage").mCustomScrollbar({
						  		                theme: "#004e90"
						  		           });
						  		    	$("#jobInformationPagination   .itemPerPage").css({"display":"none"}); */
						  		    	
						  		  	//修改
							  		      var job_cols = [
											 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
									            return '<a class="viewDetail">查看</a>';
									        }},
									        { title:'岗位类别',name:'category', width: 202, align:'center' },
									        { title:'岗位等级',name:'ranking',width: 202, align:'center'},
									        { title:'聘用文号',name:'number',width: 202 },
									        { title:'岗位聘任开始年月',name:'start_date' ,width: 202}
									     ];
							  		        
							  		     	var job_data =[
							  		     	               
							  		     	            <c:forEach items="${postInformation}" var="wI"   varStatus="status">
												       	 {
												       		category:'${wI.category }',
												       		ranking:'${wI.ranking }',
												       		number:'${wI.number }',
												       		start_date:'${wI.start_date }'
											             }
								  		                 <c:if test="${status.last eq false}">,</c:if>
									  		       
									  		   		 </c:forEach>  
							  		     	               
							  		     	               
				  		        
									  		        ];						  		     	
							  		     		insertTable("jobContainer",job_cols,job_data,false);
							  		            
												
					  		       });
					  		      </script>	
					  		        
					  		     </div>
				  		    </div>
				  		    
				     	</div>
				     </div>
				     -->
				 
				 
				     
				     
				  	
				  	
				    <div  class="content  myData"  >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>职称信息</h3>
					  		</div>
					  		<div  class="pageWrap   testContainer"    style="width:930px;height:100%;overflow:auto;"   id="titleContainer">
					  		      <div  class="table  notOne">					  		        
					  		     </div>
				  		    </div>
				  		      <script>
					  		        /*   document.write( getPagination("ranksInformationPagination","1-2","2"));
					  		          document.getElementById("ranksInformationPagination").style.marginLeft="7px"; */
					  		        //修改滚动条
						  		       $(function(){
						  		    	/*   $("#ranksInformationPagination   .itemPerPage").css({"display":"block"});
							  		          $("#ranksInformationPagination   .itemPerPage").mCustomScrollbar({
							  		                theme: "#004e90"
							  		           });
							  		    	$("#ranksInformationPagination   .itemPerPage").css({"display":"none"}); */
							  		    	
							  		    	
							  		    	
							  		  	//修改
								  		      var title_cols = [
												 {title:'操作', name:'operation', width: 100, align: 'center', renderer: function(val,item,rowIndex){
										            return '<a class="viewDetail">查看</a>';
										        }},
										        { title:'专业技术职务',name:'technical_position', width: 130, align:'center' },
										        { title:'专业技术职务级别',name:'level',width: 130, align:'center'},
										        { title:'专业技术职务评定年月',name:'assessment_year' },
										        { title:'聘任专业技术职务',name:'posts' },
										        { title:'聘任专业技术职务级别',name:'appoint_level' },
										        { title:'聘任专业技术职务起始年月',name:'start_date' }
										     ];
								  		        
								  		     	var title_data =[
								  		     	                 
								  		     	              <c:forEach items="${titleInformation}" var="wI"   varStatus="status">
														       	 {
														       		technical_position:'${wI.technical_position }',
														       		level:'${wI.level }',
														       		posts:'${wI.posts }',
														       		assessment_year:'${wI.assessment_year }',
														       		appoint_level:'${wI.appoint_level }',
														       		start_date:'${wI.start_date }'
													             }
										  		                 <c:if test="${status.last eq false}">,</c:if>
											  		       
											  		   		 </c:forEach>  
										  		        ];						  		     	
								  		     		//insertTable("titleContainer",title_cols,title_data,true,1200);
								  		    <c:choose>
												<c:when test="${titleInformation != null && fn:length(titleInformation)>0}">
													insertTable("titleContainer",title_cols,title_data,true,1200);
												</c:when>
												<c:otherwise>
													$("#titleContainer").html(" &nbsp;&nbsp; &nbsp;&nbsp;暂无数据");
												</c:otherwise>
											 </c:choose>  
								  		            
												
						  		       });
					  		 </script>
				     	</div>
				     </div>
				     
				    <div  class="content  myData"   >				     
				  		<div  class="nav-wrapper">
					  		<div class="nav">
					  			 <h3>其它</h3>
					  		</div>
					  		<div  class="pageWrap"  style="width:930px;overflow:hidden;">
					  		      <div  class="table  notOne">
					  		      <script>
					  		   // showLine([ ['身高','${userInformation.height}'],['血型','${userInformation.blood_type}'],['备注','<c:out value="${userInformation.remarks}"/>'] ],true);
					  		     </script>	
						  		     <table  style="table-layout:fixed;"  cellspacing="0"  cellpadding="0">
								  		    <tr>
								  		      <td     class="TableLabel">  身高 </td> <td  class="TableLabelValue">   <c:out value="${userInformation.height}"/>  </td> 
								  		      <td  class="TableLabel">  血型   </td> <td  class="TableLabelValue">  <c:out value="${userInformation.blood_type}"/> </td>
								  		      <td  class="TableLabel">   备注  </td> <td  class="TableLabelValue">  <c:out value="${userInformation.remarks}"/> </td>
								  		    </tr>
									 </table>				  		    
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
				  		<div  class="pageWrap"  style="overflow:hidden;">
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

