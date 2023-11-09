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
            var options ;
            if(data.AddStatus){
				var seq_no = data.seqNum;
                var options_arr = ['Project Sponsor','System Architect','Project Manager','Business Owner','Technical Lead'];
                    for(var n=0;n<options_arr.length;n++){
                      var selected = "Project Sponsor";
                       options += "<option value='"+options_arr[n]+"' "+selected+">"+options_arr[n]+"</option>";
                   }
                var Row="<tr class = 'rowClass'>"+
             "<td><select type ='text' class='role' style='width: 100%; text-align:center;padding: 0.3rem 0 0.3rem 0;' value=''>"+options+"</select><input type='hidden' class='ArchiveApproval' value='false'/></td>" +
             "<td><input type ='text' id='firstName"+seq_no+"' class='name' style='width: 100%; text-align:center;' value=''></td>" +
             "<td><input type ='text' id='search"+seq_no+"' style='width: 100%; text-align:center;' onClick='searchFunction("+seq_no+");' class='emailId' value=''><ul id='result"+seq_no+"' class='list-group searchResult'></ul></td>" +
             "<td><input type ='text' id='userName"+seq_no+"' style='width: 100%; text-align:center;' class='username' value=''></td>" +
            "<td><input type ='text' class='priority_order_num' style='width: 100%; text-align:center;' value=''></td>" +
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
              var options_arr = ['Project Sponsor','System Architect','Project Manager','Business Owner','Technical Lead'];
             $.each(data, function(key, value){
     					var options ="";
                        var role = (value.role==undefined)?"":value.role;
                        var seq_no = value.seq_no;
                    for(var n=0;n<options_arr.length;n++){
                       var selected = (role==options_arr[n])? "selected":"";
                       options += "<option value='"+options_arr[n]+"' "+selected+">"+options_arr[n]+"</option>";
                   }
                 var Row="<tr class = 'rowClass'>"+
                 "<td><select type ='text' class='role' value='"+value.role+"' style='width: 100%; text-align:center;padding: 0.3rem 0 0.3rem 0;' readonly>"+options+"</select><input type='hidden' class='ArchiveApproval' value='"+value.ApprovalStatus+"'></td>" +
                 "<td><input type ='text' class='name' id='firstName"+seq_no+"' style='width: 100%; text-align:center;' value='"+value.name+"' readonly></td>" +
                 "<td><input type ='text' class='emailId' id='search"+seq_no+"' style='width: 100%; text-align:center;' onClick='searchFunction("+seq_no+");' value='"+value.emailId+"' readonly><ul id='result"+seq_no+"' class='list-group searchResult'></ul></td>" +
                 "<td><input type ='text' class='username' id='userName"+seq_no+"' style='width: 100%; text-align:center;' value='"+value.username+"' readonly></td>" +
                 "<td><input type ='text' class='priority_order_num' value='"+value.priority_order_num+"' style='width: 100%; text-align:center;' readonly></td>" +
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
   
   function searchFunction(i){
	
	$('#search'+i).keyup(function() {
		$('#result'+i).html('');
		var searchField = $('#search'+i).val();
		var expression = new RegExp(searchField, "i");
		$.ajax({
			type: "POST",
			url: "Retrieve_users_servlet",
			dataType: "json",
			success: function(data) {
				console.log(data);
				 if (!$.isArray(data)) {
                data = [data];
            }
           
            	$('#result'+i).empty();
				$.each(data, function(key, value) {
					
					if (value.u_email.search(expression) != -1){						
						$('#result'+i).append('<li class="list-group-item link-class">' + value.u_email +'</li>');					
					}
					
				});
			}

		});
	
	});
		
	$('#result' + i).on('click', 'li', function() {
		var click_text = $(this).text();
		$('#search' + i).val(click_text);
		$("#result" + i).html('');
		$.ajax({
			type: "POST",
			url: "Retrieve_users_servlet",
			dataType: "json",
			success: function(data) {
				console.log(data);
				if (!$.isArray(data)) {
					data = [data];
				}

				var count = 0;
				var first_name;
				var user_name;
				$.each(data, function() {

					if (click_text == data[count].u_email) {
						first_name = data[count].ufname;
						user_name = data[count].uname;
						document.getElementById('firstName' + i).value = first_name;
						document.getElementById('userName' + i).value = user_name;

					}
					count = count + 1;

				});

			}
		});

	});
};
