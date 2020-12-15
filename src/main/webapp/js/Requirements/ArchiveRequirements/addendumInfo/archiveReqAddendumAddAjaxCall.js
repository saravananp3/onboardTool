$(document).ready(function (){
	
	
$(document).on('click','#addendumAdd', function(){
		
		
	$('#addendumAddId').click();
		
	});
	
$(document).on('click','#addendumAddSubmit', function(){
	
	var seqNum = $('.addendumInfo').length;
	var labelName = $('#addendumLabelId').val();
	if(labelName != '' && labelName != undefined && labelName != null)
		archiveReqAddendumAddAjaxCall(seqNum,labelName);
	else
		notification("warning","Please fill the fields","Warning:");
});
});

function archiveReqAddendumAddAjaxCall(seqNum,labelName){
	
	$.ajax({
        url: "archiveReqAddendumAddServlet",
        type: 'POST',
        data: {seqNum:seqNum, labelName:labelName},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Add Row Retrieve--->",data);
        	var delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
        	
        	if(data.AddStatus){
        		
        		
        		var Row="<div class='addendumField'>"+
   	 		 "<label class='editable' contenteditable='true'>"+labelName+"</label>"+delete_icon+
	 		 "<textarea rows='2' cols='130' style='height:100px;' class='req addendumInfo'></textarea>"+
	 		"</div>";
        		$("#inputFieldsAddendum").append(Row);
        		$("#addendumAddClose").click();
           	 	notification("success","Row added Successfully.","Note:");
        	}
        	else if(data.checkDuplicate)
        		notification("warning","Label Name already exist.","Warning:");
        	else
        		notification("error","Error occured while adding the row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}