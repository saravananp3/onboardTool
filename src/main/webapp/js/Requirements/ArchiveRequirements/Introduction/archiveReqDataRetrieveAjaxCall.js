$(document).ready(function(){
	
	archiveReqDataRetrieve();
	archiveReqRolesResponseDataRetrieve();
	
	
	$(document).on('click','#AddRoleResponse', function(){
		
		var seqNum = $('.rowClass').length;
	
		archiveReqAddAjaxCall(seqNum);
		
	});
$(document).on('click','.EditRow', function(){
		
		var seqNum = $(this).index(".EditRow");
		var nameReadOnly = $(".name").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			$(".name").eq(seqNum).removeAttr("readonly");
			$(".role").eq(seqNum).removeAttr("readonly");
			$(".title").eq(seqNum).removeAttr("readonly");
			$(".approverpurpose").eq(seqNum).removeAttr("readonly");
			notification("info","Seleted row is editable.","Info:");
		}
		else
		{
			$(".name").eq(seqNum).prop("readonly", true);
			$(".role").eq(seqNum).prop("readonly", true);
			$(".title").eq(seqNum).prop("readonly", true);
			$(".approverpurpose").eq(seqNum).prop("readonly", true);
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
           	 "<td><input type ='text' class='role' value=''></td>" +
           	 "<td><input type ='text' class='name' value=''></td>" +
           	 "<td><input type ='text' class='title' value=''></td>" +
           	 "<td><input type ='text' class='approverpurpose' value=''></td>" +
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
        			$('#rolesNext').attr('disabled', false);
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
             $.each(data, function(key, value){
            	 var Row="<tr class = 'rowClass'>"+
            	 "<td><input type ='text' class='role' value='"+value.role+"' readonly></td>" +
            	 "<td><input type ='text' class='name' value='"+value.name+"' readonly></td>" +
            	 "<td><input type ='text' class='title' value='"+value.title+"' readonly></td>" +
            	 "<td><input type ='text' class='approverpurpose' value='"+value.approverpurpose+"' readonly></td>" +
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
             });
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}