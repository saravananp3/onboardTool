$(document).ready(function () {
		$("#UploadFiles").attr('disabled',true);
		});
		$("#fileUpload").change(function () {
	    $('#FileList').show();

		$("#UploadFiles").attr('disabled',false);			

			});
			let state = {};
			
$("#fileUpload").change(function(e) {
	let files = $("#fileUpload")[0].files;
	let filesArr = Array.from(files);
	updateState({ files: files, filesArr: filesArr });
	renderFileList();
});

function updateState(newState) {
	state = { ...state, ...newState };
	console.log(state);
}

function renderFileList() {
	let fileMap = state.filesArr.map((file, index) => {
		let suffix = "bytes";
		let size = file.size;
		if (size >= 1024 && size < 1024000) {
			suffix = "KB";
			size = Math.round(size / 1024 * 100) / 100;
		} else if (size >= 1024000) {
			suffix = "MB";
			size = Math.round(size / 1024000 * 100) / 100;
		}

		return `<li key="${index}">${
			file.name
		} <span class="file-size">${size} ${suffix}</span><i class="glyphicon glyphicon-trash deletepopup" alt='delete'></i></li>`;
	});
	$("#FileList").html(fileMap);
}

$(".files").on("click", "li > i", function(e) {
	let key = $(this)
		.parent()
		.attr("key");
	let curArr = state.filesArr;
	curArr.splice(key, 1);
	updateState({ filesArr: curArr });
	renderFileList();
});

$("#UploadFiles").click(function(){
var fd = new FormData();    
$.each($('#fileUpload')[0].files, function(k, value)
            {
                fd.append(k, value);
            });

    $.ajax({
      url: 'ArchiveRequirementsAddendumFileUpload',
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