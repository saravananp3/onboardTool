var checkScope = false;
var checkRoles = false;
$(document).ready(function(){
//archiveReqDataRetrieve();
archiveExeIssueDataRetrieve();
//checkNextButton();
$(document).on('click','#AddIssue', function(){
var seqNum = $('.rowClass').length;
archiveExeIssueAddAjaxCall(seqNum);
});
$(document).on('click','.EditRow', function(){
var seqNum = $(this).index(".EditRow");
var nameReadOnly = $(".app_Id").eq(seqNum).attr("readonly");
if(nameReadOnly)
{
var checkEdit=$(".ArchiveApproval").eq(seqNum).val();
if(checkEdit!="true")
{
$(".description").eq(seqNum).removeAttr("readonly");
$(".start_date").eq(seqNum).removeAttr("readonly");
$(".raised_by").eq(seqNum).removeAttr("readonly");
$(".status").eq(seqNum).removeAttr("readonly");
$(".assigned_to").eq(seqNum).removeAttr("readonly");
$(".exp_date").eq(seqNum).removeAttr("readonly");
$(".end_date").eq(seqNum).removeAttr("readonly");
$(".comments").eq(seqNum).removeAttr("readonly");
notification("info","Seleted row is editable.","Info:");
}
else
notification("info","Decision has taken already for this Issue","Info:");
}
else
{
$(".description").eq(seqNum).prop("readonly", true);
$(".start_date").eq(seqNum).prop("readonly", true);
$(".raised_by").eq(seqNum).prop("readonly", true);
$(".status").eq(seqNum).prop("readonly", true);
$(".assigned_to").eq(seqNum).prop("readonly", true);
$(".exp_date").eq(seqNum).prop("readonly", true);
$(".end_date").eq(seqNum).prop("readonly", true);
$(".comments").eq(seqNum).prop("readonly", true);
notification("info","Seleted row is non-editable.","Info:");
} 
});
$(document).on('click','.DeleteRow', function(){
var seqNum = $(this).index('.DeleteRow')+1;
$('#ArchiveDeleteSeq').val(seqNum);
$('#ArchReqDeleteId').click();
});

$(document).on('click','#ArchiveDeleteSubmit', function(){
$('.submitDisableDelete').attr('disabled', true);
var seqNum = $('#ArchiveDeleteSeq').val();
var app_Id = $(".app_Id").eq(seqNum-1).val();
archiveReqDeleteAjaxCall(seqNum,app_Id);
$('.submitDisableDelete').attr('disabled', false);
$('#closeIdDelete').click();
});

});

function archiveReqDeleteAjaxCall(seqNum,app_Id){
$.ajax({
        url: "ArchiveExeIssueDeleteServlet",
        type: 'POST',
        data: {seqNum:seqNum,app_Id:app_Id},
        async: false,
        dataType: "json",
        success: function (data) {
        console.log("Delete Row Retrieve--->",data);
        if(data.DeleteStatus){
        $('.rowClass').eq(seqNum-1).remove();
        notification("success","Seleted row deleted Successfully.","Note:");
        }
        else
        notification("error","Error occured while deleting the row.","Error:");
         
        },
        error: function (e) {
            console.log(e);
        }
    });
}


