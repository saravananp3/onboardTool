$(document).ready(function(){
	
	
	$(document).on('click','.EditRowDoc', function(){
		
		var seqNum = $(this).index(".EditRowDoc");
		var nameReadOnly = $(".date").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			$(".date").eq(seqNum).removeAttr("readonly");
			$(".version").eq(seqNum).removeAttr("readonly");
			$(".documentChanges").eq(seqNum).removeAttr("readonly");
			$(".changeAuthor").eq(seqNum).removeAttr("readonly");
			notification("info","Seleted row is editable.","Info:");
		}
		else
		{
			$(".date").eq(seqNum).prop("readonly", true);
			$(".version").eq(seqNum).prop("readonly", true);
			$(".documentChanges").eq(seqNum).prop("readonly", true);
			$(".changeAuthor").eq(seqNum).prop("readonly", true);
			notification("info","Seleted row is non-editable.","Info:");
		}	
			
	});

$(document).on('click','.DeleteRowDoc', function(){
		
		var seqNum = $(this).index('.DeleteRowDoc')+1;
		$('#docRevDeleteSeq').val(seqNum);
		$('#docRevDeleteId').click();
		
	});

$(document).on('click','#docRevDeleteSubmit', function(){
	
	$('.submitDisableDocRev').attr('disabled', true);
	var seqNum = $('#docRevDeleteSeq').val();
	
	archiveReqDocRevDeleteAjaxCall(seqNum);
	$('.submitDisableDocRev').attr('disabled', false);
	$('#docRevDeleteClose').click();
});
	
	
});


function archiveReqDocRevDeleteAjaxCall(seqNum){
	
	$.ajax({
        url: "archiveReqDocRevDeleteServlet",
        type: 'POST',
        data: {seqNum:seqNum},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Delete Row Retrieve--->",data);
        	if(data.DeleteStatus){
        		$('.rowClassDoc').eq(seqNum-1).remove();
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