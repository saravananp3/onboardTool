$("#Submit").click(function(e)
{
	    //e.stopPropagation();
	var AppName = $("#appName").val();
	console.log("Application Name", AppName)
	
	var CheckExistance;
	var CheckAppname;
	var checkMandatory = true;
	var nameAttr = [];
	var jsonObj = [];
	if(AppName!="")
		{
		//e.preventDefault();
		$(".InputField").each(function(i) {
    		var inputs = {};
    		var req=$(this).find(".required_fie").length;  
    		console.log("requied field check: ",req);
    		        if(req)
    			   {
    			   console.log("input console",$(this).find("input").length);
    			   if($(this).find("input").length)
    				   {
    				   
    				     var val1 =$(this).find("input").val();
    				     if (val1 == ""){
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
    			   else if($(this).find("select").length)
    				   {
    				     var name2 =$(this).find("select").attr("name");
    				     var val2 =$(this).find("select").val();
    				     inputs["Name"]=name2;
    				     inputs["Value"]=val2;
    				     nameAttr.push(name2);
    				     console.log("name in select : ",name2);
    				   }
    		        jsonObj.push(inputs);
    		        
    		});
    	
    	
    	console.log("name attr : ",nameAttr);
    	console.log("Json Object : ",jsonObj);
    	var JsonString = JSON.stringify(jsonObj);
    	$('#Json_sample_id').val(JSON.stringify(jsonObj));
    	
    	var checkAjax;
        var validationCheck_json = AjaxCallUpdate(AppName,JsonString,checkMandatory,CheckExistance,CheckAppname,e);
        var checkExistance =validationCheck_json.Details_VALIDATION;
    	var checkAppName = validationCheck_json.AppName_VALIDATION;
    	if(checkExistance==true)
    		{
    		checkAjax1=true;
    				console.log("The details Are Inside the",checkAjax1);
    		notification("warning","Finance Details Already Exist For the Entered Application Name","Warning");
    		
    		}
    	else
    		{
    		checkAjax1 =false;
    
    		}
    	if(checkAppName==false)
    		{
    		checkAjax = false;
    		notification("warning","Application Name Does Not Exist.","Warning");
    		//alert("Application Name already exist.");
    		}
    	else
    	{
    		checkAjax =true;
    	}
    	if(checkMandatory==false)
		{
		checkAjax = false;
		notification("warning","Please fill all the mandatory fields.","Warning");
		//alert("Please fill all the mandatory fields.");
		}
	    
    	if(checkMandatory==true &&checkAjax1==false&& checkAjax == true && checkAjax !=undefined)
	    {
    		notification("success","Finance Details Are Entered  successfully.","Note");
	    	$("#FinanceDetails").click();
	    	
	    	/*var f=document.OpportunityForm;
            f.method="post";
            f.action="OpportunityList.jsp?";
            f.submit;*/
	    } 
    	
}
else
{
		e.preventDefault();
		notification("warning","Please fill the application name field.","Warning");
		 //alert("Please fill the application name field.");
		 return false;
}
});
function DbUpdate(checkMandatory,CheckAPPID,CheckAppname)
{
	if (checkMandatory == true && CheckAPPID == true && CheckAppname == true){
		var f=document.OpportunityForm;
        f.method="post";
        f.action="NewOpportunitySave?";
        f.submit;
	}
	else{
		e.preventDefault();
		notification("warning","Please fill all Mandatory fields.","Warning");
		//alert("Please fill all Mandatory fields.");
		 
		return false;
		
	}	
}
function AjaxCallUpdate(AppName,JsonString,checkMandatory,CheckAPPID,checkAppname,e)
{
	e.preventDefault();
	var JsonObject=[];
	var checkAjax =false;
	$.ajax({
        url: "FinanceDetailsValidation",
        type: 'POST',
        data : {AppName:AppName, JsonString : JsonString, checkMandatory : checkMandatory},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("CREATE VALIDATION",data);
        	JsonObject = data;
        	    	
        	/*if(checkAPMID)
        		{
        		CheckAPPID = true;
        		e.preventDefault();
        		//alert("APM ID already exist. Please provide the unique APM ID.");
        		 
        		checkAjax  = false;
        		}
        		else
        		{
        		CheckAPPID=false;
        		checkAjax = true;
        		}
        	if(checkAppName)
        		{
        		CheckAppname = true;
        		e.preventDefault();
        		//alert("Application Name already exist.");
        		
        		checkAjax =false;
        		}
        	else
        		{
        		CheckAppname= false;
        		checkAjax =true;
        		}
        	if(checkMandatory==false)
        		{
        		//AlertBox();
        		//e.preventDefault();
        		
        		checkAjax = false;
        		}
        	    if(checkMandatory==true && CheckAPPID ==false && checkAppname == false)
        	    {
        	    	
        	    	checkAjax =true;
        	    }
        return checkAjax;	*/
        },
        error: function (e) {
            console.log(e);
        }
        
    });
return JsonObject;
}
function AlertBox()
{
	notification("warning","Please fill all Mandatory fields.","Warning");
	//alert("Please fill all the mandatory fields.");
return false;
}