function archiveExeIssueAddAjaxCall(seqNum){
$.ajax({
        url: "archiveExeIssueRiskAddServlet",
        type: 'POST',
        data: {seqNum:seqNum},
        async: false,
        dataType: "json",
        success: function (data) {
        console.log("Add Row Retrieve--->",data);
        if(data.AddStatus){
        var Row="<tr class = 'rowClass'>"+
            "<td><input type ='text' readonly class='app_Id' value='"+data.id+"'><input type='hidden' class='ArchiveApproval' value='false'/></td>" +
 "<td>"+
            "<select name='Impact' class='impact'>"+
                          "<option class='high' style='font-size: 12px; color: black' value='HIGH'>HIGH</option>"+
                           "<option class='medium' style='font-size: 12px; color: black' value='MEDIUM' selected>MEDIUM</option>"+
                           "<option class='low' style='font-size: 12px; color: black' value='LOW'>LOW</option>"+
                           "<option class='critical' style='font-size: 12px; color: black' value='CRITICAL'>CRITICAL</option>"+
               "</select>"+
            "</td>" +
"<td>"+
            "<select name='Type' class='type'>"+
                           "<option class='issue' style='font-size: 19px; color: black' value='ISSUE' selected>ISSUE</option>"+
                           "<option class='process' style='font-size: 19px; color: black' value='PROCESS'>PROCESS</option>"+
                           "<option class='risk' style='font-size: 19px; color: black' value='RISK'>RISK</option>"+
                           "<option class='scope' style='font-size: 19px; color: black' value='SCOPE'>SCOPE</option>"+
                           "<option class='task' style='font-size: 19px; color: black' value='TASK'>TASK</option>"+
                           "<option class='decision' style='font-size: 19px; color: black' value='DECISION'>DECISION</option>"+
               "</select>"+
            "</td>" +
             "<td><textarea class='description' rows='3' value=''/></td>" +
            "<td><input type ='date' class='startDate' placeholder='mm/dd/yyyy' value=''></td>" +
            "<td><input type ='text' class='raisedBy' value=''></td>" +
            "<td><textarea class='status' rows='3' value=''/></td>" +
            "<td><input type ='text' class='assgnedTo' value=''></td>" +
"<td>"+
            "<select name='Resolved' class='resolved'>"+
                           "<option class='open' style='font-size: 19px; color: black' value='OPEN' selected>OPEN</option>"+
                           "<option class='inProgress' style='font-size: 19px; color: black' value='IN PROGRESS'>IN PROGRESS</option>"+
                           "<option class='completed' style='font-size: 19px; color: black' value='COMPLETED'>COMPLETED</option>"+
                           "<option class='cancelled' style='font-size: 19px; color: black' value='CANCELLED'>CANCELLED</option>"+
                           +
               "</select>"+
            "</td>" +           
             "<td><input type ='date' class='expDate' placeholder='mm/dd/yyyy' value=''></td>" +
            "<td><input type ='date' class='enddate' placeholder='mm/dd/yyyy' value=''></td>" +
            "<td><textarea class='comments' rows='3' value=''/></td>" +
            
            "<td>"+
            "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                           "<ul class='dropdown-menu'>"+
                           "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                           "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                           "</ul>"+
                           "</div>"+
            "</td>" +
            "</tr>";
            $("#AppIssue").append(Row);
            notification("success","Row added Successfully.","Note:");
        }
        else
        notification("error","Error occured while adding the row.","Error:");
         
        },
        error: function (e) {
            console.log(e);
        }
    });
}



function archiveReqDataRetrieve(){
$.ajax({
        url: "archiveReqIntroDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        console.log("Data Retrieve--->",data);
        if(data.checkData){
        $('.Purpose').html(data.Purpose);
        $('.Scope').html(data.Scope);
        if(data.Scope != '')
        checkScope = true;
        var assumptionList = data.Assumption.split("::");
        var assumptionValue = "";
        for(var i = 0; i<assumptionList.length; i++)
        assumptionValue += "<li>"+assumptionList[i]+"</li>";
        $('.Assumption').find('ul').html('');
        $('.Assumption').find('ul').html(assumptionValue);
         
        }
         
        },
        error: function (e) {
            console.log(e);
        }
    });
}


