<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	
	<style>
	
	.ico.notify {
	    height: 60px;
	}
	a.ico_2 {
	    margin-top: -22px;
	}
	.notifyDropDown {
	    width: 110px;
	    height: 110px;
	    border-top: 2px solid #c4c4c4;
	    background: #e7e6e6;
	    border-bottom-left-radius: 30px;
	    border-bottom-right-radius: 30px;
	    position: absolute;
	    right: -43px;
	    top: 33px;
	    z-index: 999;
	    display: none; 
	}
	.rightMask{
		   width: 45px;
		   height: 50px;
		   position: absolute;
		   top: -10px;
		   left: 5px;
    }
	
	.notifyDropDown ul {
	    padding-top: 10px;
	    padding-left: 10px;
	}
	
	.notifyDropDown ul li {
	    height: 30px;
	    line-height: 30px;
	    margin-bottom: 10px;
	    position:relative;
	}
	
	.notifyDropDown ul li a:hover {
	    color: #f05638;
	}
	.notifyDropDown ul li a.ico1 {
	    background: url(${contextPath}/static/proscenium/images/apply.png) left center no-repeat;
	    background-size: 22px 22px;
	}
	.notifyDropDown ul li a.ico2 {
	    background: url(${contextPath}/static/proscenium/images/approval.png) left center no-repeat;
	    background-size: 22px 22px;
	}
	
	
	
	.notifyDropDown ul li a {
	    display: block;
	    font-size: 15px;
	    color: #727272;
	    padding-left: 40px;
	}

	</style>
	
	<div class="top_right">
                <div class="grzx c">
                   <!-- 
                	<div class="ico">
                    	<a class="ico_1" href="#"></a>
                        <p>0</p>
                    </div>
                     -->
                     <!-- 
                     <div class="ico notify  notDown" id="mailId">
                    	<a id="mailUrl" class="ico_2 ico_3" href="${mail.mailUrl}" target="_Blank" style="background-size: 25px 33px;"></a>
                        <div class="rightMask">
                        	<p class="testShow">${mail.count}</p>
                        	<div  style="clear:both;"></div>
                        
                        </div>
                      
                        
                    </div>
                     -->
                    
                	<div class="ico notify">
                    	<a class="ico_2" href="#"  style="background-size: 23px 23px;"></a>
                        
                        <div class="rightMask">
                        	<p class="testShow">${message.total}</p>
                        	<div  style="clear:both;"></div>
                        
                        </div>
                        <div class="notifyDropDown   tip" >
	                            <ul>
	                            	<li>
	                                	<a class="ico1" href="sqr_to_dbl.html">待办理</a>
	                                	<p>${message.dblsl}</p>
	                                </li>
	                            	<li>
	                                	<a class="ico2" href="taskCenter_sh.html">待审批</a>
	                                	<p>${message.dshsl}</p>
	                                </li>
	                            </ul>
	                       
	                        </div>
                        
                    </div>
                    <div class="denglu">
                        <i><img src="${contextPath}/static/proscenium/images/touxiang_2.png" ></i>
                        <p>${sessionScope.user.username}</p>
                        <span></span>
                        <div class="xiala">
                            <ul>
                            	<li>
                                	<a class="ico1" href="taskCenter.html">我的服务</a>
                                </li>
                            	<li>
                                	<a class="ico2" href="taskCenter_collect.html">我的收藏</a>
                                </li>
                            	<li>
                                	<a class="ico3" href="personalCenter.html">个人中心</a>
                                </li>
                                <li>
                                <!--<a class="ico4" href="javascript:changePassword2();">修改密码</a>  -->	
                                <a class="ico4" href="http://ids.xust.edu.cn/authserver/userAttributesEdit.do" target="_blank">修改密码</a>
                                </li>
                                
                                
                                
                            </ul>
                            <a href="caslogout.jsp"><strong>退出</strong></a>
                        </div>
                    </div>
                </div>
     </div>
     <script  type="text/javascript">
     function changePassword2(){
		 $('.zhezhao').show();
		 $(".zz_xiuGaiMiMa").show();
		 $("#changePassword").val('');
		 $("#confirm").val('');
		 
	}
     $(function(){
    	 $('.notify:not(.notDown)').hover(function(){
    	 		$('.notifyDropDown').show();
    	 	},function(){
    	 		$('.notifyDropDown').hide();
    	 	});
    	 
    	 
     });
     
    
     </script>
      <div class="zhezhao"></div>
  <style>
      
   .zz_xiuGaiMiMa {
    width: 755px;
    height: 500px;
    position: fixed;
    top: 50%;
    margin-top: -234px;
    left: 50%;
    margin-left: -377px;
    background: #fff;
    border-radius: 20px;
    z-index: 999;
    display: none;
}

.zz_xiuGaiMiMa .guanbi {
    display: block;
    width: 47px;
    height: 47px;
    background: url(${contextPath}/static/proscenium/images/guanbi_but.png) no-repeat center;
    position: absolute;
    right: 22px;
    top: 20px;
}

.zz_xiuGaiMiMa .bt {
    margin-top: 46px;
    text-align: center;
    font-size: 20px;
    color: #44c3f1;
}

