window.onscroll=function(){
    
    	if($(document).scrollTop()>500){
    
        		$("#h-nav").removeClass("showon");
    
    	}
    
    	if($(document).scrollTop()<500){
    
        		$("#h-nav").addClass("showon");
    
   }
}