function archiveExeIssueDataRetrieve(){
$.ajax({
        url: "archiveExeIssueTemplateServlet1",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        console.log("Table Retrieve--->",data);
         if (!$.isArray(data)) {
                 data = [data];
             }
         $("#AppIssue").html("");
         //var checkValidation = false;
         var impactArray = ['HIGH','MEDIUM','LOW','CRITICAL']; 
         var typeArray = ['ISSUE','PROCESS','RISK','TASK','DECISION']; 
         var resolvedArray = ['OPEN','IN PROGRESS','COMPLETED','CANCELLED']; 
          
             $.each(data, function(key, value){
              var optionsImpact ="";
               for(var n=0;n<impactArray.length;n++){
               var selected = (value.impact==impactArray[n])? "selected":"";
               optionsImpact += "<option value='"+impactArray[n]+"' "+selected+">"+impactArray[n]+"</option>";
               }
               var optionsType ="";
               for(var n=0;n<typeArray.length;n++){
               var selected = (value.type==typeArray[n])? "selected":"";
               optionsType += "<option value='"+typeArray[n]+"' "+selected+">"+typeArray[n]+"</option>";
               }
               var optionsResolved ="";
               for(var n=0;n<resolvedArray.length;n++){
               var selected = (value.resolved==resolvedArray[n])? "selected":"";
               optionsResolved += "<option value='"+resolvedArray[n]+"' "+selected+">"+resolvedArray[n]+"</option>";
               }
             var Row="<tr class = 'rowClass'>"+
             
             "<td><input type ='text' readonly class='app_Id' value='"+value.app_Id+"'><input type='hidden' class='ArchiveApproval' value='false'/></td>" +
            
 "<td><select type='text' class='impact' value='"+value.impact+"' >"+
            optionsImpact
            +"</select></td>"+
"<td><select type='text' class='type' value='"+value.type+"' >"+
            optionsType
            +"</select></td>"+
             "<td><textarea readonly class='description' id='description' rows='3'>"+value.description+"</textarea></td>" +
            "<td><input type ='date' readonly class='start_date' placeholder='mm/dd/yyyy' value='"+value.start_date+"'></td>" +
            "<td><input type ='text' readonly class='raised_by' value='"+value.raised_by+"'></td>" +
            "<td><textarea class='status' readonly id='status' rows='3'>"+value.status+"</textarea></td>" +
            "<td><input type ='text' readonly class='assigned_to' value='"+value.assigned_to+"'></td>" +
            "<td><select type='text' class='resolved' value='"+value.resolved+"' >"+
            optionsResolved
            +"</select></td>" +
            "<td><input type ='date' readonly class='exp_date' placeholder='mm/dd/yyyy' value='"+value.exp_date+"'></td>" +
            "<td><input type ='date' readonly class='end_date' placeholder='mm/dd/yyyy' value='"+value.end_date+"'></td>" +
            "<td><textarea class='comments' readonly id='comments' rows='3'>"+value.comments+"</textarea></td>" +
           "<td>"+
            "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                           "<ul class='dropdown-menu'>"+
                           "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                           "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                           "</ul>"+
                           "</div>"+
            "</td>" +
            "</tr>";
            $("#AppIssue").append(Row);
      
             if(checkFieldValues(value.role,  value.name, value.email, value.username, value.priority))
             checkRoles = true;
             //checkValidation = true;
             });
        },
        error: function (e) {
            console.log(e);
        }
    });
}
$(document).on('click','#saveArchiveExeIssue', function(){ 
        var validation = false;
var JsonArray = [];
var appIdArray = [];
var checkDuplicateRole = true;
for(var i = 0; i<$('.rowClass').length; i++){
var inputs = {};
var app_Id = $('.app_Id').eq(i).val();
var impact =  $('.impact').eq(i).val();

var type = $('.type').eq(i).val();
var description = $('.description').eq(i).val();
var start_date = $('.start_date').eq(i).val();
var raised_by = $('.raised_by').eq(i).val();
var status = $('.status').eq(i).val();
var assigned_to = $('.assigned_to').eq(i).val();
var resolved = $('.resolved').eq(i).val();
var exp_date = $('.exp_date').eq(i).val();
var end_date = $('.end_date').eq(i).val();
var comments = $('.comments').eq(i).val();
//if(!appIdArray.includes(app_Id))
// appIdArray.push(app_Id);
//else
checkDuplicateRole=true;
 
//if(checkFieldValues(impact, name, emailId,username,priority_order_num))
validation = true;
inputs['seq_no'] = i+1;
inputs['app_Id'] = app_Id;
inputs['impact'] = impact;
inputs['type'] = type;
inputs['description'] = description;
inputs['start_date'] = start_date;
inputs['raised_by'] = raised_by;
inputs['status'] = status;
inputs['assigned_to'] = assigned_to;
inputs['resolved'] = resolved;
inputs['exp_date'] = exp_date;
inputs['end_date'] = end_date;
inputs['comments'] = comments;
JsonArray.push(inputs);
}
if(validation&&checkDuplicateRole){
    console.log("JsonArray Retrieve--->",JsonArray);
archiveExeIssueSaveAjaxcall(JsonArray);}
else
{
if(!validation)
notification("warning","Please fill atleast one row fields.","Warning");
           
if(!checkDuplicateRole)
            notification("warning","Please provide unique roles.","Warning");
           
            e.preventDefault();
            checkRoles = false; 
}
checkNextButton();
e.preventDefault();
});
function checkFieldValues(role, name, emailId, username,priority_order_num){
var validationFlag = false;
if((role != '' && role != undefined && role != null) && (name != '' && name != undefined && name != null) && 
(emailId != '' && emailId != undefined && emailId != null) && (username != '' && username != undefined && username != null)
&& (priority_order_num != '' && priority_order_num != undefined && priority_order_num != null))
validationFlag = true;
return validationFlag;
}
function archiveExeIssueSaveAjaxcall(JsonArray){
var checkAjax =false;
$.ajax({
        url: "archiveExeIssueSaveServlet",
        type: 'POST',
        data : {JsonArray:JSON.stringify(JsonArray)},
        async: false,
        dataType: "json",
        success: function (data) {
        console.log("SAVE DATA:",data);
        JsonObject = data;
        if(data.SaveStatus)
        {
        notification("success","Saved successfully.","Note:");
        checkRoles = true;
        }
        else
        {
        notification("error","Error occured while saving.","Error:");
        checkRoles = false;
        }
        
      },
        error: function (e) {
            console.log(e);
        }
});
}
