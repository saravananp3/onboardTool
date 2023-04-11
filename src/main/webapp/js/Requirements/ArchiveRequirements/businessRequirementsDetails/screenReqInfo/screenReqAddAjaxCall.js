$(document).on('click', '#screenReqAddSubmit', function(){
	var displayName = $('#screenReqAddId').val();
	
	if(displayName != '' && displayName != undefined && displayName != null){
		archiveScreenReqAddAjaxCall(displayName);
	}
	else
		notification("warning","Please fill the display name field.","Warning:");
	
});



function archiveScreenReqAddAjaxCall(displayName){
	
	$.ajax({
        url: "archiveScreenReqAddServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        data:{displayName:displayName},
        success: function (data) {
        	console.log("Add Screen Info--->",data);
        	
        	var checkDataReq = data.AddStatus;
        	var checkDisplayName = data.checkDisplay;
        	if(!checkDisplayName){
        		

        	if(checkDataReq){
        	 var rowCount=0;
            $('#NoDataSearchFormRow').hide();
            $('#NoDataScrRow').hide();            
            	 rowCount++;
            	     var Row="<tr class = 'screenReqRowClass'>"+
            	 "<td align='center' class = 'ScreenReqId'>"+data.ReqId+
            	 "</td>" +
            	 "<td align='center'>"+
            	 "<input type='text' class = 'screenDisplay' value='"+displayName+"' readonly/>"+
            	 "</td>"+
            	 "<td align='center'><input type='text' class='purpose' value='' readonly/></td>" +
            	 "<td align='center'>"+
            	 "<input type='text' class='equivalentLegacy' value='' readonly/>"+
            	 "</td>"+
            	 "<td align='center'>"+
            	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                 "<ul class='dropdown-menu'>"+
                 "<li><a  class='fa fa-edit screenInfoEditRow Edit' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                 "<li><a  class='fa fa-trash screenInfoDeleteRow Delete' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#screenReqInfo").append(Row);
            	 notification("success","Row added successfully.","Success:");
            	 $('#closeIdScreenInfo').click();
            	 $('#screenReqAddId').val('');
            	 var ReqID = (data.ReqId).replace("-","");
            	 
            	 var searchFormRow="<tr class = 'searchFormRowClass "+ReqID+"'>"+
            	 "<td align='center' class = 'searchFormReqId'>"+data.ReqId+
            	 "</td>" +
            	 "<td align='center' class='searchFormName' >"+displayName+
            	 "</td>"+
            	 "<td align='center'><input type='text' class='searchFormFieldName' value='' readonly/></td>" +
            	 "<td align='center'>"+
            	 "<input type='text' class='searchFormFieldFormat' value='' readonly/>"+
            	 "</td>"+
            	 "<td align='center'>"+
            	 "<select class='searchFormDataType' value='' disabled>"+
            	 "<option></option>"+
            	 "<option>Integer</option>"+
            	 "<option>String</option>"+
            	 "<option>CHAR</option>"+
            	 "<option>VARCHAR</option>"+
            	 "</select>"+
            	 "</td>"+
            	 "<td align='center'>"+
            	 "<select class='searchFormDataRetrieval' value='' disabled>"+
            	 "<option></option>"+
            	 "<option>Equal to</option>"+
            	 "<option>Contains</option>"+
            	 "<option>Wildcard</option>"+
            	 "<option>Partial Search</option>"+
            	 "</select>"+
            	 "</td>"+
            	 "<td align='center'>"+
            	 "<select class='searchFormRequiredField' value='' disabled>"+
            	 "<option></option>"+
            	 "<option>Yes</option>"+
            	 "<option>No</option>"+
            	 "</select>"+
            	 "</td>"+
            	 "<td style='text-align:center;vertical-align: middle;'>"+
            	 "<textarea class='searchFormAdditionalInfo' value='' readonly></textarea>"+
            	 "</td>" +
            	 "<td align='center'>"+
            	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                 "<ul class='dropdown-menu' style='margin: -49px -10px 0px -70px'>"+
                 "<li><a  class='fa fa-edit searchFormEditRow Edit' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                 "<div class='searchFormDeleteRow Delete'></div>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#searchFormInfo").append(searchFormRow);
            	 
            	 var option = "<option value = '"+data.ReqId+" - "+displayName+"'>"+data.ReqId+" - "+displayName+"</option>"; 
            	 $('#searchFormTypesId').append(option);
        	}
        	else
        		notification("error","Error occured while adding row.","Error:");
        	
        	}
        	else
        		notification("warning","Screen Display Name in Infoarchive already exist","Warning:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}