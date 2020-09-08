var seq_num = "";
var currentIntakeApproval = "";
var username="";
$('#ApprovalSave').click(function(){
	seq_num = "";
	currentIntakeApproval = "";
	username="";
	 seq_num = parseInt($(".CurrentUser").eq(0).val());
	 currentIntakeApproval = $(".intakeApproval").eq(seq_num-1).val();
	username =$(".UserName").eq(seq_num-1).html();
	var checkOverAllAapproval = true;
	for(var i =0;i<$(".intakeApproval").length;i++)
	{
	   var val = $(".intakeApproval").eq(i).val();
	   if(val!="Approved")
		   checkOverAllAapproval = false;
	}
	if(checkOverAllAapproval==true)
	{
		$("#ConfirmationPopUp_Btn").click();
	
		
	}
	else
	{
		var checkStatus = ApprovalSaveAjaxCall(seq_num,currentIntakeApproval);
		if(checkStatus.checkStatus==true)
		{
			IntakeApprovalMessage(currentIntakeApproval,username);
			
		}
		else if(checkStatus.CheckSave==false)
		{
			notification("error","Problem has occuured while saving.","Error");
		}
	}
		
	
	
});
function IntakeApprovalMessage(IntakeApproval,username)
{
	switch(IntakeApproval)
	{
	case "Approved":
		notification("info",username+" has approved.","Status");
		
		break;
	case "Rejected":
		notification("error",username+" has Rejected.","Status");
			break;
		
	case "Decision pending":
	      notification("warning",username+" is yet to decide.","Status");
	    
	      break;
		
	}
	notification("success","Saved successfully.","Status");
	
}
function ApprovalSaveAjaxCall(seq_num,IntakeApproval)
{
	var json =[];
	$.ajax({
        url: "IntakeApprovalSaveServlet",
        type: 'POST',
        async: false,
        data : {seq_no:seq_num,IntakeApproval:IntakeApproval},
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
$("#ConfirmationYes").click(function()
		{
			var checkStatus = ApprovalSaveAjaxCall(seq_num,currentIntakeApproval);
			if(checkStatus.checkStatus==true)
			{
				IntakeApprovalMessage(currentIntakeApproval,username);
				notification("info","All the users approved.","");
			}
			else if(checkStatus.CheckSave==false)
			{
				notification("error","Problem has occuured while saving.","Error");
			}
			 $("#ConfirmationClose").click();	
		});
		$("#ConfirmationNo").click(function()
				{
					 $("#ConfirmationClose").click();	
					 notification("error","Approval canceled.","");
				});