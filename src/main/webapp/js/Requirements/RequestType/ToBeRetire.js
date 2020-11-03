$(document).ready(function(){
	requestType();
});


function requestType(){
	$(".card1").hide();
	$.ajax({
        url: "ApproverRolesDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Request Type json array----->",data);
			
var value=data.request_type.toString();
if(value == "To be retire"){
	$(".card1").show();
}   
else if(value == "Archive"){
	$("#archiveReq").show();
} 
else if(value == "Decommission"){
	$("#decomReq").show();
}
}             
         });
	
}