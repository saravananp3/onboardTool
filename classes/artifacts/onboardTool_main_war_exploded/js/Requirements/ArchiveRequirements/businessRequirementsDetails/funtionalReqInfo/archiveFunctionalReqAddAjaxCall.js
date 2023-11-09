
var addTableName;
var className;
var tableNameAdd;
var section;
var sectionid;
$(document).ready(function(){
	
	$(document).on('click','.addClass', function(){
		var ClassIndex = $(this).index('.addClass');
		addTableName = "";
		className = "";
		tableNameAdd ="";
		section = "";
        sectionid="";
		getAddProperty(ClassIndex);
		var seqNum = $('.'+section+"RowClass").length;
		archiveFunctionalReqAddAjaxCall(seqNum);
		
	});
});
function getAddProperty(index)
{
	section = Sections[index];
	sectionid=SectionId[index];
	switch(index)
	{
	case 0:
		addTableName="archive_datareq_info";
	    className = "dataReqRowClass";
	    tableNameAdd = "Data Requirements";
	    break;
	case 1:
		addTableName="Archive_RetentionLegalReq_Info";
	    className = "legalReqRowClass";
	    tableNameAdd = "Retention and Legal Requirements";
		break;
	case 2:
		addTableName="Archive_SecurityReq_Info";
	    className = "securityReqRowClass";
	    tableNameAdd = "Security Requirements";
		break;
	case 3:
		addTableName="Archive_UsabilityReq_Info";
	    className = "usabilityReqRowClass";
	    tableNameAdd = "Usability Requirements";
	    
		break;
	case 4:
		addTableName="Archive_AuditReq_Info";
	    className = "auditReqRowClass";
	    tableNameAdd = "Audit Requirements";
		break;
	}
}
function archiveFunctionalReqAddAjaxCall(seqNum){
	
	$.ajax({
        url: "archiveFunctionalDataReqAddServlet",
        type: 'POST',
        data: {seqNum:seqNum,tableName:addTableName},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Data Add Row Retrieve--->",data);
        	if(data.AddStatus){
        		
        		 var Row="<tr class = '"+section+"RowClass' style ='height: 140px;'>"+
            	 "<td style='text-align:center;vertical-align: middle;' class = '"+section+"ReqId'>"+data.ReqId+
            	 "</td>" +
            	 "<td style='text-align:center;vertical-align: middle;'>"+
            	 "<input type ='radio' name='"+section+(seqNum+1)+"' id='"+section+(seqNum+1)+"' class='"+section+"InScope "+section+"Yes' value='Yes'   /> Yes &nbsp;"+
            	 "<input type ='radio' name='"+section+(seqNum+1)+"' id='"+section+(seqNum+1)+"' class='"+section+"InScope "+section+"No' value='No'  /> No"+
            	 "</td>"+
            	 "<td style='text-align:center;vertical-align: middle;'><input type='text' class='dataReq "+section+"ReqType' value='' /></td>" +
            	 "<td style='text-align:center;vertical-align: middle;'>" +
            	 "<textarea rows='2' cols='40' style='height:100px;' class='req "+section+"Requirements' ></textarea>"+
            	 "</td>"+
            	 "<td style='text-align:center;vertical-align: middle;'>"+
            	 "<textarea class='additional "+section+"Additional' value='N/A' >N/A</textarea>"+
            	 "</td>" +
            	 "<td style='text-align:center;vertical-align: middle;'>"+
            	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                 "<ul class='dropdown-menu'>"+
                 "<li><a  class='fa fa-trash DeleteRow "+section+"Delete' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#"+sectionid).append(Row);
            	 $("#"+sectionid+"NoDataScrRow").hide();	
      
           	 	notification("success","Row added Successfully in "+tableNameAdd+".","Note:");
        	}
        	else
        		notification("error","Error occured while adding the row in "+tableNameAdd+".","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}