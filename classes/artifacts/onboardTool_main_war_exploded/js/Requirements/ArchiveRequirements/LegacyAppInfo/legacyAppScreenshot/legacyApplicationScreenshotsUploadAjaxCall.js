$(document).ready(function () {
		$("#UploadFiles").attr('disabled',true);
		});
		$("#fileUpload").change(function () {
	    $('#FileList').show();

		$("#UploadFiles").attr('disabled',false);			

			});

$("#UploadFiles").click(function(){
var fd = new FormData();    
$.each($('#fileUpload')[0].files, function(k, value)
            {
                fd.append(k, value);
            });

    $.ajax({
      url: 'legacyApplicationScreenshotsUpload',
      data: fd,
      processData: false,
      contentType: false,
      async:false,
      type: 'POST',
      success: function(data){
    	  if(data.checkFilesUpload){
    		  $('#deletegrid_update').click();    
    		  $('#FileList').hide();
    		  notification("success","File uploaded successfully.","Note:");
    		   $("#fileUpload").val('');
    		  $("#UploadFiles").attr('disabled',true);
    		    }
    	  else
    		  notification("error","Problem occured while file uploading.","Error:");
      }
    });
});