$(document).ready(function()
{	
    $.ajax({
        url: "Retrieve_Abbreviations_Servlet",
        type: 'POST',
        dataType: "json",
        beforeSend : function(){
         $('#overlay').show();
  },
        success: function(data) {
		$('#overlay').hide();
        
            console.log("Retrieved Abbreviation List : ",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            /*var parentRow = ""*/
            appendRowFunction(data);
            },
    });
    
});
function appendRowFunction(data){
    $.each(data, function(key, value){
	    var seq_no = value.seq_no;
        var app_id = value.app_id;
        var abbreviation_acronym = value.abbreviation_acronym;
        var description = value.description;
        if (data[0].checkData){
        var row = "<tr>"+
        		  "<td style='text-align:center;vertical-align: middle;display:none;'><label class='control-label' for=''>"+seq_no+"</label>" +
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+abbreviation_acronym+"</label>" +
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+description+"</label>" +
                  "</td>"+
                  "<td class='useraction' style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-pencil editpopup'id='editpopupabb"+seq_no+"'style='display:block;margin-left:-22px;'></span><span class='glyphicon glyphicon-trash deletepopup' style='float:right;display:block;margin-top:-13px;'></span>"+
                  "</td>"+                  
                  "</tr>";
                 
                  $("#abbreviationlist").append(row);
         }else{
					var row ="<tr><td colspan='4' style='text-align: center;'>No Abbreviations found.</td></tr>"; 
					$("#abbreviationlist").append(row);
				  }
    });
}