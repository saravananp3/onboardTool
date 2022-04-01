var currentUrl = window.location.href;
var url = new URL(currentUrl);
var a_Id = url.searchParams.get("a_id");
var dependencyColumn = "";
var readOnlyValue = "";
var finalCheck;
var currentUserComment = "";
var currentComment = "";
var currentUserDecision = "";
$(document).ready(function(){
    $(".intakeSection").hide();
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
        data : {aproverId:a_Id,isApprover:"true"},
        success: function (data) {
            console.log("Data Retrieve Stake Holder json array----->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            var index=0;
            var checkData = false;
            var CurrentUser;
     	   var checkDecisionFlag;

            $.each(data[0], function(key, value){
               if(index==0)
            	{
            	   $("#ApprovalDetails").html("");
            	   checkData = value.checkExistence;
            	   CurrentUser = value.username;
            	   checkDecisionFlag = value.checkDecision;
            	}
               else if(checkData&&index!=0)
            	{
            	   var name =(value.name == undefined)?"":value.name;
            	   var emailid =(value.emailId==undefined)?"":value.emailId;
            	   var username =(value.username==undefined)?"":value.username;
            	   var role = (value.role==undefined)?"":value.role;
            	   var IntakeApproval = value.intakeApproval;
            	   var approvalId = value.approvalId;
   
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
            	   var commentIconClass = "";
            	   var checkDisable = "disabled";
            	   if(a_Id==approvalId &&checkDecisionFlag)
            	   {
            	     checkDisable = "";
            	     currentUserClass="CurrentUser";
            	     commentIconClass = "CurrentCommentIcon";
            	     currentUserDecision = IntakeApproval;
            	     currentUserComment = value.comments;
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
      						"<td style='text-align: center;padding-top:25px;' >"+
      						  "<i class='fas fa-comment-alt fa-2x ApprovalCommentIcon "+commentIconClass+"' style='color:#87CEEB;' role='button'></i>"+
      						"</td>"+
      						"</tr>";
            	  $("#ApprovalDetails").append(Row);
            	}
            	index++;
            });
            $("#OpportunityInfoPreview").html("");
 		   $("#TriageInfoPreview").html("");
 		   $("#TriageSummInfoPreview").html("");
 		   $("#ApplicationInformationPreview").html("");
 		   $("#DataCharacteristicsPreview").html("");
 		   $("#ComplianceCharacteristicsPreview").html("");
 		   $("#ArchivalConsumptionPreview").html("");
 		   $("#ContractInformationPreview").html("");
 		   $("#StakeHolderInfoPreview").html("");
 		   
 		   
             
             
             
 	
             
             
//             var checkAssessmentDependency;
//             
//             for(var l = 0; l<data[1][3].length; l++){
//             	
//             	for(var m = 0; m<data[1][3][l].length; m++){
//             		
//             		var assessmentStyle = "";
//             		
//             		var column_name = data[1][3][l][m].ColumnName;
//             		
//             		var columnValue = data[1][3][l][m].Value;
//             		
//             		var check = checkReadOnlyData(column_name);
//             		
//             		if(checkAssessmentDependency)
//             			assessmentStyle = "display:none;";
//             		
//             		if(check){
//             			assessmentStyle = "";
//             		}
//             		else if(finalCheck){
//             			finalCheck = false;
//             			assessmentStyle = "display:none;";
//             		}
//             		if(data[1][3][l][m].ColumnName == "AppDetails" && data[1][3][l][m].section == "ApplicationInformation" && data[1][3][l][m].Value == "Third Party"){
//             			$("#ContractInformationPreview").show();
//             			$(".ContractInformationPreview").show();
//             		}
//             		var AssessmentTag ="<tr style='"+assessmentStyle+"'>\n";
//             		AssessmentTag +="<td style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>"+data[1][3][l][m].LabelName+"</td>\n";
//             		AssessmentTag += "<td style='border: 1px solid black;text-align:left;padding: 10px;'>&nbsp;"+data[1][3][l][m].Value+"</td>\n";
//             		AssessmentTag += "</tr>\n" 
// 		            
// 		            $("#"+data[1][3][l][m].section+"Preview").append(AssessmentTag);
//             		}
//             	}
//             
//             var table = "<table class='table table-bordered'>"+
//             			"<thead>"+
//       					"<tr>"+
//         				"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>Name</th>"+
//         				"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>Email</th>"+
//         				"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>User Name</th>"+
//         				"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>Role</th>"+
//         				"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>Approval Status</th>"+
//       					"</tr>"+
//     					"</thead>"+
//             			"<tbody id = 'StakeHolder'>";
//             			
//             
//             for(var n = 1; n<data[1][4].length; n++){
//             
//             	// var stakeHolderTag = "<pre
// 				// style='font-family:verdana;font-size:100%;' class =
// 				// 'stakeHolderInfoPreview'><b>"+data[1][4][n].LabelName+"</b> :
// 				// "+data[1][4][n].Value+" </pre>";
//             	table += "<tr>"+
//             				"<td>"+data[1][4][n].name+"</td>"+
//             				"<td>"+data[1][4][n].emailId+"</td>"+
//             				"<td>"+data[1][4][n].username+"</td>"+
//             				"<td>"+data[1][4][n].role+"</td>"+
//             				"<td>"+data[1][4][n].intakeApproval+"</td>"+
//             			  "</tr>";
//             }
//             table += "</tbody>"+
//             		"</table>";
//             $("#StakeHolderInfoPreview").append(table);
 		   
 		  roleBasedDataRetrieve(data[1]);

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
function checkDependency(ColumnName,Value){
	var boolean = false;
	
	var inputs = dependencyKeyValuePair();
	
	var inputsValueColumn = dependencyKeyValueColumnPair();
	
	if(inputs.hasOwnProperty(ColumnName)){
		
		if(inputs[ColumnName] == Value){
			boolean = false;
			dependencyColumn = inputsValueColumn[ColumnName];
		}
		else{
			boolean = true;
			dependencyColumn = "";
		}
		
	}
	else if(ColumnName == "ReadonlyData"){
		finalCheck = true;
		dependencyColumn = "";
		if(Value == "Yes")
			readOnlyValue = "LastUpdateMade";
		else if(Value == "No")
			readOnlyValue = "ExpectedDate";
	}
	else{
		dependencyColumn = "";
	}
	return boolean;
	
}
function dependencyKeyValuePair(){
	
	var inputs = {};
	
	// Triage Dependency
	inputs["rationalization_type"] = "Other";
	inputs["appPlatfrm"] = "Other";
	inputs["app_and_data_hosted"] = "Yes";
	inputs["compliance"] = "Yes";
	inputs["Financialdate"] = "Yes";
	inputs["TechincalDeterminingdate"] = "Yes";
	
	// Application Info Dependency
	inputs["AssessAppPlatform"] = "Others";
	inputs["ComplianceLegalDrivers"] = "Yes";
	inputs["BusinessDriversDrivers"] = "Yes";
	inputs["TechnicalDrivers"] = "Yes";
	inputs["SupportedApp"] = "No";
	
	// DataChar Dependency
	inputs["DataSetMainframe"] = "Yes";
	inputs["ReportGeneration"] = "Yes";
	// inputs["ReadonlyData"] = "Yes";
	// inputs["ReadonlyData"] = "No";
	inputs["UpDownStream"] = "Yes";
	
	// Archival Dependency
	inputs["legalhold"] = "Yes";
	inputs["specificpurgerequirements"] = "Yes";
	
	return inputs;
}

function dependencyKeyValueColumnPair(){
	
	var inputs = {};
	
	// Triage Dependency
	inputs["rationalization_type"] = "If_other_please_describe";
	inputs["appPlatfrm"] = "If_Other_describe";
	inputs["app_and_data_hosted"] = "vendor";
	inputs["compliance"] = "describe";
	inputs["Financialdate"] = "plsdescribe";
	inputs["TechincalDeterminingdate"] = "pls_describe";
	
	// Application Info Dependency
	inputs["AssessAppPlatform"] = "OtherPleaseDescribe";
	inputs["ComplianceLegalDrivers"] = "PleaseDescribe1";
	inputs["BusinessDriversDrivers"] = "PleaseDescribe2";
	inputs["TechnicalDrivers"] = "PleaseDescribe3";
	inputs["SupportedApp"] = "SupportApp";
	
	// DataChar Dependency
	inputs["DataSetMainframe"] = "plsprovideinfo";
	inputs["ReportGeneration"] = "plsprovidedetails";
	// inputs["ReadonlyData"] = "LastUpdateMade";
	// inputs["ReadonlyData"] = "ExpectedDate";
	inputs["UpDownStream"] = "plsdescribeStreams";
	
	// Archival Dependency
	inputs["legalhold"] = "ifanypleasedescribe";
	inputs["specificpurgerequirements"] = "describedetails";
	
	return inputs;
}

function checkReadOnlyData(ColumnName){
	
	var checkBoolean = false;
	
	if(ColumnName == readOnlyValue){
		checkBoolean = true;
		readOnlyValue = "";
	}
	return checkBoolean;
	
}

function roleBasedDataRetrieve(data){
	var roleName = data[data.length-1].userRole;
	
	var section_arr = [];
	switch(roleName){
	case "Project Sponsor":
		   $(".OpportunityInfoPreview").eq(0).show();
		   $(".TriageInfoPreview").eq(0).show();   
		   $(".TriageSummInfoPreview").eq(0).show();
		   $(".StakeHolderInfoPreview").eq(0).show();
		opportunityInfoDetails(data);
		TriageInfoDetails(data);
		TriageSummaryInfo(data);
		stakeHolderDetails(data,data.length-2);
		break;
	case "Project Manager":
		$(".OpportunityInfoPreview").eq(0).show();
		$(".TriageInfoPreview").eq(0).show();   
		$(".TriageSummInfoPreview").eq(0).show();
		$(".ApplicationInformationPreview").eq(0).show();
		$(".StakeHolderInfoPreview").eq(0).show();
		 $(".AssessmentInfoPreview").eq(0).show();
		section_arr = ['OpportunityInfoPreview','TriageInfoPreview','TriageSummInfoPreview','ApplicationInformationPreview'];
		opportunityInfoDetails(data);
		TriageInfoDetails(data);
		TriageSummaryInfo(data);
		AssessmentInfo(data,3);
		var checkContractInfo = data[data.length-1].contractInfo;
		if(checkContractInfo)
			AssessmentInfo(data,4);
		stakeHolderDetails(data,data.length-2);
		break;
	case "Business Owner":
		$(".OpportunityInfoPreview").eq(0).show();
		$(".TriageInfoPreview").eq(0).show();   
		$(".TriageSummInfoPreview").eq(0).show();
		$(".ApplicationInformationPreview").eq(0).show();
	    $(".ComplianceCharacteristicsPreview").eq(0).show();
		$(".ArchivalConsumptionPreview").eq(0).show();
		$(".ContractInformationPreview").eq(0).show();
		$(".StakeHolderInfoPreview").eq(0).show();
		 $(".AssessmentInfoPreview").eq(0).show();
		var checkContractInfo = data[data.length-1].contractInfo;
		opportunityInfoDetails(data);
		TriageInfoDetails(data);
		TriageSummaryInfo(data);
		AssessmentInfo(data,3);
		AssessmentInfo(data,4);
		AssessmentInfo(data,5);
		var checkContractInfo1 = data[data.length-1].contractInfo;
		if(checkContractInfo1)
			AssessmentInfo(data,6);
		stakeHolderDetails(data,data.length-2);
	    break;
	
	case "Technical S.M.E":
		$(".DataCharacteristicsPreview").eq(0).show();
		$(".AssessmentInfoPreview").eq(0).show();
		$(".StakeHolderInfoPreview").eq(0).show();
		AssessmentInfo(data,0);
		stakeHolderDetails(data,data.length-2);
		break;
		
	case "Application Owner|Development Owner":
		$(".OpportunityInfoPreview").eq(0).show();
		$(".TriageInfoPreview").eq(0).show();   
		$(".TriageSummInfoPreview").eq(0).show();
		$(".ApplicationInformationPreview").eq(0).show();
		$(".DataCharacteristicsPreview").eq(0).show();
	    $(".ComplianceCharacteristicsPreview").eq(0).show();
		$(".ArchivalConsumptionPreview").eq(0).show();
		$(".ContractInformationPreview").eq(0).show();
		$(".StakeHolderInfoPreview").eq(0).show();
		 $(".AssessmentInfoPreview").eq(0).show();
		var checkContractInfo2 = data[data.length-1].contractInfo;
		opportunityInfoDetails(data);
		TriageInfoDetails(data);
		TriageSummaryInfo(data);
		AssessmentInfo(data,3);
		AssessmentInfo(data,4);
		AssessmentInfo(data,5);
		AssessmentInfo(data,6);
		if(checkContractInfo2)
			AssessmentInfo(data,7);
		stakeHolderDetails(data,data.length-4);
	    break;
	}
} 

function AssessmentInfo(data,n){
	var checkAssessmentDependency;
	for(var m = 0; m<data[n].length; m++){
 		
 		var assessmentStyle = "";
 		
 		var column_name = data[n][m].ColumnName;
 		
 		var columnValue = data[n][m].Value;
 		
 		var check = checkReadOnlyData(column_name);
 		
 		if(checkAssessmentDependency)
 			assessmentStyle = "display:none;";
 		
 		if(check){
 			assessmentStyle = "";
 		}
 		else if(finalCheck){
 			finalCheck = false;
 			assessmentStyle = "display:none;";
 		}
 		if(data[n][m].ColumnName == "AppDetails" && data[n][m].section == "ApplicationInformation" && data[n][m].Value == "Third Party"){
 			$("#ContractInformationPreview").show();
 			$(".ContractInformationPreview").show();
 		}
 		var AssessmentTag ="<tr style='"+assessmentStyle+"'>\n";
 		AssessmentTag +="<td style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>"+data[n][m].LabelName+"</td>\n";
 		AssessmentTag += "<td style='border: 1px solid black;text-align:left;padding: 10px;'>&nbsp;"+data[n][m].Value+"</td>\n";
 		AssessmentTag += "</tr>\n" 
         
         $("#"+data[n][m].section+"Preview").append(AssessmentTag);
 		}
}

function TriageSummaryInfo(data){
	var triageStyle = "";
	for(var k = 0; k<data[2].length; k++){
   	 var TriageSummTag ="<tr style='"+triageStyle+"'>\n";
   	 TriageSummTag +="<td style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>"+data[2][k].LabelName+"</td>\n";
   	 TriageSummTag += "<td style='border: 1px solid black;text-align:left;padding: 10px;'>&nbsp;"+data[2][k].Value+"</td>\n";
   	 TriageSummTag += "</tr>\n";  
     $("#TriageSummInfoPreview").append(TriageSummTag);
    }
}

function TriageInfoDetails(data){
	var checkTriageDependency;
    for(var j = 0; j<data[1].length; j++){
    	
    	var triageStyle = "";
    	
    	var column_name = data[1][j].ColumnName;
    	
		var columnValue = data[1][j].Value;
		
    	if(checkTriageDependency)
    		triageStyle = "display:none;";
    	var TriageTag ="<tr style='"+triageStyle+"'>\n";
    	TriageTag +="<td style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>"+data[1][j].LabelName+"</td>\n";
    	TriageTag += "<td style='border: 1px solid black;text-align:left;padding: 10px;'>&nbsp;"+data[1][j].Value+"</td>\n";
    	TriageTag += "</tr>\n";  
    	checkTriageDependency = checkDependency(column_name,columnValue);
    	
    	$("#TriageInfoPreview").append(TriageTag);
    }
}

function opportunityInfoDetails(data){
	for(var i = 0; i<data[0].length; i++){
   	 var oppTag ="<tr>\n";
   	     oppTag +="<td style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>"+data[0][i].LabelName+"</td>\n";
   	     oppTag += "<td style='border: 1px solid black;text-align:left;padding: 10px;'>&nbsp;"+data[0][i].Value+"</td>\n";
   	     oppTag += "</tr>\n"         
    	$("#OpportunityInfoPreview").append(oppTag);
    }
}

function stakeHolderDetails(data,num){
	var table = "<table class='table table-bordered'>"+
		"<thead>"+
		"<tr>"+
		"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>Name</th>"+
		"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>Email</th>"+
		"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>User Name</th>"+
		"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>Role</th>"+
		"<th style='border: 1px solid black;text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>Approval Status</th>"+
		"</tr>"+
		"</thead>"+
		"<tbody id = 'StakeHolder'>";
	for(var n = 1; n<data[num].length; n++){
        
     	// var stakeHolderTag = "<pre
			// style='font-family:verdana;font-size:100%;' class =
			// 'stakeHolderInfoPreview'><b>"+data[1][4][n].LabelName+"</b> :
			// "+data[1][4][n].Value+" </pre>";
     	table += "<tr>"+
     				"<td>"+data[num][n].name+"</td>"+
     				"<td>"+data[num][n].emailId+"</td>"+
     				"<td>"+data[num][n].username+"</td>"+
     				"<td>"+data[num][n].role+"</td>"+
     				"<td>"+data[num][n].intakeApproval+"</td>"+
     			  "</tr>";
     }
     table += "</tbody>"+
     		"</table>";
     $("#StakeHolderInfoPreview").append(table);

}

$(document).on('click', '.ApprovalCommentIcon',function(){
	var index = $(this).index('.ApprovalCommentIcon');
	var currentRowClass = $('.ApprovalCommentIcon').eq(index).attr('class');
	var comment ="N/A";
	if(currentRowClass.includes("CurrentCommentIcon")){
		comment =currentUserComment;
	}
	$("#ApprovalCommentSeq").val(index+1);
	$("#ApprovalCommentId").val(comment);
	$("#ApprovalComments").click();
});

$(document).on('change','.approval',function(){
	var value=$(this).attr('value');
	if(value=="yes" || value=='no'){
		$("#ApprovalComments").click();
	}
});

$(document).on('click','#ApprovalCommentOKBtn',function(){
	var cmt =$("#ApprovalCommentId").val();
	if(cmt==''){
		notification("warning","Fill the comment section.","warning:");	
	}
	else{
	currentUserComment = cmt;	
	$("#ApprovalCommentClose").click();
	}
});
$(document).on('click','#ApprovalCommentCancelBtn',function(){
	$("#ApprovalCommentId").val(currentUserComment);
	var Index = $(".CurrentCommentIcon").eq(0).index('.ApprovalCommentIcon');
	switch(currentUserDecision){
	case "Approved":
		$(".yes").eq(Index).prop('checked',true);
		$(".no").eq(Index).prop('checked',false);
		$(".neutral").eq(Index).prop('checked',false);
		$(".intakeApproval").eq(Index).val('Approved');
		break;
	case "Rejected":
		$(".yes").eq(Index).prop('checked',false);
		$(".no").eq(Index).prop('checked',true);
		$(".neutral").eq(Index).prop('checked',false);
		$(".intakeApproval").eq(Index).val('Rejected');
		break;
	case "Decision pending":
		$(".yes").eq(Index).prop('checked',false);
		$(".no").eq(Index).prop('checked',false);
		$(".neutral").eq(Index).prop('checked',true);
		$(".intakeApproval").eq(Index).val('Decision pending');
		break;
	}
	$("#ApprovalCommentClose").click();
});
