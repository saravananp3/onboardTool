$(document).ready(function(){
	archiveReqAddendumDataRetrieveAjaxCall();
});

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
        	 var delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
 			
        	 if(checkTable){
             $.each(data, function(key, value){
            	 
            	 var Row="<div class='addendumField' style='margin-top: 6px;margin-bottom: 60px;'>"+
            	 		 "<label class='editable' contenteditable='true'>"+value.labelName+"</label>"+delete_icon+
            	 		 "<textarea rows='2' cols='130' style='height:100px;' class='req addendumInfo'>"+value.addendumInfo+"</textarea>"+
                         "<div style='margin-top: -69px;margin-left: 87%;'>"+
                         "<button class='upload-icon' style='margin-top: -87px;border: none;background: white;display: inline-block;padding: 12px;'>"+
  						 
  						 "<label for='fileUpload" + count + "' style='border: none;'><i class='fas fa-cloud-upload-alt' id='UploadFile" + count + "'></i></label></button>"+
					     "<i class='fa icon fa-eye' id='eyeicon" + count + "' style='color: #1565C0;display: inline-block;padding-left: 39px;'></i>"+
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
        		 var Row="<div class='addendumField'>"+
        	 		 "<label class='editable' contenteditable='true'>Section 1</label>"+delete_icon+
        	 		 
        			 "<textarea rows='2' cols='130' style='height:100px;' class='req addendumInfo'></textarea>"+
        			 "<label for='fileUpload" + count + "'> <input type='file' id='fileUpload" + count + "' multiple></label>"+
        		 "</div>";
        		 $("#inputFieldsAddendum").append(Row);
             	}
        	
        	     },
        error: function (e) {
            console.log(e);
        }
    });
}
 $(document).on('click', '.fa-eye', function () {
    $('#addendumViewUploadId').click();
        $('#addendumViewPopUp').on('shown.bs.modal', function () {
    });
    });
    
     $(document).on('click', '.upload-icon', function () {
    $('#addendumUploadId').click();
        $('#addendumUploadPopup').on('shown.bs.modal', function () {
    });
    });
    
    