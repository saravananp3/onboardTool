$(document).ready(function()
{	
    $.ajax({
        url: "FinanceTableDetailsServlet",
        type: 'POST',
        dataType: "json",
        beforeSend : function(){
         $('#overlay').show();
  },
        success: function(data) {
		$('#overlay').hide();
        
            console.log("FinanceDetails",data);
            if (!$.isArray(data)) {
                data = [data];
             console.log("FinanceDetailsInside If",data);
            }
         
            appendRowFunction(data);
            },
    });
    
});
function appendRowFunction(data){
    $.each(data, function(key, value){
	  var Project_Number = value.Project_Number;
	    var Application_Name = value.Application_Name;
      
        var Software_and_Licensing = value.Software_and_Licensing;
        var Contract_Date = value.Contract_Date;
        var scope_of_infrastructure = value.scope_of_infrastructure;
        var Cost_Avoidance = value.Cost_Avoidance;
        var Cost_of_Archive = value.Cost_of_Archive;
        var CBA = value.CBA;
        var Funding_approval = value.Funding_approval;
        var Funding_type = value.Funding_type;
       console.log("The from everything",value);
        if(typeof Project_Number !== "undefined" && typeof Application_Name !== "undefined" && typeof Software_and_Licensing !== "undefined" && typeof Contract_Date !== "undefined" && typeof scope_of_infrastructure !== "undefined" && typeof Cost_Avoidance !== "undefined" && typeof Cost_of_Archive !== "undefined" && typeof CBA !== "undefined" && typeof Funding_approval !== "undefined" && typeof Funding_type !== "undefined")
        {
        var row = "<tr>"+ "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+Project_Number+"</label>" +
                 "</td>"+
                "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+Application_Name+"</label>" +
                 "</td>"+
                 "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+Software_and_Licensing+"</label>" +
                 "</td>"+
                 "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+Contract_Date+"</label>" +
                 "</td>"+
                 "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+scope_of_infrastructure+"</label>" +
                 "</td>"+
                  "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+Cost_Avoidance+"</label>" +
                 "</td>"+
                  "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+Cost_of_Archive+"</label>" +
                 "</td>"+
                  "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+CBA+"</label>" +
                 "</td>"+
                  "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+Funding_approval+"</label>" +
                 "</td>"+
                  "<td style='text-align:center; vertical-align: middle;'><label class='control-label' for=''>"+Funding_type+"</label>" +
                 "</td>"+
                  "<td class='useraction' style='text-align:center; vertical-align: middle; display:none;'><span class='glyphicon glyphicon-pencil editpopup'id='editpopup"+random_id+"'style='display:block;margin-left:-22px;'></span><span class='glyphicon glyphicon-trash deletepopup' style='float:right;display:block;margin-top:-13px;'></span>"+
                  "</td>"+
                  "</tr>";
                 
                  $("#FinanceDetails").append(row);
                  }
                AddAndEdit();
                  getPagination1('#FinanceDetails');
    });
}