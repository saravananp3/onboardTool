$(document).on('click', '.editpopup', function () {
   $('#editabbreviationbtn').click();
});
  
$('#update_abbreviation_submit').click(function(){
        var seq_no=$('#seq_no_modify').val();
        var app_id=$('#app_id_modify').val();
        var abbreviation_acronym=$("#abbreviation_acronym_modify").val();
        var description=$("#description_modify").val();
        var flag=true;
        var uflag=true;
    if (abbreviation_acronym==""){
     notification("error","Abbreviation/Acronym cannot be null.","Abbreviation Update"); 
     flag=false;   
    }
    if (description==""){
    notification("error","Description cannot be null.","Abbreviation Update");
    flag=false;     
    }
    
    if(flag){
           $.ajax({     
            url: "Update_Abbreviation_Servlet",
            type: 'POST',
            data : {random_id:seq_no,abbreviation_acronym_modify:abbreviation_acronym,description_modify:description},
            dataType: "json",
            success: function (data) {
                var seq_num=data.random_id;
                var abbreviation_acronym=data.abbreviation_acronym;
                var description=data.description;
            
	 		if(data.flag=="Success")
            {
	 		notification("success","Abbreviation/Acronym Details Updated Successfully.","Abbreviation Update");
	 		window.setTimeout(function(){location.reload()},1500)
	 		}  
	 		if(data.partial_update=="Success")
            {
	 		notification("success","Abbreviation/Acronym Details Updated Successfully.","Abbreviation Update");
	 		window.setTimeout(function(){location.reload()},1500)
	 		}              
            }
        });
 }});	
      