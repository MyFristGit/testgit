$(function(){		
	//延迟加载
	$(".scrollLoading").scrollLoading();
		
	//兼容placeholder
	supportPlaceholder="placeholder" in document.createElement("input"),placeholder=function(a){var c=a.attr("placeholder"),b=a.defaultValue;if(!b){a.val(c).addClass("phcolor")}a.focus(function(){if(a.val()==c){$(this).val("")}});a.blur(function(){if(a.val()==""){$(this).val(c).addClass("phcolor")}});a.keydown(function(){$(this).removeClass("phcolor")})};if(!supportPlaceholder){$("input").each(function(){text=$(this).attr("placeholder");if($(this).attr("type")=="text"){placeholder($(this))}})};

	//swiper 轮播图
	var swiper_banner = new Swiper('.index-swiper .swiper-container', {
	 pagination: '.index-swiper .swiper-pagination',
      paginationClickable: true,
      loop: true,
      autoplay:4000,
      autoplayDisableOnInteraction : false,
//    nextButton: '.index-banner .arrow-right',
//	  prevButton: '.index-banner .arrow-left',
	});
	
	//教师服务
	var teacherSwiper = new Swiper('.teacher-swiper .swiper-container', {
      paginationClickable: true,
      loop: false,
      nextButton: '.teacher-swiper .btn-right',
	  prevButton: '.teacher-swiper .btn-left',
	});

	$('.tab li').click(function(){
		$(this).addClass('active').siblings().removeClass('active')
	})
	
	//返回顶部
    $(window).scroll(function(){
        var scrolltop=$(this).scrollTop();    
        if(scrolltop>=400){   
            $("#goBackTop").show();
        }else{
            $("#goBackTop").hide();
        }
    });   
    $("#goBackTop").click(function(){
      $("html,body").animate({scrollTop: 0}, 500);  
    });   
    
	$('#loginWin .btn-no').click(function(){
		$('#loginWin').hide();
	})
  	
  	$('#btnLogin').click(function(){
  		$('#loginWin').show();
  	})
  	
  	$('#funWin .btn-no').click(function(){
		$('#funWin').hide();
	})
  	
  	
  	$('.identity li').click(function(){
  		$(this).addClass('active').siblings().removeClass('active')
  	})
  

  	$('.winleft .icon').click(function(){
  		$(this).toggleClass('active')
  	})
  	
  	var indexNavTop = $('.index-nav').offset().top-80;
  	console.log(indexNavTop)
  	$('.head .item').click(function(){
  		scrollService()
  	});
  	function scrollService(){
  		$("html,body").animate({scrollTop: indexNavTop+'px'}, 500); 
  	}
});