$(document).ready(function(){
	IntakeApprovalDataRetrieveAjaxCall();
	$(document).on('change', '.approval', function () {
		var name =  $(this).attr('name');
		
		var value = $("input[name='"+name+"']:checked").val();
		
		
		if(value == "yes")
			{
			var index=$(this).index('.yes');
			$('.intakeApproval').eq(index).val('Approved');	
			
			}else if(value=="no")
			{
		    var index=$(this).index('.no');
	    	$('.intakeApproval').eq(index).val('Rejected');
			}
	    	else if(value =="neutral")
	    	{
	    	var index=$(this).index('.neutral');
	    	$('.intakeApproval').eq(index).val('Decision pending');
	    	}
	});
	$(document).on('change', '.intakeApproval', function () {
		
		
		var value = $(this).val();
		
		var index=$(this).index('.intakeApproval');
		if(value == "Approved")
			{
			
			var name =  $('.yes').eq(index).prop('checked',true);
			}else if(value=="Rejected")
			{
	    	$('.no').eq(index).prop('checked',true);
			}
	    	else if(value =="Decision pending")
	    	{
	    	$('.neutral').eq(index).prop('checked',true);
	    	}
	});
      });
function IntakeApprovalDataRetrieveAjaxCall()
{
	$.ajax({
        url: "IntakeStakeHolderDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve Stake Holder json array----->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            var index=0;
            var checkData = false;
            var CurrentUser;
            $.each(data, function(key, value){
               if(index==0)
            	{
            	   $("#ApprovalDetails").html("");
            	   checkData = value.checkExistence;
            	   CurrentUser = value.username;
            	}
               else if(checkData&&index!=0)
            	{
            	   var name =(value.name == undefined)?"":value.name;
            	   var emailid =(value.emailId==undefined)?"":value.emailId;
            	   var username =(value.username==undefined)?"":value.username;
            	   var role = (value.role==undefined)?"":value.role;
            	   var IntakeApproval = value.intakeApproval;
   
            	   var checkToggleApprove = "";
            	   
            	   var checkToggleNotApprove = "";
            	   
            	   var checkToggleNotYet = "";
            	   
            	   var ApprovedStatus = "";
            	   
            	   var RejectedStatus = "";
            	   
            	   var YettoDecideStatus = "";
            	   
            	   switch(IntakeApproval)
            	   {
            	      case "Approved":
            	    	    checkToggleApprove="checked";
            	    	    ApprovedStatus = "selected";
            	    	    break;
            	      
            	      case "Rejected":
            	    	    checkToggleNotApprove = "checked";
            	    	    RejectedStatus = "selected";
            	    	    break;
            	    	  
            	      case "Decision pending":
            	    	   checkToggleNotYet = "checked";
            	    	   YettoDecideStatus ="selected";
            	    	   break;
            	   }
            	   var currentUserClass="";
            	   var checkDisable = "disabled";
            	   if(CurrentUser==name)
            	   {
            	     checkDisable = "";
            	     currentUserClass="CurrentUser";
            	   }
            	   
            	   var intakeApproval = (value.intakeApproval==undefined)?"":value.intakeApproval;
            	   var readonly ="readonly";
            	   
            	   if(role==undefined||role == "" && emailid==undefined || emailid=="" && username == undefined || username =="" && name =="" ||name == undefined)
            		   readonly ="";
            	   
            	  var Row = "<tr>"+
      						"<td style='text-align:center;vertical-align: middle;'class='UserName' >"+name+"</td>"+
      						"<td style='text-align:center;vertical-align: middle;'>"+role+"</td>"+
      						"<td style='text-align:center;vertical-align: middle;'>"+
      						"<select class='intakeApproval'"+checkDisable+">"+
      						"<option value='Approved'"+ApprovedStatus+">Approved</option>"+
      						"<option value='Rejected'"+RejectedStatus+">Rejected</option>"+
      						"<option value='Decision pending'"+YettoDecideStatus+">Decision pending.</option>"+
      						"</select>" +
      						"<input type='hidden' class='"+currentUserClass+"' value='"+index+"'/>"+
      						"</td>"+
      						"<td>"+
      						"<div class='wrapper'>"+
    					    "<label class='btn_container'>"+
      					    "<input type='radio' class='yes approval' name='radio"+index+"' ng-model='$scope.teste' value='yes' "+checkDisable+" "+checkToggleApprove+">"+
      						"<div class='checkmark'><i class='ion-checkmark-round'></i></div>"+
    						"</label>"+
    						"<label class='btn_container' >"+
      						"<input type='radio' class='neutral approval' name='radio"+index+"' model='$scope.teste' value='neutral' "+checkDisable+" "+checkToggleNotYet+">"+
      						"<div class='checkmark'><i class='ion-record'></i></div>"+
    						"</label>"+
    						"<label class='btn_container'>"+
      						"<input type='radio' class='no approval' name='radio"+index+"' ng-model='$scope.teste' value='no' "+checkDisable+" "+checkToggleNotApprove+">"+
      						"<div class='checkmark'><i class='ion-close-round'></i></div>"+
    						"</label>"+
  							"</div>"+
      						"</td>"+
      						"</tr>";
            	  $("#ApprovalDetails").append(Row);
            	}
            	index++;
            });
            if(!checkData)
            {
            	notification("info","No user data found, please click add button to add row.","Info");
            
            }
        },
        error: function (e) {
            console.log(e);
        }

    });
	
}