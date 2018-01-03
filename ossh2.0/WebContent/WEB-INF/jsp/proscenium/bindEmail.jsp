<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.udata.osp.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		 <link rel="shortcut icon" href="${contextPath}/static/proscenium/images/xkd.ico" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		 <script src="${contextPath}/static/proscenium/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    	<title>西科E站</title>
		<link href="${contextPath}/static/proscenium/css/index.css" rel="stylesheet" type="text/css"/>
		<style>
      
   .zz_xiuGaiMiMa {
    width: 755px;
    height: 500px;
    position: fixed;
    background: #fff;
    border-radius: 20px;
    z-index: 999;
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
    </head>
	<body  >
	 <div class="zz_xiuGaiMiMa">
        	<span class="guanbi"></span>
            <h4 class="bt">绑定邮箱</h4>
            <div id="loginbox" class="form">
            	<form id="signupForm">
                    <div class="youxiang">
                    	<input class="text" type="text" id="changePassword" name="username" value=""
                    	 placeholder="请输入您的邮箱账户" />
                        <!-- <a href="#">密码不能为空</a> -->
                    </div>
                    <div class="mima">
                    	<input class="text" type="text" id="confirm" name="password" value="" 
                    	placeholder="请输入您的邮箱密码"/>
                        <!-- <a href="#">密码不一样</a> -->
                    </div>
                    <input class="but"  value="确定" onclick="saveEmail();"/>
               </form>
            </div>
        </div>
    </body>
    
    
</html>


<script type="text/javascript"> $.fn.tips || document.write("\x3Cscript src='${pageContext.request.contextPath}/static/proscenium/js/jquery.tips.js'>\x3C/script>");</script>
<script>
function   saveEmail(){
//	alert(encodeURIComponent("<"));// %3C
	$("#changePassword").val($.trim($("#changePassword").val()));
	$("#confirm").val($.trim($("#confirm").val()));
	if ($("#changePassword").val() == "") {
		$("#changePassword").tips({
			side : 2,
			msg : '账号不得为空',
			bg : '#AE81FF',
			time : 3
		});
		$("#changePassword").focus();
		return false;
	} 
	
	
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 	
	if (! reg.test($("#changePassword").val())) {

		$("#changePassword").tips({
			side : 2,
			msg : '账号格式有误',
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
	
	
	$('.zhezhao').hide();
	 $(".zz_xiuGaiMiMa").hide();
	 
	
	
		
	top.showMaskAndContent("正在提交请求，请稍等片刻");

	$.ajax({
		type: "POST",
		url: '${pageContext.request.contextPath}/user/bindEmail.html',
		data: {'email_account':$("#changePassword").val(),'email_password':$("#confirm").val()},
		dataType:'json',
		cache: false,
		success: function(data){
			
			
			if(data.result=="ok"){
				//showTip("提示","修改成功"); 
				top.showOneSecondDialog("提示","绑定成功",1000);
			}else{
				top.showTip("提示","绑定失败");
			}
			setTimeout(function(){
				top.closeMyDialog();
				top.closeSrcDialog();				
			},1100);
			
			$('.zhezhao').hide();
			 $(".zz_xiuGaiMiMa").hide();
				
			
		},
		error:function(){
			
			top.showTip("提示","绑定失败(请检查网络)");
			setTimeout(function(){
				top.closeMyDialog();
				top.closeSrcDialog();				
			},1100);
			
		}
	});
	
	
}

</script>









