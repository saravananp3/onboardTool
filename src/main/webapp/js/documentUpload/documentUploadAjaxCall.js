function uploadFiles(){
var fd = new FormData();    
$.each($('#choosen_file_name')[0].files, function(k, value)
            {
                fd.append(k, value);
            });

    $.ajax({
      url: 'documentUploadServlet',
      data: fd,
      processData: false,
      contentType: false,
      async:false,
      type: 'POST',
      success: function(data){
	$('#deletegrid_update').click();
    	  if(data.checkFilesUpload)
    		  notification("success","File uploaded successfully.","Note:");
    	  else
    		  notification("error","Problem occured while file uploading.","Error:");
      }
    });
}