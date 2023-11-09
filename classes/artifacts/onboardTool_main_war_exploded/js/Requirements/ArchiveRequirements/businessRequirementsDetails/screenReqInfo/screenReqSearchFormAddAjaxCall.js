$(document).on('click', '#searchFormAddSubmit', function(){
	var Value = $('#searchFormTypesId').val();
	if(Value!=""&&Value!=undefined&&Value!=null){
	var splitValue = Value.split('-');
	var reqId = splitValue[0]+splitValue[1].replace(' ','');
	var reqID = splitValue[0]+"-"+splitValue[1].replace(' ','')
	var searchIndex = ($('.'+reqId).length)-1;
	var seqNum = $('.'+reqId).eq(searchIndex).index('.searchFormRowClass')+1;
	var searchFormName = "";
	for(var i=2;i<splitValue.length;i++)
		searchFormName += splitValue[i].replace(' ','');
	archiveSearchFormAddAjaxCall(searchFormName,seqNum,reqID);
	}
	else
		notification("warning","Please fill Search Form Name.","warning");
	
});

function archiveSearchFormAddAjaxCall(searchFormName,seqNum,reqId){
	
	$.ajax({
        url: "archiveScreenSearchFormAddServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        data:{searchFormName:searchFormName, seqNum:seqNum,reqId:reqId},
        success: function (data) {
        	console.log("Add Search Form Info--->",data);
        	
        	var checkDataReq = data.AddStatus;

        	if(checkDataReq){
        	 var rowCount=0;
            
            	 rowCount++;
            	  var reqIdClass = (data.reqId).replace("-","");
            	 var searchFormRow="<tr class = 'searchFormRowClass "+reqIdClass+"'>"+
            	 "<td align='center' class = 'searchFormReqId'>"+data.reqId+
            	 "</td>" +
            	 "<td align='center' class='searchFormName'>"+
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
            	 "<textarea class='searchFormAdditionalInfo' readonly></textarea>"+
            	 "</td>" +
            	 "<td align='center'>"+
            	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                 "<ul class='dropdown-menu' style='margin: -49px -10px 0px -70px'>"+
                 "<li><a  class='fa fa-edit searchFormEditRow Edit' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                 "<li><a  class='fa fa-trash searchFormDeleteRow Delete' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("."+(data.reqId).replace("-","")).last().after(searchFormRow);
      
            	 notification("success","Row added successfully.","Success:");
            	 $('#closeIdsearchForm').click();
            	 $('#searchFormTypesId').val('');
        	}
        	else
        		notification("error","Error occured while adding row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}