	var typeid=1;	
	function subgo(typeId){
		$.post('serviceByType.html?id='+typeId, function(data) {
			$('#serviceContent').html(data);
		});
		typeid=typeId;
		alert(typeid);
	}
	
	function student(){
		alert("************");
	}
	
	function teacher(){
		alert("teacher.");
	}
	
	function zx(){
		$.post('serviceByType.html?id='+typeid, function(data) {
			$('#serviceContent').html(data);
		});
	}
	function zh(){
		$.post('serviceByZH.html?id='+typeid, function(data) {
			$('#serviceContent').html(data);
		});
	}
	
	function qb(){
		$.post('serviceByQB.html?id='+typeid, function(data) {
			$('#serviceContent').html(data);
		});
	}