<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!doctype html>
<html>
    <head>
    <meta charset="utf-8">
    	<title>云服务</title>
		<link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>
	<body style="background:#999;">
    	<div class="my" style=" width:80px; height:40px; line-height:40px; margin:400px auto 0; border:1px solid #666; text-align:center;">
        	点击看效果
        </div>
        
        <div class="zhezhao" style=" padding:10% 5%;">
        </div>	
        <div class="cgsp c">
            <span class="guanbi" style="z-index:99999;"></span>
            <div class="fl">
                <div class="conter">
                    <div class="top_img"><img src="images/yunfuw_img.jpg"></div>
                    <div class="sydx">
                        <span>适用对象</span>
                        <i>教师</i>
                        <strong>教师</strong>
                    </div>
                    <div class="fenxiang">
                        <ul>
                            <li class="ico_1">
                                <span>赞？</span>
                                <i>6 likes</i>
                            </li>
                            <li class="ico_2">
                                <span>49浏览</span>
                            </li>
                            <li class="ico_3">
                                <span>分享</span>
                            </li>
                            <li class="ico_4">
                                <span>收藏</span>
                            </li>
                            <li class="ico_5">
                                <span>评论</span>
                            </li>
                        </ul>
                        <a href="#">跳转至服务</a>
                    </div>
                </div>
            </div>
            <div class="fr">
                <div class="conter">
                    <div class="text_top">
                        <span>最新服务</span>
                        <h4>
                            <span>教职工因公短期出国申请审批</span>
                            <i>办理时间</i>
                            <i>周一至周五</i>
                            <i>早9点至下午5点</i>
                        </h4>
                        <h5>服务简介</h5>
                        <p>
                            为所有教职工（出科教人员）提供短期出国申请，经过国合处初审后单位初审公示，由经管部门初审，经费主管部门审核，提交财务部审批，单位出示公示后经单位审批，在																 							根据所在行政级别有组织不审批，分管校领导神品后，最终提交国合出审批，外交主管校领导审批，校长审批，校办秘书审批，校长书记审批后最终由国合处制作批文。
                        </p>
                    </div>
                    <div class="liucheng">
                        <img src="images/liucheng_img.jpg">
                    </div>
                    <div class="foot">
                        <h5>类似服务</h5>
                        <ul>
                            <li>
                                <a href="#">
                                    <i><img src="images/foot_img1.jpg"></i>
                                    <p>招聘信息</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="images/foot_img2.jpg"></i>
                                    <p>多彩园区</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i><img src="images/foot_img3.jpg"></i>
                                    <p>吃货指南</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
<script>
	$(function(){
		$('.my').click(function(){
			$('.zhezhao').show();
			$('.cgsp').show();
		})
		$('.guanbi').click(function(){
			$('.zhezhao').hide();
			$('.cgsp').hide();
		})
	});
</script>