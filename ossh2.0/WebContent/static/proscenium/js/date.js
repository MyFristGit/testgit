//本js主要处理日期
   function getWeekByDay(dayValue){ //dayValue=“2014-01-01”
	 var day = new Date(Date.parse(dayValue.replace(/-/g, '/'))); //将日期值格式化 
	    var today = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六"); //创建星期数组
	    return today[day.getDay()];  //返一个星期中的某一天，其中0为星期日 
   }
   function getWeekByDayNumber(dayValue){ //dayValue=“2014-01-01”
		 var day = new Date(Date.parse(dayValue.replace(/-/g, '/'))); //将日期值格式化 									 
		return day.getDay();  //返一个星期中的某一天，其中0为星期日 
	}
     
   function dateAdd(dd,n){
	 var strs= new Array(); 
	 strs = dd.split("-");
	 var y = strs[0];
	 var m = strs[1];
	 var d = strs[2];
	 var t = new Date(y,m-1,d);
	 var str = t.getTime()+n*(1000*60*60*24);
	 var newdate = new Date();
	 newdate.setTime(str);
	 var strYear=newdate.getFullYear();   
	    var strDay=newdate.getDate();
	    if(strDay < 10){
	     strDay = "0"+strDay;
	    }   
	    var strMonth=newdate.getMonth()+1;   
	    if(strMonth < 10){   
	        strMonth = "0"+strMonth;   
	    }   
	    var strdate=strYear+"-"+strMonth+"-"+strDay;   
	    return strdate;
	}
	 function isLeapYear(year) {
		     return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
	 }
	 function getMonthDays(year, month) {
	    return [31, null, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month] || (isLeapYear(year) ? 29 : 28);
	 }
	 
	 function getDaysOfYear(y, m, d){
		 var now = new Date(y, m - 1, d),
		 year = now.getFullYear(),
		 month = now.getMonth(),
		 days = now.getDate();
		 //那一天是那一年中的第多少天
		 for (var i = 0; i < month; i++) {
			 days += getMonthDays(year, i);
		 }
		 return days;
	 }
	//计算天数差的函数，通用  
   function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式  
       var  aDate,  oDate1,  oDate2,  iDays  
       aDate  =  sDate1.split("-")  
       oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2006格式  
       aDate  =  sDate2.split("-")  
       oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
       iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
       return  iDays ; 
   }   
 function  DateDiffActual(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式  
       var  aDate,  oDate1,  oDate2,  iDays  
       aDate  =  sDate1.split("-")  
       oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2006格式  
       aDate  =  sDate2.split("-")  
       oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
       iDays  =  parseInt((oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
       return  iDays ; 
   }   
	function getWeekNumber(y, m, d) {
		 var now = new Date(y, m - 1, d),
			 year = now.getFullYear(),
			 month = now.getMonth(),
			 days = now.getDate();
		 //那一天是那一年中的第多少天
		 for (var i = 0; i < month; i++) {
			 days += getMonthDays(year, i);
		 }
	 
		 //那一年第一天是星期几
		// var yearFirstDay = new Date(year, 0, 1).getDay() || 7;
		 
		  var yearFirstDay = new Date(year, 0, 1).getDay();
		//计算是第几周
		days += yearFirstDay;
		var week = Math.ceil(days / 7);
		return week;
    }
	
	function getWeekNumberBeginSeptember(y, m, d) {
		 var now = new Date(y, m - 1, d),
			 year = now.getFullYear(),
			 month = now.getMonth(),
			 days = now.getDate();
		 //那一天是那一年中的第多少天
		 for (var i = 0; i < month; i++) {
			 days += getMonthDays(year, i);
		 }
		
		 var  septemberDay=new Date(y, 9 - 1, d);
			 year = now.getFullYear(),
			 month = now.getMonth(),
			 days = now.getDate();
		 //那一天是那一年中的第多少天
		 for (var i = 0; i < month; i++) {
			 days += getMonthDays(year, i);
		 }
		 
	 
		 //那一年第一天是星期几
		// var yearFirstDay = new Date(year, 0, 1).getDay() || 7;
		 
		  var yearFirstDay = new Date(year, 0, 1).getDay();
		//计算是第几周
		days += yearFirstDay;
		var week = Math.ceil(days / 7);
		return week;
    }