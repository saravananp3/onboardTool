$(document).on('click', '.add_download_btn', function () {   	
    
    var currentRow=$(this).closest("tr");
    var seq_num=currentRow.find("td:eq(0)").text();   
    var section_no=currentRow.find("td:eq(1)").text();
    var File_Name=currentRow.find("td:eq(3)").text();
     $('#Seq_Number').val(seq_num);
     $('#Section_Number').val(section_no);
     $('#Add_File_Name').val(File_Name);
     $('#addendum_file_submit').click();
     });
     
