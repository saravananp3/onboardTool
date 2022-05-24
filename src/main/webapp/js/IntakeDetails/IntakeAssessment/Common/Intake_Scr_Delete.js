$('#intake_scr_delete_submit').click(function(){
          
     var File_Name=$('#File_Name').val();
        $.ajax({
            url: "IntakeAssessmentScrDeleteServlet",
            type: 'POST',
            data : {File_Name:File_Name},
            dataType: "json",
            success: function (data) {
                File_Name=data.File_Name;
                     $('#deletegrid_update').click();
            }
        });
        notification("warning","Screenshot is Deleted Successfully","Delete Screenshot");
     });
     
     $('#deletegrid_update').click(function() {      
        
       
    $.ajax({
        url: "IntakeAssessmentScrRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Intake Screenshot Retrieve",data);
            if (!$.isArray(data)) {
                data = [data];
            }
             $('#Legacy_Scr_List').html(data);
            /*var parentRow = ""*/
            appendRowFunction(data);
            },
    });
    });
function appendRowFunction(data){
    $.each(data, function(key, value){
        var Id = value.AppId;
        var File_Name = value.File_Name;
               
        var row = "<tr>"+
                "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>"+Id+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+File_Name+"</label>" +
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-download-alt download_btn'style='display:block; margin-left:-15px;'></span><span class='glyphicon glyphicon-trash intake_scr_deletepopup' style='float:right;display:block;margin-top:-13px; margin-right:18px;'></span>"+
                  "</td>"+
                  "</tr>";
                  $("#Legacy_Scr_List").append(row);
    });
}