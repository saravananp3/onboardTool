function downloadPDFAjaxCall(path){
	$.ajax({ 
		 url: "downloadPDFservlet",
		 type: 'POST',
		 async: false,
	     dataType: "json",
	     data: {path:path},
	     success: function (data) {
	    	 console.log(data);
	         //o.preventDefault();
	     },
	  error: function (e) { console.log(e); }	  
	  });
}