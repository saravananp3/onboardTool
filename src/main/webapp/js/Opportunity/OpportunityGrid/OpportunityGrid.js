$(document).ready(function() {
	$.ajax({
        url: "ModuleAccessInfoServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
        	console.log("data-->",data);
        	if (!$.isArray(data)) {
                data = [data];
            }
            $.each(data, function(key, value){
            	var moduleName = value.ModuleName;
            	var checkExistence = value.checkExistence;
            	var OverallApproval = value.OverallApproval;
            	moduleAccess(moduleName,checkExistence,OverallApproval)
            });
        },
        error: function (e) {
            console.log(e);
        }
    });
	
		});
function moduleAccess(moduleName,checkExistence,OverallApproval)
{
	switch(moduleName)
	{
	case "Intake":
		if(checkExistence)
		{
			if(OverallApproval =="true")
			{
			 $("#IntakeNavigation").attr("href","");
			 $("#IntakeNavigation").attr("href","IntakeReviewDetails.jsp");
			}
		}
		break;
	}

}