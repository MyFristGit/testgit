<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="lzq" uri="http://www.weijia.cn/mytag"%>
<div class="tob">
                                	<h4>
                                        <strong>事项名称</strong>
                                        <i>&nbsp;</i>
                                        <span>状态</span>
                                        <em>更改时间</em>
                                    </h4>
                                	<ul class="tr">
                                    	<c:forEach items="${pageInfo.processList}" var="process">
                                    	<li>
                                        	<div class="top">
                                                <a  href="${process.url}" target="_Blank"><h5>${process.name}</h5></a>
                                                <span>
                                                	<div class="bord">
                                                		<strong>受理中</strong>
                                                        <em></em>
                                                    </div>
                                                </span>
                                                <i>${process.updateDate }</i>
                                            </div>
                                            <div class="bottom">
                                            	<ul class="c">
                                            	<c:forEach items="${process.actionInfoList}" var="action">
                                            		<c:choose>
                                            			<c:when test="${action.actionUser != null}">
	                                            			<li class="c">
		                                                    	<span>
		                                                        	<h5>${action.name}</h5>
		                                                        	<em><lzq:date value="${action.actionTime}"/> </em>
		                                                            <i class="ico"></i>
		                                                        </span>
		                                                        	<strong class="spr">${action.actionUser}&nbsp;&nbsp;&nbsp;${action.actionName}</strong>
	                                                    	</li>	
                                            			</c:when>
                                            			<c:otherwise>
                                            				<li class="c">
		                                                    	<span>
		                                                        	<h5>${action.name}</h5>
		                                                            <i class="ico_1"></i>
		                                                        </span>
		                                                        <strong class="spr">${action.assignUser}&nbsp;&nbsp;&nbsp;${action.actionName}</strong>
                                                    		</li>
                                            			</c:otherwise>
                                            		</c:choose>
                                                	
                                                 </c:forEach>
                                                </ul>
                                            </div>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>
<script>
	$(function(){
		$('.grzx .ico').each(function(){/*遍历数字*/
			var thishtml=parseInt(($(this).find('p').html()));
			if(thishtml>=1){
				$(this).find('p').show();
			}	
		});
		$('.denglu').hover(function(){
			$('.xiala').show();
		},function(){
			$('.xiala').hide();
		});
		$('.top_right > .denglu').click(function(){
			$('.zhezhao').show();
			$('.zz_denglu').show();
		})
		$('.guanbi').click(function(){
			$('.zhezhao').hide();
			$('.zz_denglu').hide();
		})
		
		$(".zz_denglu .form input").focus(function(){
			$(this).parent().addClass("link");
		});
		$(".zz_denglu .form input").blur(function(){
			var thisval = $(this).val();
			if(thisval==""){
				$(this).parent().removeClass("link");
			};
		});
		$('.tr li .top').each(function(){
			var thishtml=$(this).find('span strong').text();
			if(thishtml=="受理中"){
				$(this).find('span').addClass("huang");
			}else if(thishtml=="完成"){
				$(this).find('span').addClass("lue");
				//$(this).find('span').append("<b>评论留言</b>"); 
			}else if(thishtml=="失败"){
				$(this).find('span').addClass("hong");
			}else{};
			$(this).find('span b').click(function(){
				$('.zhezhao').show();
				$('.pinglun').show();
			});
		});
		$('.pinglun .form .but span').click(function(){
			$('.zhezhao').hide();
			$('.pinglun').hide();
		})
		
		$(".tob .tr li .top .bord").click(function(){
			$(this).parents('li').find('.bottom').slideToggle();
			$(this).toggleClass("link"); 
		})

		
		$('.left,.right').height($(window).height()-76);
	});
</script>                                