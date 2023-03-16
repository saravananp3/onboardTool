$(document).ready(function() {
    $(document).on('click', '.fa-eye', function () {
		$.ajax({
        url: "ArchiveReqAddendumFileRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function(data) {
            console.log("Addendum Files Retrieve", data);
            if (!$.isArray(data)) {
                data = [data];
            }
            appendRowFunction(data);
        },
    });
    $('#addendumViewUploadId').click();
    $('#addendumViewPopUp').on('shown.bs.modal', function () {
    });
    });
});

var count=1;
function appendRowFunction(data) {
    $.each(data, function(key, value) {
        /*var Id = value.oppId;*/
        var File_Name = value.File_Name;
        var row = "<tr>" +
            /*"<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>" + Id + "</label>" +
            "</td>" +*/
            "<td style='text-align:center;vertical-align: middle;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:10ch;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + File_Name + "'><label class='control-label ' for=''>" + File_Name + "</label>" +
            "</td>" +
            "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-download-alt download_btn'style='display:block; margin-left:-15px;'></span><span class='glyphicon glyphicon-trash legacy_scr_deletepopup'id='addendum_file_delete_icon" +count+ "'style='display:block;float:right;margin-top:-13px; margin-right:18px; margin-left:10px;'></span>" +
            "</td>" +
            "</tr>";
		if ($("#Uploaded_Files_List:contains('" + row + "')").length) {
    	$("#Uploaded_Files_List").show();
		} else {
    	$("#Uploaded_Files_List").append(row);
		}
		count++;
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function(tooltipTrigger) {
            return new bootstrap.Tooltip(tooltipTrigger)
        })
    });
}

$(document).on('click', '.legacy_scr_deletepopup', function() {
    $('#uploaded_file_delete_btn').click();
    var seqnum = $(this).index('.download_btn');
    var currentRow = $(this).closest("tr");
    var File_Name = currentRow.find("td:eq(1)").text();
    $('#File_Name').val(File_Name);
});
