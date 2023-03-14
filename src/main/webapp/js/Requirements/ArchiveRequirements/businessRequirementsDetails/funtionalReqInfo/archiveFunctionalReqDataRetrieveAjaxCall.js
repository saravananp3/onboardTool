var Sections=['dataReq','legalReq','securityReq','usabilityReq','auditReq'];
var SectionId =['DataReqId','LegalReqId','SecurityReqId','UsabilityReqId','AuditReqId'];
$(document).ready(function(){
	archiveFunctionalDataRetrieve();
	
	
});


	
function archiveFunctionalDataRetrieve(){
	
	$.ajax({
        url: "archiveDataReqDataRetrieve",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Functional Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 for(var i = 0;i<data.length;i++)
            {				
            
            if (data[i][0]){ 
        	var checkDataReq = data[i][0].checkExistance;
        	if(checkDataReq){
        	 var rowCount=0;
             $.each(data[i], function(key, value){
            	 rowCount++;
            	 var dataReqCheckYesRadio = (value.reqInScope=='Yes')?'checked':'';
            	 var dataReqCheckNoRadio = (value.reqInScope=='No')?'checked':'';
                 var Row="<tr class = '"+Sections[i]+"RowClass' style ='height: 140px;'>"+
            	 "<td style='text-align:center;vertical-align: middle;' class = '"+Sections[i]+"ReqId'>"+value.reqId+
            	 "</td>" +
            	 "<td style='text-align:center;vertical-align: middle;'>"+
            	 "<input type ='radio' name='"+Sections[i]+(rowCount)+"' class='"+Sections[i]+"InScope "+Sections[i]+"Yes' value='Yes' "+dataReqCheckYesRadio+"/> Yes &nbsp;"+
            	 "<input type ='radio' name='"+Sections[i]+(rowCount)+"' class='"+Sections[i]+"InScope "+Sections[i]+"No' value='No' "+dataReqCheckNoRadio+" /> No"+
            	 "</td>"+
            	 "<td style='text-align:center;vertical-align: middle;'><input type='text' class='"+Sections[i]+"ReqType reqType' value='"+value.reqType+"'/></td>" +
            	 "<td style='text-align:center;vertical-align: middle;'>" +
            	 "<textarea rows='2' cols='40' style='height:100px;' class='req "+Sections[i]+"Requirements'>"+value.req+"</textarea>"+
            	 "</td>"+
            	 "<td style='text-align:center;vertical-align: middle;'>"+
            	 "<textarea class='additional "+Sections[i]+"Additional'>"+value.additionInfo+"</textarea>"+
            	 "</td>" +
            	 "<td style='text-align:center;vertical-align: middle;'>"+
            	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                 "<ul class='dropdown-menu'>"+
                 /*"<li><a  class='fa fa-edit EditRow "+Sections[i]+"Edit' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+*/
                 "<li><a  class='fa fa-trash DeleteRow "+Sections[i]+"Delete' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#"+SectionId[i]).append(Row);
             });
        	}
            }
            }
             var script="<script>$('.datepicker1').datepicker({\n" +
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