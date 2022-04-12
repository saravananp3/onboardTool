var checkScope = false;
var checkRoles = false;
$(document).ready(function(){
    archiveReqDataRetrieve();
    archiveReqRolesResponseDataRetrieve();
    enableSaveButtonFunction();
    checkNextButton();
    $(document).on('click','#AddRoleResponse', function(){
        var seqNum = $('.rowClass').length;
        archiveReqAddAjaxCall(seqNum);
    });
$(document).on('click','.EditRow', function(){
        var seqNum = $(this).index(".EditRow");
        var nameReadOnly = $(".name").eq(seqNum).attr("readonly");
        if(nameReadOnly)
        {
            var checkEdit=$(".ArchiveApproval").eq(seqNum).val();
            if(checkEdit!="true")
            {
            $(".name").eq(seqNum).removeAttr("readonly");
            $(".role").eq(seqNum).removeAttr("readonly");
            $(".emailId").eq(seqNum).removeAttr("readonly");
            $(".username").eq(seqNum).removeAttr("readonly");
            $(".priority_order_num").eq(seqNum).removeAttr("readonly");
            notification("info","Seleted row is editable.","Info:");
            }
            else
                notification("info","Decision has taken already for this role","Info:");
        }
        else
        {
            $(".name").eq(seqNum).prop("readonly", true);
            $(".role").eq(seqNum).prop("readonly", true);
            $(".emailId").eq(seqNum).prop("readonly", true);
            $(".username").eq(seqNum).prop("readonly", true);
            $(".priority_order_num").eq(seqNum).prop("readonly", true);
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
    archiveReqDeleteAjaxCall(seqNum);
    $('.submitDisableDelete').attr('disabled', false);
    $('#closeIdDelete').click();
});
});
function archiveReqDeleteAjaxCall(seqNum){
    $.ajax({
        url: "archiveReqRolesResponseDeleteServlet",
        type: 'POST',
        data: {seqNum:seqNum},
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
function archiveReqAddAjaxCall(seqNum){
    $.ajax({
        url: "archiveReqRolesResponseAddServlet",
        type: 'POST',
        data: {seqNum:seqNum},
        async: false,
        dataType: "json",
        success: function (data) {
            console.log("Add Row Retrieve--->",data);
            if(data.AddStatus){
                var Row="<tr class = 'rowClass'>"+
             "<td><input type ='text' class='role' value=''><input type='hidden' class='ArchiveApproval' value='false'/></td>" +
             "<td><input type ='text' class='name' value=''></td>" +
             "<td><input type ='text' class='emailId' value=''></td>" +
             "<td><input type ='text' class='username' value=''></td>" +
            "<td><input type ='text' class='priority_order_num' value=''></td>" +
             "<td>"+
             "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                           "<ul class='dropdown-menu'>"+
                           "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                           "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                           "</ul>"+
                           "</div>"+
             "</td>" +
             "</tr>";
             $("#Approver").append(Row);
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
function archiveReqRolesResponseDataRetrieve(){
    $.ajax({
        url: "archiveReqIntroRolesResTemplateServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
            console.log("Table Retrieve--->",data);
             if (!$.isArray(data)) {
                 data = [data];
             }
             $("#Approver").html("");
             //var checkValidation = false;
             $.each(data, function(key, value){
                 var Row="<tr class = 'rowClass'>"+
                 "<td><input type ='text' class='role' value='"+value.role+"' readonly><input type='hidden' class='ArchiveApproval' value='"+value.ApprovalStatus+"'></td>" +
                 "<td><input type ='text' class='name' value='"+value.name+"' readonly></td>" +
                 "<td><input type ='text' class='emailId' value='"+value.emailId+"' readonly></td>" +
                 "<td><input type ='text' class='username' value='"+value.username+"' readonly></td>" +
                 "<td><input type ='text' class='priority_order_num' value='"+value.priority_order_num+"' readonly></td>" +
                 "<td>"+
                 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                            "<ul class='dropdown-menu'>"+
                            "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                            "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                            "</ul>"+
                            "</div>"+
                 "</td>" +
                 "</tr>";
                 $("#Approver").append(Row);
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
$(document).on('click', '#complete', function(e) {
                $.ajax({
        url: "ArchiveReqCompleteServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("Completed DATA:", data);
            JsonObject = data;
            if (data.iscompleted==true) {
                notification("success", "Completed successfully.", "Note:");
            }else if (data.iscompleted==false) {
                notification("error","Please fill all the fields.","Error:");
            }
        }
    });
    e.preventDefault();
            });
            $(document).on('click', '#edit', function(e) {
                        document.getElementById("saveRoleResponse").disabled = false;
                        notification("success", "Current Page is editable", "Note:");
            e.preventDefault();
            });
        function enableSaveButtonFunction(){
            $.ajax({
        url: "ArchiveIntroCompleteStatusServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("Completed DATA:", data);
            JsonObject = data;
            if (data.iscompleted==true) {
            document.getElementById("saveRoleResponse").disabled = true;
            }else{
            document.getElementById("saveRoleResponse").disabled = false;
                            }
        }
    });
        }