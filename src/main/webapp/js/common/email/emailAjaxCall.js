function emailAjaxCall(moduleName){
	 $.ajax({ 
		 url: "EmailApproval",
		 type: 'POST',
		 async: false,
		 data:{moduleName:moduleName},
	     dataType: "json",
	     success: function (data) {
	    	 console.log("Data : ",data); 
	    	 if(data.checkStatus){
   		 		//$("#loading-overlay").hide();
	             notification("info","Please check your email for Approval.","Info");
	             }
	    	 if(data.priorityNumber==0){
	    		 notification("warning","Higher level users yet to decide.","warning");
	    	 }
	    },
	  error: function (e) { console.log(e); }
	  
	  });
}