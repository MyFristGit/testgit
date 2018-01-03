function Event(name){
	var handlers=[];
	this.getName=function(){
		return name;
	};
	this.addHandler=function(handler){
		handlers.push(handler);		
	};
	this.removeHandler=function(handler){
		for(var i=0;i<handlers.length;i++){
			if(handlers[i]==handler){
				handlers.splice(i,1);
				break;
			}
		}
	};
	this.fire=function(eventArgs){		
		$.each(handlers,function(i,obj){			
			obj(eventArgs);
		});
	};	
}
function EventAggregator(){
	var events=[];
	function getEvent(eventName){
		return $.grep(events,function(event){
			return event.getName()===eventName;
		})[0];
	}
	this.publish=function(eventName,eventArgs){
		var event=getEvent(eventName);
		if(!event){
			event=new Event(eventName);
			events.push(event);
		}
		event.fire(eventArgs);
	};
	this.subscribe=function(eventName,handler){
		var event=getEvent(eventName);
		if(!event){
			event=new Event(eventName);
			events.push(event);
		}
		event.addHandler(handler);
	};
}





















