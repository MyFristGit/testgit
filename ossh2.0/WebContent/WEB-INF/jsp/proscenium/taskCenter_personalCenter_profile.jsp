<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

 <!--  <img src="${contextPath}/static/proscenium/images/person2.jpg"  width="80px" height="120px"/> -->
     <img src="personalCenter/img.html?id=${userId }" class="profileImage" width="80px" height="120px"/>

   
    <div class="tip jq_tips_box2  jq_tips_box_xs2"  directive="right"  style="display: none;margin-left:-220px;margin-top:0px;top:10px;">

    	  		<i class="jq_tips_arrow2 jq_tips_right2" style=""></i>
     		<div class="jq_tips_info2" style="">
     		    <a    class="changeButton">  上传头像图片</a><br>
     		    <a    class="emptyButton">  取消头像图片</a><br>
			     <input type="file"   multiple="multiple"    class="inputfile" style="height:0;width:0;z-index: -1; position: absolute;left: 10px;top: 5px;"/>
				<br><span class="loading" style="display:none;">正在处理</span>
				<div id="feedback"></div>
     		</div>
    </div>
    <style>
    	.button{
				display: block;
			    margin: 0 auto;
			    margin-top: 5px;
			    width: 82px;
			    height: 20px;
			    line-height: 20px;
			    text-align: center;
			    border: 3px solid #ffc80a;
			    border-radius: 30px;
			    color: #545454;
			    cursor:pointer;
			}
			.button:hover{
			  background:#00BCD5;
			}
			
    </style>
    <div  class="profile-content"  id="myDiv">
     
         <div  class="staff-name">${user.username }</div>
        
         
         <div  class="staff-sex">${userInformation.sex}  <span  class="age"></span></div>
        
        
         
      
         
         
         
         <br>
        <!-- 
         <a class="button  bindEmail">绑定邮箱</a>
          -->
         
    </div>
   <script>
     //因为包含文件第一次包含时从后台读取数据 user.username，${userInformation.sex}等
	 //可是后边的包含根本没有后台数据，为了避免重复，应把该值保存起来公用
  	 var  global_username="${user.username }"!="" ? "${user.username }" : global_username;
  	 var  global_sex="${userInformation.sex}"!="" ? "${userInformation.sex}" : global_sex;
  	 var  global_unit_id="${userInformation.unit_id}"!="" ? "${userInformation.unit_id}" : global_unit_id;
     $(function(){
    	
    	$(".staff-name").html(global_username);
    	$(".staff-sex").html(global_sex);
    	$(".staff-text").html(global_unit_id);
    	 
    	 $(".bindEmail").unbind('click');
    	 $(".bindEmail").click(function(e){
    		 $.fn.tipsStaticTwo.closeAll();
    			openDialogBySrc({src:"./personalCenter/bindEmail.html",width:770,height:500});
    	    	e.stopPropagation();
    	 });
    	 
    	 
    	 
    	 $(".changeButton").unbind('click');
    	 $(".changeButton").click(function(){
    		 $(this).closest(".profile").find(".inputfile").trigger("click");
    	 });		        	
    	 $(".basicInformationLeft .profile  img").tipsStaticTwo();
    	 $(".inputfile").change(function(){
    		  
    			//创建FormData对象
    			var data = new FormData();
    			//为FormData对象添加数据
    		
    			
    			$.each($(this)[0].files, function(i, file) {
    				//data.append('upload_file'+i, file);
    				//spring mvc 有两种处理方式，1.springMVC字节流输入上传文件
    				data.append('upload_file', file);
    				//2.springMVC包装类上传文件
    				//data.append('upload_file'+i, file);
    			});
    		
    			$(".loading").show();	//显示加载图片
    			//发送数据
    			
    			$.ajax({
    				url:'personalCenter/upLoadProfileImg3.html',
    				type:'POST',
    				data:data,
    				cache: false,
    				contentType: false,		//不可缺参数
    				processData: false,		//不可缺参数
    				success:function(data){
    					 $(".profileImage").attr('src', src="personalCenter/img.html?id=${userId }" + "&t=" + Math.random());
    					
    				//	alert(data.success);
    					//data = $(data).html();
    					//第一个feedback数据直接append，其他的用before第1个（ .eq(0).before() ）放至最前面。
    					//data.replace(/&lt;/g,'<').replace(/&gt;/g,'>') 转换html标签，否则图片无法显示。
    					//if($("#feedback").children('img').length == 0) $("#feedback").append(data.replace(/&lt;/g,'<').replace(/&gt;/g,'>'));
    					//else $("#feedback").children('img').eq(0).before(data.replace(/&lt;/g,'<').replace(/&gt;/g,'>'));
    					$(".loading").hide();	//加载成功移除加载图片
    				},
    				error:function(){
    					//alert('上传出错');
    					$(".loading").hide();	//加载失败移除加载图片
    				}
    			});
    			
    		});
    	 
    	  $(".emptyButton").click(function(){
    		  $.ajax({
    				url:'personalCenter/emptyImage.html',
    				type:'POST',
    				cache: false,
    				contentType: false,		//不可缺参数
    				processData: false,		//不可缺参数
    				success:function(data){
    					 $(".profileImage").attr('src', src="personalCenter/img.html?id=${userId }" + "&t=" + Math.random());
    					$(".loading").hide();	//加载成功移除加载图片
    				},
    				error:function(){		        					
    					$(".loading").hide();	//加载失败移除加载图片
    				}
    			});
    			
    		});
    		  
    	  
     });
   </script>
