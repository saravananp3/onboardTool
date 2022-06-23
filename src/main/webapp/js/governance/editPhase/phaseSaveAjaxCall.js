
$("#create").click(function(e)
{
	var id=$("#Id").val();
	var phaseName = $("#phaseName").val();
	var phaseId = $("#phaseId").val();
	var checkMandatory = true;
	var nameAttr = [];
	var jsonObj = [];
	if(phaseName!=""&&phaseId!="")
		{
		$(".InputField").each(function(i) {
    		var inputs = {};
    		var req=$(this).find(".required_fie").length;  
    		console.log("requied field check: ",req);
    		        if(req)
    			   {
    			   console.log("input console",$(this).find("input").length);
    			   if($(this).find("select").length)
				   {
				     var val2 =$(this).find("select").val();
				     var multiselectValue = val2;
				     if (val2 == ""||val2==undefined||val2==null)
				    	 checkMandatory = false;
				     
				     console.log("value in select : ",val2);
				   }
    			   else if($(this).find("input").length)
    				   {
    				   
    				     var val1 =$(this).find("input").val();
    				     if (val1 == ""||val1==undefined||val1==null){
    				    	 checkMandatory = false;
    				     }
    				     console.log("value in input : ",val1);
    				   }
    			    
    			   }
    		        if($(this).find("select").length)
  				   {
  				     var name2 =$(this).find("select").attr("name");
  				     var val2 =$(this).find("select").val();
  	  				 var multiselectValue = $(this).find("select").val();

  				   var classNames =$(this).find("select").attr('class');
  				   if(classNames.includes("multiselect"))
			    	 {
  					   val2="";
  					   if(multiselectValue==undefined||multiselectValue==null)
  						 multiselectValue = "";
			    	 for(var i=0;i<multiselectValue.length;i++)
			    		 val2=val2+multiselectValue[i]+",";
			    	 
			    	 val2 = val2.substring(0,val2.length-1);
			    	 }
  				     inputs["Name"]=name2;
  				     inputs["Value"]=val2;
  				     nameAttr.push(name2);
  				     console.log("name in select : ",name2);
  				  
  				   }
 		        	else
    		        if($(this).find("input").length)
    				   {
    		        	var type = $(this).find("input").attr("type");
    		        	 if(type == 'radio')
    		        		{
    		        			var nameRadio = $(this).find("input").attr("name");
    		        			var radioValue = $("input[name='"+nameRadio+"']:checked").val();
    		        			
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
    		        jsonObj.push(inputs);
    		        
    		});
    	
    	
    	console.log("name attr : ",nameAttr);
    	console.log("Json Object : ",jsonObj);
    	var JsonString = JSON.stringify(jsonObj);
    	$('#Json_sample_id').val(JSON.stringify(jsonObj));
    	
    	var checkAjax;
    	if(checkMandatory)
        var validationCheck_json = AjaxCallUpdate(phaseName,phaseId,JsonString,checkMandatory,id,e);
    	else
    		{
    		notification("warning","Please fill the mandatory fields.","Warning");
    		e.preventDefault();
    		}
}
else
{
		e.preventDefault();
		notification("warning","Phase name or Phase Id field should not be empty.","Warning");
		 return false;
}
});

function AjaxCallUpdate(phaseName,phaseId,JsonString,checkMandatory,id,e)
{
	e.preventDefault();
	var JsonObject=[];
	var checkAjax =false;
	$.ajax({
        url: "phaseSaveServlet",
        type: 'POST',
        data : {phaseName:phaseName, phaseId:phaseId ,JsonString : JsonString, checkMandatory : checkMandatory, id:id, operation:"EditPhase"},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("CREATE VALIDATION",data);
        	JsonObject = data;
        	if(data.checkphaseId){
	                     checkAjax = false;
		                	notification("warning","Phase Id is already exist.","Warning:");
		                    }
		          if(data.checkphaseName){
			                   checkAjax = false;
		                	  notification("warning","Phase name is already exist.","Warning:");
		                    
	                      }
        	   if(data.SaveStatus)
        		{
        		notification("success","New Phase successfully created.","Note:");
        		setTimeout(function()
        				{
        			      $("#ListId").click();
        				},1000);
        		}
        	    	else{
	                    e.preventDefault();
		                     notification("error","Error Occured while saving.","Error:");
        		        return false;
        		}
        	    	
           },
        error: function (e) {
            console.log(e);
        }
        
    });
return JsonObject;
}