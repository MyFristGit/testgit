	
	function subgo(id,me){
		!notActiveIcon||notActiveIcon();
		$(".leftLi a").removeClass("aActive");
		$(me).addClass("aActive");
		$.post('serviceByType.html?id='+id, function(data) {
			$('#serviceContent').html(data);
			doTab();
			dialogAddEvent();
			
		});
	
	}
	
	$("#login_button").click(function(){
		window.location.href="login.html";
		
	});
	
	$(document).ready(function() { 
		$("#sqr").click(function(){
			window.location.href="taskCenter.html";
		});
	});
	
	$(document).ready(function() { 
		$("#shr").click(function(){
			window.location.href="taskCenter_sh.html";

		});
	});
	
	function to_sp(){
		window.location.href="taskCenter_sp.html";
	}
	
	
	$(document).ready(function() { 
		$("#search").click(function(){
			var name = $("#searchText").val();
			$.post('search.html?name='+name, function(data) {
				$('#serviceContent').html(data);
				doTab();
				dialogAddEvent();
			});
		});
	});
	
	$(document).ready(function() { 
		$("#search_taskCenter").click(function(){
			var name = $("#searchCenterText").val();
			$.post('search.html?name='+name, function(data) {
				$('#sfqhContent').html(data);
			});
		});
	});
	
	
	$(document).ready(function() { 
		$("#search_sh").click(function(){
			var name = $("#searchSHText").val();
			$.post('search_sh.html?name='+name, function(data) {
				$('#sfqhContent').html(data);
			});
		});
	});
	