$(document).ready(function() {
    
	
   
});


$(document).on('click', '.legacy_scr_deletepopup', function() {
    $('#uploaded_file_delete_btn').click();
    var seqnum = $(this).index('.download_btn');
    var currentRow = $(this).closest("tr");
    var File_Name = currentRow.find("td:eq(1)").text();
    $('#File_Name').val(File_Name);
});


