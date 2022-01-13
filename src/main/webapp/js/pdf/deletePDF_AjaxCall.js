function deletePDFAjaxCall(path){
	$.ajax({ 
		 url: "deletePDFservlet",
		 type: 'POST',
		 async: false,
	     dataType: "json",
	     data: {path:path},
	     success: function (data) {
	    	 var statusFlag = data.statusFlag;
	        // o.preventDefault();
	     },
	  error: function (e) { console.log(e); }	  
	  });
}