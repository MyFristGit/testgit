function process(code){
	//alert(code);
	window.location.href= "taskCenter_sp.html?code=" + code;
}

function imageName(name){
	alert(name);
	//img_name.html?name=
}


function subgo(id){

	$.post('serviceByMyType.html?id='+id, function(data) {
		$('#sfqhContent').html(data);
		dialogAddEvent();
	});
	
	
	
}


function to_sp(){
	window.location.href="taskCenter_sp.html";
}


function del(n)
{
 var s=document.getElementById('s');
 var t=s.getElementsByTagName("li");
 alert(t.length);
 for (var i=0;i<t.length;i++)
 {
	 alert("Item "+i+": "+t.item(i).innerHTML); 
  if (i==n-1)
  {
   s.removeChild(t.item(i));
  }
 }
}