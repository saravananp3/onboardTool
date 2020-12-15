$(document).ready(function(){
	archiveReqAddendumDataRetrieveAjaxCall();
});

function archiveReqAddendumDataRetrieveAjaxCall(){
	
	$.ajax({
        url: "archiveReqAddendumDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 $("#inputFieldsAddendum").html("");
        	 var checkTable = data[0].checkExistance;
        	 var delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
        	 if(checkTable){
             $.each(data, function(key, value){
            	 
            	 var Row="<div class='addendumField'>"+
            	 		 "<label class='editable' contenteditable='true'>"+value.labelName+"</label>"+delete_icon+
            	 		 
            	 		 "<textarea rows='2' cols='130' style='height:100px;' class='req addendumInfo'>"+value.addendumInfo+"</textarea>"+
            	 		"</div>";
            	 $("#inputFieldsAddendum").append(Row);
            	 });
            	 }
        	 
        	 else{
        		 var Row="<div class='addendumField'>"+
        	 		 "<label class='editable' contenteditable='true'>Section 1</label>"+delete_icon+
        	 		 
        			 "<textarea rows='2' cols='130' style='height:100px;' class='req addendumInfo'></textarea>";
        		 "</div>";
        		 $("#inputFieldsAddendum").append(Row);
             	}
        	
        	     },
        error: function (e) {
            console.log(e);
        }
    });
}