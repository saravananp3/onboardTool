$(document).ready(function()
{   usertablehide();
	 $.ajax({
        url: "retrieve_license_servlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("License Info Retrieve",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            /*var parentRow = ""*/
            appendRowFunction(data);
            },
    });
});
function appendRowFunction(data){
    $.each(data, function(key, value){
	
        var issue_to = value.issue_to;
        var issue_date = value.issue_date;
        var valid_till = value.valid_till;
        if(typeof issue_to !== "undefined" && typeof issue_date !== "undefined" && typeof valid_till !== "undefined")
        {   
        var row = "<tr>"+
                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+issue_to+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+issue_date+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+valid_till+"</label>" +
                 "</td>"+
 
                  "</tr>";
                  $("#license_info_1").append(row);
                  }
    });
}