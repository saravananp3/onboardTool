$(document).ready(function() {
	enableSaveButtonFunction()
	
		});
$("#save").click(function(e)
{
	var checkMandatory = true;
	var jsonArr = [];
	var RowLength = $(".UserRow").length;
	for(var i =0; i<RowLength; i++)
	{
	  var inputs = {};
      
	  var name = $('.name').eq(i).val();
      
      var email = $('.emailid').eq(i).val();
      
      var username = $('.username').eq(i).val();
      
      var role = $(".role").eq(i).val();
      
      var priorityNum = $(".priorityNum").eq(i).val();
     
      if( name=="" || email=="" || username=="" || role=="" || priorityNum=="")
    	{
    	  checkMandatory = false;
    	}
      else
       {
    	inputs["name"] = name;
    	
    	inputs["emailid"] = email;
        if(IsEmail(email)==false)
        {
          notification("warning","Invalid emailid.","Warning!");
          $(".emailid").eq(i).focus();
          return false;
        }
    	inputs["username"] = username;
    	
    	inputs["role"] = role;
    	
    	inputs["priorityNum"] = priorityNum;
    	jsonArr.push(inputs);
       }
      
	}
	
	if(checkMandatory)
	{
	console.log("JSON Array save --->",jsonArr);
	var jsonObj = SaveAjaxCall(jsonArr);
	
	if(!jsonObj.checkUser)
	{
		e.preventDefault();
		notification("warning","Username already exist for this opportunity.","Warning!!");
	}
	if(!jsonObj.checkName)
	{
		e.preventDefault();
		notification("warning","Name already exist for this opportunity.","Warning!!");
	}
	if(!jsonObj.checkEmail)
	{
		e.preventDefault();
		notification("warning","EmailId already exist for this opportunity.","Warning!!");
	}
	if(!jsonObj.checkRole)
	{
		e.preventDefault();
		notification("warning","Role already exist for this opportunity.","Warning!!");
	}
    if(jsonObj.CheckSave)
     {
	       document.getElementById("complete").disabled = false;
    	   document.getElementById("next").disabled = false;
    	   e.preventDefault();
            notification("success","Saved Successfully.","Note");
       
  
            IntakePreviewDataRetrieveAjaxCall();
           
            IntakeApprovalDataRetrieveAjaxCall();
            
            
            
    	
    	
    	
    	
     }
	}
	else
	{
	  e.preventDefault();
	  notification("warning","Please fill the fields.","Warning");
	}
	
});
function IsEmail(email) {			
	  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  if(!regex.test(email)) {
	    return false;
	  }else{
	    return true;
	  }
	}
function SaveAjaxCall(jsonArr)
{
	var json =[];
	$.ajax({
        url: "IntakeStakeHolderSaveServlet",
        type: 'POST',
        async: false,
        data : {JsonArray:JSON.stringify(jsonArr)},
        dataType: "json",
        success: function (data) {
        console.log("data save  -->",data);
        json = data;
        },
        error: function (e) {
            console.log(e);
        }

    });
  return json;
}
$(document).on('click', '#complete', function(e) {
				
		$.ajax({
	    url: "IntakeTriageSummaryCompletedServlet",
		type: 'POST',
		async: false,
		data : {completeType : "StakeHolder"},
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
               
              			document.getElementById("save").disabled = false;
              			notification("success", "Current Page is editable", "Note:");

 
               
	        e.preventDefault();
			});
			
			
			
		function enableSaveButtonFunction(e){
			$.ajax({
	    url: "IntakeCompleteStatus",
		type: 'POST',
		async: false,
		data : {completeType : "StakeHolder"},
		dataType: "json",
		success: function(data) {
			console.log("Completed DATA:", data);
			JsonObject = data;
			if (data.iscompleted==true) {
			document.getElementById("save").disabled = true;

			}else{
			document.getElementById("save").disabled = false;

								
							}
			
		}
		
	});
	e.preventDefault();

		}	


	