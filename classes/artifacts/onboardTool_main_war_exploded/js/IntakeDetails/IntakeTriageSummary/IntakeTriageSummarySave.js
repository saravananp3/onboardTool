$(document).ready(function() {
	enableSaveButtonFunction()
	
		});



$("#createTriSummary").click(function(e)
{
	    //e.stopPropagation();
	
	
	var checkMandatory = true;
	var nameAttr = [];
	var jsonObj = [];

		//e.preventDefault();
		$(".InputFieldSummary").each(function(i) {
    		var inputs = {};
    		var req=$(this).find(".required_fie").length;  
    		console.log("requied field check: ",req);
    		        if(req)
    			   {
    			   console.log("input console",$(this).find("input").length);
    			   if($(this).find("input").length)
    				   {
    				     var val1 =$(this).find("input").val();
    				     var type = $(this).find("input").attr("type");
     		        	if(type == 'radio')
     		        		{
     		        			var nameRadio = $(this).find("input").attr("name");
     		        			/*var radioValue = $("input[name='"+nameRadio+"']:checked").val();*/
     		        			var radioValue = "";
     		        			$.each($("input[name='"+nameRadio+"']:checked"), function() {
									radioValue += $(this).val()+",";
								});
     		        			radioValue = radioValue.substring(0,radioValue.length-1);
     		        			if(radioValue==""||radioValue==undefined)
     		        				{
     		        				checkMandatory = false;
     		        				}
     		        			
     		        		}
     		        	else if(type == 'checkbox'){
     		        		var nameCheckbox = $(this).find("input").attr("name");
 		        			var CheckboxValue = "";
 		        			$.each($("input[name='"+nameCheckbox+"']:checked"), function(){
 		        				CheckboxValue += $(this).val()+",";
 		                    });
 		        			CheckboxValue = CheckboxValue.substring(0,CheckboxValue.length-1);
 		        			if(CheckboxValue=="")
 		        				{
 		        				checkMandatory = false;
 		        				}
     		        	}
     		        	else if (val1 == ""){
    				    	 checkMandatory = false;
    				     }
    				     console.log("value in input : ",val1);
    				   }
    			   else if($(this).find("select").length)
    				   {
    				     var val2 =$(this).find("select").val();
    				     if (val2 == ""){
    				    	 checkMandatory = false;
    				     }
    				     console.log("value in select : ",val2);
    				   }
    			   }
    		        if($(this).find("input").length)
    				   {
    		        	var type = $(this).find("input").attr("type");
    		        	if(type == 'radio')
    		        		{
    		        			var nameRadio = $(this).find("input").attr("name");
    		        			var radioValue = "";
     		        			$.each($("input[name='"+nameRadio+"']:checked"), function() {
									radioValue += $(this).val()+",";
								});
     		        			radioValue = radioValue.substring(0,radioValue.length-1);
    		        			inputs["Name"]=nameRadio;
    	    				    inputs["Value"]=radioValue;
    		        			
    		        		}
    		        	else if(type == 'checkbox'){
    		        		var nameCheckbox = $(this).find("input").attr("name");
		        			var CheckboxValue = "";
		        			$.each($("input[name='"+nameCheckbox+"']:checked"), function(){
		        				CheckboxValue += $(this).val()+",";
		                    });
		        			CheckboxValue = CheckboxValue.substring(0,CheckboxValue.length-1);
		        			inputs["Name"]=nameCheckbox;
	    				    inputs["Value"]=CheckboxValue;
    		        	}
    		        	else
    		        		{
    				     var name1 =$(this).find("input").attr("name");
    				     var val1 =$(this).find("input").val();
    				     inputs["Name"]=name1;
    				     inputs["Value"]=val1;
    				     nameAttr.push(name1);
    				     console.log("name in input : ",name1);
    		        		}
    		        }
    			   else if($(this).find("select").length)
    				   {
    				     var name2 =$(this).find("select").attr("name");
    				     var val2 =$(this).find("select").val();
    				     inputs["Name"]=name2;
    				     inputs["Value"]=val2;
    				     nameAttr.push(name2);
    				     console.log("name in select : ",name2);
    				   }
    				   
    				   console.log(jsonObj);
    		        jsonObj.push(inputs);
    		        
    		});
    	
    	
    	console.log("name attr : ",nameAttr);
    	console.log("Json Object : ",jsonObj);
    	var JsonString = JSON.stringify(jsonObj);
    	
    	
       
      
	    
    	if(checkMandatory==true)
	    {
    		 var validationCheck_json = AjaxCallUpdate(JsonString,e);
    		 notification("success","Triage Summary details saved successfully.","Note");
    		 document.getElementById("next").disabled = false;
    		 document.getElementById("complete").disabled = false;
    		 

	    }
    	else
    		{
    		e.preventDefault();
    		notification("warning","Please fill the Mandatory Fields.","Warning");
    		//alert("Please fill the mandatory field.");
    		}
    	
    	 

});


function AjaxCallUpdate(JsonString,e)
{
	e.preventDefault();
	var JsonObject=[];
	var checkAjax =false;
	
	$.ajax({
        url: "IntakeTriageSummarySaveFeature",
        type: 'POST',
        data : {JsonString : JsonString},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("CREATE VALIDATION",data);
        	JsonObject = data;
        	    	
        	
        },
        error: function (e) {
            console.log(e);
        }
        
    });
return JsonObject;
}
function AlertBox()
{
	notification("warning","Please fill the Mandatory Fields.","Warning");
	//alert("Please fill all the mandatory fields.");
return false;
}

$(document).on('click', '#complete', function(e) {
				$.ajax({
	    url: "IntakeTriageSummaryCompletedServlet",
		type: 'POST',
		async: false,
		data : {completeType : "TriageSummary"},
		dataType: "json",
		success: function(data) {
			console.log("Completed DATA:", data);
			JsonObject = data;
			if (data.iscompleted==true) {
				
				notification("success", "Completed successfully.", "Note:");
				checkRoles = true;
			}
			
		}
		
	});
	e.preventDefault();
			});
			
			$(document).on('click', '#edit', function(e) {
               
              			document.getElementById("createTriSummary").disabled = false;
              			notification("success", "Current Page is editable", "Note:");

 
               
	        e.preventDefault();
			});
			
			
			
		function enableSaveButtonFunction(e){
			$.ajax({
	    url: "IntakeCompleteStatus",
		type: 'POST',
		async: false,
		data : {completeType : "TriageSummary"},
		dataType: "json",
		success: function(data) {
			console.log("Completed DATA:", data);
			JsonObject = data;
			if (data.iscompleted==true) {
			document.getElementById("createTriSummary").disabled = true;

			}else{
			document.getElementById("createTriSummary").disabled = false;

								
							}
			
		}
		
	});
	e.preventDefault();

		}	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	  