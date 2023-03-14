$('#add_abbreviation_submit').click(function(){
        var abbreviation_acronym=$("#abbreviation_acronym").val();
        var abb_description=$("#abb_description").val();
        if(abbreviation_acronym=="")
        {
		notification("error","Please enter the Abbreviation","Note");
		}
		 if(abb_description=="")
        {
		notification("error","Please enter the Description","Note");
		}
		
        $.ajax({
            url: "Add_Abbreviation_Servlet",
            type: 'POST',
            data : {abbreviation_acronym:abbreviation_acronym,abb_description:abb_description},
            dataType: "json",
            success: function (data) {
			
	 		if(data.flag=="Success")
            {
	 		notification("success","Abbreviation and its Description are added successfully.","Note");
	 		window.setTimeout(function(){location.reload()},1500)
	 		}
                console.log("Data",data);
                
        } 
           
        });
        
       });
        

       
       
    $(document).on('click', '.editpopup', function () {
    $('#editpopup_btn').click();
    var seqnum=$(this).index('.editpopup');
    var currentRow=$(this).closest("tr");
    var abbreviation_acronym_modify=currentRow.find("td:eq(1)").text();
    var description_modify=currentRow.find("td:eq(2)").text();
    var random_id_modify=currentRow.find("td:eq(0)").text();
    
    
     $('#abbreviation_acronym_modify').val(abbreviation_acronym_modify);
     $('#description_modify').val(description_modify);
     $('#seq_no_modify').val(random_id_modify);
     
    $('#EditPopUp').on('shown.bs.modal', function () {
    });
    
    
    });
    
    
    $(document).on('click', '.deletepopup', function () {
    $('#deletepopup_btn').click();
    var seq_num=$(this).index('.deletepopup');
    var currentRow=$(this).closest("tr");
    var random_id=currentRow.find("td:eq(0)").text();
    console.log("Delete "+random_id);
    $('#seq_no_dlt').val(random_id);
    $('#DeletePopUp').on('shown.bs.modal', function () {
    });
    });