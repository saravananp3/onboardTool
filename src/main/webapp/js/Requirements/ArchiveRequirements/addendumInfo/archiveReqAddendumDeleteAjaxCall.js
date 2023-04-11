$(document).ready(function(){
	
$(document).on('click','#addendumDelete', function(){
		
	$(".hidedelete").toggle();		
		
		
	});
$(document).on('click','.deletepopup ',function()
{
	$('#addendumDeleteId').click();
	var seqNum = $(this).attr("deletesectioniconcount"); 
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
        		archiveReqAddendumDataRetrieveAjaxCall();
        	}
        	else
        		notification("error","Error occured while deleting the row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}

function archiveReqAddendumDataRetrieveAjaxCall(){
	
	$.ajax({
        url: "archiveReqAddendumDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 $("#inputFieldsAddendum").html("");
        	 var checkTable = data[0].checkExistance;    	 
        	 var count=1;
        	 if(checkTable){
             $.each(data, function(key, value){  
				 var delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete'  style='float:right;display:none;' deletesectioniconcount='"+value.seq_no+"' ></span>";          	 
            	 var Row="<div class='addendumField' style='margin-top: 6px;margin-bottom: 60px;'>"+
            	 		 "<label class='editable' contenteditable='true'>"+value.labelName+"</label>"+delete_icon+            	 		 
            	 		 "<textarea rows='2' cols='130' style='height:100px;' class='req addendumInfo'>"+value.addendumInfo+"</textarea>"+
                         "<div style='margin-top: -69px;margin-left: 87%;'>"+                         
                         "<button class='upload-icon' id='"+value.seq_no+"'style='margin-top: -87px;border: none;background: white;display: inline-block;padding: 12px;' uploadsectioniconcount='"+value.seq_no+"'>"+  						 
  						 "<label for='fileUpload" + value.seq_no + "' style='border: none;'><i class='fas fa-cloud-upload-alt' id='UploadFile" + value.seq_no + "' uploadsectioniconcount='"+value.seq_no+"'></i></label></button>"+
					     "<i class='fa icon fa-eye' id='eyeicon" + value.seq_no + "' eyesectioncount='"+value.seq_no+"' style='color: #1565C0;display: inline-block;padding-left: 39px;'></i>"+
					     "</div>"+
            	 		 "</div>";
            	 		 
            	 $("#inputFieldsAddendum").append(Row);            	 
            	 count++;
            	 });            	
            	 }
/*            	 <div class="upload-icon">  
  <input type="file" id="upload">
  <label for="upload">
    <i class="fas fa-cloud-upload-alt"></i> Upload file
  </label>
</div> */
        	 
        	 else{
				 var delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete'  style='float:right;display:none;' deletesectioniconcount='1'></span>";
        		 var Row="<div class='addendumField' style='margin-top: 6px;margin-bottom: 60px;'>"+
        	 		 "<label class='editable' contenteditable='true'>Section 1</label>"+delete_icon+        	 		 
        			 "<textarea rows='2' cols='130' style='height:100px;' class='req addendumInfo'></textarea>"+
        			 "<div style='margin-top: -69px;margin-left: 87%;'>"+
        			 "<button class='upload-icon' id='1'style='margin-top: -87px;border: none;background: white;display: inline-block;padding: 12px;' uploadsectioniconcount='1'>"+  						 
  					 "<label for='fileUpload1' style='border: none;'><i class='fas fa-cloud-upload-alt' id='UploadFile1' uploadsectioniconcount='1'></i></label></button>"+
					 "<i class='fa icon fa-eye' id='eyeicon1' eyesectioncount=1 style='color: #1565C0;display: inline-block;padding-left: 39px;'></i>"+
					 "</div>"+
        		 "</div>";
        		 
        		 $("#inputFieldsAddendum").append(Row);
             	}
        	
        	     },
        error: function (e) {
            console.log(e);
        }
    });
}