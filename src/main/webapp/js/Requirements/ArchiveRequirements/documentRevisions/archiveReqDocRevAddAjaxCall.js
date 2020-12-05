$(document).ready(function (){
	
$(document).on('click','#docRevAdd', function(){
		
		var seqNum = $('.rowClassDoc').length;
	
		archiveReqDecRevAddAjaxCall(seqNum);
		
	});
	
});

function archiveReqDecRevAddAjaxCall(seqNum){
	
	$.ajax({
        url: "archiveReqDecRevAddServlet",
        type: 'POST',
        data: {seqNum:seqNum},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Add Row Retrieve--->",data);
        	
        	if(data.AddStatus){
        		var Row="<tr class = 'rowClassDoc'>"+
           	 "<td><input type ='text' class='date' value='' readonly></td>" +
           	 "<td><input type ='text' class='version' value='' readonly></td>" +
           	 "<td><input type ='text' class='documentChanges' value='' readonly></td>" +
           	 "<td><input type ='text' class='changeAuthor' value='' readonly></td>" +
           	 "<td>"+
           	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                           "<ul class='dropdown-menu'>"+
                           "<li><a  class='fa fa-edit EditRowDoc' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                           "<li><a  class='fa fa-trash DeleteRowDoc' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                           "</ul>"+
                           "</div>"+
           	 "</td>" +
           	 "</tr>";
           	 $("#docRevInfo").append(Row);
           	 	notification("success","Row added Successfully.","Note:");
        	}
        	else
        		notification("error","Error occured while adding the row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}
