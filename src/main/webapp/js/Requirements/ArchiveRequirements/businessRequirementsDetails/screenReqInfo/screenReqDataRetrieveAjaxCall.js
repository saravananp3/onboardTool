var dataTypeArr = ['Integer','String','CHAR','VARCHAR'];
var dataRetrievalArr = ['Equal to','Contains','Wildcard','Partial Search'];
var requiredFieldArr = ['Yes','No'];

$(document).ready(function(){
	archiveScreenReqDataRetrieve();	
});

function archiveScreenReqDataRetrieve(){
	$.ajax({
        url: "archiveScreenReqDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("ScreenInfo Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	var checkDataReq = data[0][0].checkData;
        	if(checkDataReq){
        	 var rowCount=0;
             $.each(data[0], function(key, value){
            	 rowCount++;
            	     var Row="<tr class = 'screenReqRowClass'>"+
            	 "<td align='center' class = 'ScreenReqId'>"+value.reqId+
            	 "</td>" +
            	 "<td align='center''>"+
            	 "<input type='text' class = 'screenDisplay' value='"+value.screenDisplay+"' readonly/>"+
            	 "</td>"+
            	 "<td align='center'><input type='text' class='purpose' value='"+value.purpose+"' readonly/></td>" +
            	 "<td align='center'>"+
            	 "<input type='text' class='equivalentLegacy' value='"+value.equivalentLegacy+"' readonly/>"+
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
            	 var option = "<option value = '"+value.reqId+" - "+value.screenDisplay+"'>"+value.reqId+" - "+value.screenDisplay+"</option>"; 
            	 $('#searchFormTypesId').append(option);
             });
        	}
        	else
        	{
			var Row="<tr class = 'screenReqRowClass'id='NoDataScrRecordsRow'>"+
            	 "<td align='center' colspan='5'style='width:100%; text-decoration:bold;'>"+"<label style='color: black;'>No Records Found </label>"+
            	 "</td>" +
            	 "</tr>";
            	 $("#screenReqInfo").append(Row);
            	 $("#saveScreenReqId").attr("disabled","disabled");
			}
            
        	var searchFormDataReq = data[1][0].checkData;
        	var searchFormArray = [];
        	if(searchFormDataReq){
        	 var rowCount=0;
             $.each(data[1], function(key, value){
            	 rowCount++;
            	 var dataTypeOptions = getOptions(dataTypeArr, value.dataType);
            	 var dataRetrievalOptions = getOptions(dataRetrievalArr, value.dataRetrieval);
            	 var requiredFieldOptions = getOptions(requiredFieldArr, value.requiredField);
            	 var parentDelete ="<div class='searchFormDeleteRow Delete'></div>";
            	 if(searchFormArray.includes(value.reqId))
            	 {
            		 parentDelete ="<li><a  class='fa fa-trash searchFormDeleteRow Delete' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>";
            	 }
            	 else
            		searchFormArray.push(value.reqId);
            	var searchFormRow="<tr class = 'searchFormRowClass "+value.reqId.replace("-","")+"'>"+
            	 "<td align='center' class = 'searchFormReqId'>"+value.reqId+
            	 "</td>" +
            	 "<td align='center' class='searchFormName'>"+value.searchForm+
            	 "</td>"+
            	 "<td align='center'><input type='text' class='searchFormFieldName' value='"+value.searchField+"' readonly/></td>" +
            	 "<td align='center'>"+
            	 "<input type='text' class='searchFormFieldFormat' value='"+value.fieldFormat+"' readonly/>"+
            	 "</td>"+
            	 "<td align='center'>"+
            	 "<select class='searchFormDataType' value='"+value.dataType+"' disabled>"+
            	 "<option></option>"+dataTypeOptions+
            	 "</select>"+
            	 "</td>"+
            	 "<td align='center'>"+
            	 "<select class='searchFormDataRetrieval' value='"+value.dataRetrieval+"' disabled>"+
            	 "<option></option>"+dataRetrievalOptions+
            	 "</select>"+
            	 "</td>"+
            	 "<td align='center'>"+
            	 "<select class='searchFormRequiredField' value='"+value.requiredField+"' disabled>"+
            	 "<option></option>"+requiredFieldOptions+
            	 "</select>"+
            	 "</td>"+
            	 "<td style='text-align:center;vertical-align: middle;'>"+
            	 "<textarea class='searchFormAdditionalInfo' value='"+value.additionalInfo+"' readonly>"+value.additionalInfo+"</textarea>"+
            	 "</td>" +
            	 "<td align='center'>"+
            	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                 "<ul class='dropdown-menu' style='margin: -49px -10px 0px -66px'>"+
                 "<li><a  class='fa fa-edit searchFormEditRow Edit' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                 parentDelete+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#searchFormInfo").append(searchFormRow);
             });
        	}
        	
        	else
        	{
			var searchFormRow="<tr class = 'screenReqRowClass' id='NoDataSearchFormRow'>"+
            	 "<td align='center' colspan='9'style='width:100%; text-decoration:bold;'>"+"<label style='color: black;'>No Records Found </label>"+
            	 "</td>" +
            	 "</tr>";
            	 $("#searchFormInfo").append(searchFormRow);
            	 $("#saveSearchFormId").attr("disabled","disabled");
			}
        	
	       /*else
	    	   {
	    	   rowCount++;
      	     var Row="<tr class = 'screenReqRowClass'>"+
      	 "<td style='text-align:center;vertical-align: middle;' class = 'ScreenReqId'>SDR-001"+
      	 "</td>" +
      	 "<td align='center'>"+
      	 "<input type='text' class = 'screenDisplay' value='' readonly/>"+
      	 "</td>"+
      	 "<td align='center'><input type='text' class='purpose' value='' readonly/></td>" +
      	 "<td align='center'>"+
      	 "<input type='text' class='equivalentLegacy' value='' readonly>"+
      	 "</td>"+
      	 "<td align='center'>"+
      	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
           "<ul class='dropdown-menu'>"+
           "<li><a  class='fa fa-edit EditRow Edit' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
           "<li><a  class='fa fa-trash DeleteRow Delete' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
           "</ul>"+
           "</div>"+
      	 "</td>"+
      	 "</tr>";
      	 $("#screenReqInfo").append(Row);
       
	    	   }
       */      var script="<script>$('.datepicker1').datepicker({\n" +
             "format: \"mm/dd/yyyy\",\n"+
             "clearBtn:true,"+
             "autoclose: true,\n"+
             "orientation: 'bottom',"+
             "});";
         
         $('#scripttag').append(script);
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}

function getOptions(optionArr, value){
	
	var options = "";
	for(var i = 0; i<optionArr.length; i++){
		if(optionArr[i] == value)
			options += "<option selected>"+optionArr[i]+"</option>";
		else
			options += "<option>"+optionArr[i]+"</option>";
	}
	
	return options;
}