.zz_xiuGaiMiMa .form {
    width: 388px;
    margin: 0 auto;
    margin-top: 90px;
}

.zz_xiuGaiMiMa .form .youxiang.link {
    border: 2px solid #2fb1ec;
}
.zz_xiuGaiMiMa .form .youxiang {
    width: 100%;
    height: 50px;
    width: 384px;
    border: 2px solid #e6e8ec;
    border-radius: 6px;
    position: relative;
}

.zz_xiuGaiMiMa .form .youxiang input {
    display: block;
    float: left;
    width: 384px;
    height: 50px;
    line-height: 50px;
    border: none;
    padding-left: 10px;
    font-size: 16px;
    background: none;
}

.zz_xiuGaiMiMa .form .youxiang a:hover {
    text-decoration: none;
    cursor:default;
}
.zz_xiuGaiMiMa .form .youxiang a {
    font-size: 16px;
    color: #f00;
    display: block;
    line-height: 28px;
    margin-top: 11px;
    padding-left: 22px;
}


.zz_xiuGaiMiMa .form .mima.link {
    border: 2px solid #2fb1ec;
}
.zz_xiuGaiMiMa .form .mima {
    width: 100%;
    height: 50px;
    width: 384px;
    border: 2px solid #e6e8ec;
    border-radius: 6px;
    position: relative;
    margin-top: 24px;
}

.zz_xiuGaiMiMa .form .mima input {
    display: block;
    float: left;
    width: 384px;
    height: 50px;
    line-height: 50px;
    border: none;
    padding-left: 10px;
    font-size: 16px;
}

.zz_xiuGaiMiMa .form .mima a:hover {
    text-decoration: none;
    cursor:default;
}
.zz_xiuGaiMiMa .form .mima a {
    font-size: 16px;
    color: #f00;
    display: block;
    line-height: 28px;
    margin-top: 11px;
    padding-left: 22px;
}

.zz_xiuGaiMiMa .form .but {
    display: block;
    width: 125px;
    height: 46px;
    text-align: center;
    line-height: 46px;
    border: none;
    background: #2fb1ec;
    font-size: 20px;
    color: #fff;
    cursor: pointer;
    margin: 0 auto;
    margin-top: 64px;
}
      
      </style>
      
       <div class="zz_xiuGaiMiMa">
        	<span class="guanbi"></span>
            <h4 class="bt">修改密码</h4>
            <div id="loginbox" class="form">
            	<form id="signupForm">
                    <div class="youxiang">
                    	<input class="text" type="password" id="changePassword" name="username" value="" placeholder="请输入新密码" />
                        <!-- <a href="#">密码不能为空</a> -->
                    </div>
                    <div class="mima">
                    	<input class="text" type="password" id="confirm" name="password" value="" placeholder="请再次输入密码"/>
                        <!-- <a href="#">密码不一样</a> -->
                    </div>
                    <input class="but"  value="确定" onclick="savePassword();"/>
               </form>
            </div>
        </div>
        
        <script>
        $(function(){
        	$('.guanbi').click(function(){
        		$('.zhezhao').hide();
        		$('.zz_denglu').hide();
        		 $(".zz_xiuGaiMiMa").hide();
        	});
        	
        });

        function   savePassword(){
        	$("#changePassword").val($.trim($("#changePassword").val()));
        	$("#confirm").val($.trim($("#confirm").val()));
        	if ($("#changePassword").val() == "") {
        		$("#changePassword").tips({
        			side : 2,
        			msg : '密码不得为空',
        			bg : '#AE81FF',
        			time : 3
        		});
        		$("#changePassword").focus();
        		return false;
        	} 
        	if ($("#confirm").val() == "") {
        		$("#confirm").tips({
        			side : 2,
        			msg : '密码不得为空',
        			bg : '#AE81FF',
        			time : 3
        		});
        		$("#confirm").focus();
        		return false;
        	}
        	
        	if ($("#confirm").val() != $("#changePassword").val()) {
        		$("#confirm").tips({
        			side : 2,
        			msg : '密码不一致',
        			bg : '#AE81FF',
        			time : 3
        		});
        		$("#confirm").focus();
        		return false;
        	}
        	$('.zhezhao').hide();
        	 $(".zz_xiuGaiMiMa").hide();
        	 
        	showMaskAndContent("正在提交请求，请稍等片刻");

        	$.ajax({
        		type: "POST",
        		url: 'user/savePassword.html',
        		data: {'password':$("#confirm").val()},
        		dataType:'json',
        		cache: false,
        		success: function(data){
        			 closeMyDialog();
        			$('.zhezhao').hide();
        			 $(".zz_xiuGaiMiMa").hide();
        			
        			if(data.result=="ok"){
        				//showTip("提示","修改成功"); 
        				showOneSecondDialog("提示","修改成功",1000);
        			}else{
        				showTip("提示","修改失败");
        			}
        				
        			
        		},
        		error:function(){
        			 closeMyDialog();
        			 showTip("提示","修改失败(请检查网络)");
        			
        		}
        	});
        }
        
        function notify(accountName){
        	window.location.href="mailCount.html?accountName=" + accountName;
        }
        
        $("#mailId").click(function(){
        	document.getElementById("mailUrl").click();
        });
      
        </script>
     
   
     