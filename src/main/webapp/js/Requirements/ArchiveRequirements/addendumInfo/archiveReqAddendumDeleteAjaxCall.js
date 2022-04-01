$(document).ready(function(){
	
$(document).on('click','#addendumDelete', function(){
		
	$(".hidedelete").toggle();		
		
		
	});
$(document).on('click','.deletepopup ',function()
{
	$('#addendumDeleteId').click();
	var seqNum = $(this).index('.deletepopup')+1;
	$("#addendumDeleteSeq").val(seqNum)
	
});
$(document).on('click','#addendumDeleteSubmit', function(){
	
	$('.submitDisableAddendum').attr('disabled', true);
	var seqNum = $('#addendumDeleteSeq').val();
	
	archiveReqAddendumDeleteAjaxCall(seqNum);
	$('.submitDisableAddendum').attr('disabled', false);
	$('#addendumDeleteClose').click();
	$('.hidedelete').hide();
});
	
});

function archiveReqAddendumDeleteAjaxCall(seqNum){
	
	$.ajax({
        url: "archiveReqAddendumDeleteServlet",
        type: 'POST',
        data: {seqNum:seqNum},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Delete Row Retrieve--->",data);
        	if(data.DeleteStatus){
        		$('.addendumField').eq(seqNum-1).remove();
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