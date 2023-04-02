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
        	 var delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
 			 var count=1;
        	 if(checkTable){
             $.each(data, function(key, value){            	 
            	 var Row="<div class='addendumField' style='margin-top: 6px;margin-bottom: 60px;'>"+
            	 		 "<label class='editable' contenteditable='true'>"+value.labelName+"</label>"+delete_icon+            	 		 
            	 		 "<textarea rows='2' cols='130' style='height:100px;' class='req addendumInfo'>"+value.addendumInfo+"</textarea>"+
                         "<div style='margin-top: -69px;margin-left: 87%;'>"+                         
                         "<button class='upload-icon' id='"+value.seq_no+"'style='margin-top: -87px;border: none;background: white;display: inline-block;padding: 12px;'>"+  						 
  						 "<label for='fileUpload" + count + "' style='border: none;'><i class='fas fa-cloud-upload-alt' id='UploadFile" + count + "'></i></label></button>"+
					     "<i class='fa icon fa-eye' id='eyeicon" + count + "' eyesectioncount='"+count+"' style='color: #1565C0;display: inline-block;padding-left: 39px;'></i>"+
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
/* $(document).on('click', '.fa-eye', function () {
    $('#addendumViewUploadId').click();
        $('#addendumViewPopUp').on('shown.bs.modal', function () {
    });
    });*/
    
     $(document).on('click', '.upload-icon', function () {
    $('#addendumUploadId').click(); 
    var section_no=$(this).attr("id"); 
    $('#seq_no_section_insert').val(section_no); 
        $('#addendumUploadPopup').on('shown.bs.modal', function () {
    });
    });
       $(document).on('click', '.fa-eye', function () {
    $('#addendumViewUploadId').click(); 
    var section_no=$(this).attr("eyesectioncount"); 
    $('#seq_no_section_insert').val(section_no); 
    $(".Uploaded_Files_List").empty();
    	$.ajax({
        url: "ArchiveReqAddendumFileRetrieveServlet",
        type: 'POST',
        data:{section_no:section_no},
        dataType: "json",
        success: function(data) {
            console.log("Addendum Files Retrieve", data);
            if (!$.isArray(data)) {
                data = [data];
            }
            appendRowFunction(data);
        },
    });    
   
    });
    
    var count=1;
function appendRowFunction(data) {
    $.each(data, function(key, value) {
		var seq_num = value.seq_num;
		var section_no = value.section_no;
        var oppId = value.oppId;
        var File_Name = value.File_Name;
        var row = "<tr>" +
            "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>" + seq_num + "</label>" +
            "</td>"+
            "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>" + section_no + "</label>" +
            "</td>"+
            "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>" + oppId + "</label>" +
            "</td>"+
            "<td style='text-align:center;vertical-align: middle;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:10ch;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + File_Name + "'><label class='control-label ' for=''>" + File_Name + "</label>" +
            "</td>" +
            "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-download-alt add_download_btn'style='display:block; margin-left:-15px;'></span><span class='glyphicon glyphicon-trash addendum_scr_deletepopup'id='addendum_file_delete_icon" +count+ "'style='display:block;float:right;margin-top:-13px; margin-right:18px; margin-left:10px;'></span>" +
            "</td>" +
            "</tr>";	
    	$(".Uploaded_Files_List").append(row);		
		count++;
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function(tooltipTrigger) {
            return new bootstrap.Tooltip(tooltipTrigger)
        })
    });
}
    
    