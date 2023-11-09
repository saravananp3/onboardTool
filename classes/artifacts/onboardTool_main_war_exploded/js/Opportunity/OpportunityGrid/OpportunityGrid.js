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
            	var completeStatus=value.completeStatus;
            	var cuurrentModule=value.cuurrentModule;
            	moduleAccess(moduleName,checkExistence,OverallApproval,completeStatus,cuurrentModule)
            });
        },
        error: function (e) {
            console.log(e);
        }
    });
	
		});
function moduleAccess(moduleName,checkExistence,OverallApproval,completeStatus,cuurrentModule)
{
	switch(moduleName)
	{
	case "Intake":
	    
		
			 if(cuurrentModule=="StakeHolder" &&completeStatus=="Yes"){
					 $("#IntakeNavigation").attr("href","");
			 $("#IntakeNavigation").attr("href","IntakeReviewDetails.jsp");

			
			}else if(cuurrentModule=="StakeHolder" &&completeStatus=="No"){
					 $("#IntakeNavigation").attr("href","");
			 $("#IntakeNavigation").attr("href","IntakeStakeHolder.jsp");

			
			}else if(cuurrentModule=="Assesment" &&completeStatus=="Yes"){
					 $("#IntakeNavigation").attr("href","");
			 $("#IntakeNavigation").attr("href","IntakeStakeHolder.jsp");

			
			}else if(cuurrentModule=="Assesment" &&completeStatus=="No"){
					 $("#IntakeNavigation").attr("href","");
			 $("#IntakeNavigation").attr("href","IntakeAssessment.jsp");

			
			}

			else if(cuurrentModule=="TriageSummary" &&completeStatus=="Yes"){
				 $("#IntakeNavigation").attr("href","");
			 $("#IntakeNavigation").attr("href","IntakeAssessment.jsp");
			}else if(cuurrentModule=="TriageSummary" &&completeStatus=="No"){
					 $("#IntakeNavigation").attr("href","");
			 $("#IntakeNavigation").attr("href","IntakeTriage.jsp");

			}
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



	


