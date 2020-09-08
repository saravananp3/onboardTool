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
     
      if( name=="" || email=="" || username=="" || role=="")
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