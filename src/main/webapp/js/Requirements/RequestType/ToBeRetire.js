$(document).ready(function(){
	requestType();
});


function requestType(){
	
	$(".card1").eq(0).removeAttr("href");
	$(".card1").eq(0).addClass("disabled");
	$(".card1").eq(1).removeAttr("href");
	$(".card1").eq(1).addClass("disabled");
	//$(".card1").attr();
	$.ajax({
        url: "ApproverRolesDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Request Type json array----->",data);
			
var value=data.request_type.toString();
if(value == "To be retire"){
	//$(".card1").show();
	$(".card1").eq(0).removeClass("disabled");
	$(".card1").eq(1).removeClass("disabled");
	$(".card1").eq(0).attr("href","ArchiveRequirementsIntroDetails.jsp");
	$(".card1").eq(1).attr("href","	AppDecommInfo.jsp");
	
}   
else if(value == "Archive"){
	//$("#archiveReq").show();
	$(".card1").eq(0).removeClass("disabled");
	$(".card1").eq(0).attr("href","ArchiveRequirementsIntroDetails.jsp");
} 
else if(value == "Decommission"){
	//$("#decomReq").show();
	$(".card1").eq(1).removeClass("disabled");
	$(".card1").eq(1).attr("href","	AppDecommInfo.jsp");
}
}             
         });
	
}