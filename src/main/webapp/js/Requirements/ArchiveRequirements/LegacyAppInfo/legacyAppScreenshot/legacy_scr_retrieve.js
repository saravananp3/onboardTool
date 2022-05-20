$(document).ready(function()
{ 
    $.ajax({
        url: "Legacy_App_Scr_Retrieve_Servlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Legacy Screenshots Retrieve",data);
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
        var Id = value.AppId;
        var File_Name = value.File_Name;
               
        var row = "<tr>"+
                "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>"+Id+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+File_Name+"</label>" +
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-download-alt download_btn'style='display:block; margin-left:-15px;'></span><span class='glyphicon glyphicon-trash legacy_scr_deletepopup'id='legacy_scr_delete_icon'style='display:block;float:right;margin-top:-13px; margin-right:18px; margin-left:10px;'></span>"+
                  "</td>"+
                  "</tr>";
                  $("#Legacy_Scr_List").append(row);
    });
}

$(document).on('click', '.legacy_scr_deletepopup', function () {
    $('#legacy_scr_delete_popup').click();
     var File_Name=$("#File_Name").val();
    var seqnum=$(this).index('.download_btn');
    var currentRow=$(this).closest("tr");
    var File_Name=currentRow.find("td:eq(1)").text();
    $('#File_Name').val(File_Name);
   /* var seq_num=$(this).index('.deletepopup');
    var currentRow=$(this).closest("tr");
    var random_id=currentRow.find("td:eq(5)").text();
    $('#random_id').val(random_id);
    $('#DeletePopUp').on('shown.bs.modal', function () {
    });*/
    });


