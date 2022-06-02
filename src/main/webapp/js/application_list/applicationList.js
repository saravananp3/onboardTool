var checkScope = false;
var checkRoles = false;
var number = 0;
$(document).ready(function() {
	$.ajax({
		url: "PlanAndPriorityWithinPhase",
		type: 'POST',
		dataType: "json",
		success: function(data) {
			console.log(data);
			var resourceOptions = "<option selected class='options Select' value=''>Select</option>"
			$.each(data[1][0], function(key, value) {
				resourceOptions += "<option class='options resourceOptions' value='" + value.resourcesList + "'>" + value.resourcesList + "</option>";
			});

			$.each(data[0], function(key, value) {
				var opportunityName = value.app_name;
				var phaseName = value.phaseName;
				var waveName = value.waveName;
				var readonly = "readonly";
				var disable = "disabled";

				var t_row = "<tr class='rowClass'>"
					+ "<td><input type = 'text' class ='oppName' value = '" + opportunityName + "'"+disable+" style='width:100%; border:none; text-align:center; background-color: #fff;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + opportunityName + "'></td>"

					+ "<td><input type = 'text' class ='phaseList' id='phaseSearch" + number + "' value = '" + phaseName + "'" + readonly + " style='width:100%; border:none; background-color: #fff; text-align:center;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + phaseName + "'><ul id='phaseResult" + number + "' class='list-group searchResult'></ul></td>"

					+ "<td><input type = 'text' class ='waveList' id='waveSearch" + number + "' value = '" + waveName + "'" + readonly + " style='width:100%; border:none; background-color: #fff; text-align:center;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + waveName + "'><ul id='waveResult" + number + "' class='list-group searchResult'></ul></td>"
					
					+ "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-pencil editpopup'style='display:block;'></span>"+
                  "</td>"+
					
					"<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>" +
                        "<ul class='dropdown-menu' style = 'min-width: inherit;'>" +
                        "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black;'>&nbsp;&nbsp;&nbsp;Edit</a></li>" +
                        "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black;'>&nbsp;&nbsp;&nbsp;Delete</a></li>" +
                        "</ul>" +
                        "</div>" +
                        "</td>" +
					
					"</tr>";
						

				$('#applicationList').append(t_row);				
				number++;
			});
			
			
			$(document).ready(function() {
				$('#appTable').DataTable();
			});

			
		}
	})
});


$(document).on('click', '.EditRow', function() {
	var seqnum = $(this).index('.EditRow');
	var ReadOnly = $('.phaseList').eq(seqnum).is('[readonly]');
	if (ReadOnly) {
		ReadOnlyPropertyConfig(seqnum, false);
		notification("info", "Selected row is editable.", "Info");
		searchPhaseFunction(seqnum);
		searchWaveFunction(seqnum);
	}
	else {
		ReadOnlyPropertyConfig(seqnum, true);
		notification("info", "Selected row is non editable", "Info");
	}

});


function ReadOnlyPropertyConfig(index, prop) {
	var fieldClass = ['phaseList', 'waveList'];
	for (var i = 0; i < fieldClass.length; i++) {
		var checkrole = true;
		if (checkrole) {
			$("." + fieldClass[i]).eq(index).attr('Readonly', '');
			$("." + fieldClass[i]).eq(index).attr('Readonly', prop);
		}
	}
	if (prop == false)
		$(".phaseList").eq(index).focus();
}


$(document).ready(function() {

	$.ajax({
		url: "PlanAndPriorityWithoutPhaseWaveServlet",
		type: 'POST',
		dataType: "json",
		success: function(data) {
			console.log(data);
			
			var resourceOptions = "<option selected class='options Select' value=''>Select</option>"
			$.each(data[1][1][0], function(key, value) {
				resourceOptions += "<option class='options resourceOptions' value='" + value.resourcesList + "'>" + value.resourcesList + "</option>";
			});
			
			var phaseOptions = "<option selected class='options Select' value='Select'>Select</option>"
			$.each(data[1][3][0], function(key, value) {
				phaseOptions += "<option class='phaseOptions options' value='" + value.phaseName + "'>" + value.phaseName + "</option>";
			});
			
			var waveOptions = "<option selected class='options Select' value='Select'>Select</option>"
			$.each(data[1][3][1], function(key, value) {
				var phase = ((value.phaseName).replaceAll(" ", "")).replaceAll("-", "");
				waveOptions += "<option class='options waveOptions " + phase + "' value='" + value.waveName + "'>" + value.waveName + "</option>";
			});
			$.each(data[0][0], function(key, value) {
				var appName = value.appName;
				var disable = "disabled";

				var t_row = "<tr class='rowClass'>"
					+ "<td><input type = 'text' class ='oppName' value = '" + appName + "'"+disable+" style='width:100%; border:none; text-align:center; background-color: #fff;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + appName + "'></td>"

					+ "<td>" + "<select class='form-select phase' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
					phaseOptions +
					"</select>" + "</td>"

					+ "<td>" + "<select class='form-select wave' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
					waveOptions +
					"</select>" + "</td>"
					
					+ "<td>" + "<select class='form-select resource' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
					resourceOptions +
					"</select>" + "</td>"+
					
					"<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>" +
                        "<ul class='dropdown-menu' style = 'min-width: inherit;'>" +
                        "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black;'>&nbsp;&nbsp;&nbsp;Edit</a></li>" +
                        "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black;'>&nbsp;&nbsp;&nbsp;Delete</a></li>" +
                        "</ul>" +
                        "</div>" +
                        "</td>" +
					
					"</tr>";
						

				$('#applicationListWithoutPhase').append(t_row);
			});
			
		}

	})
});

$(document).on('click', '#saveApplicationList', function(e) {
    var validation = false;
    var JsonArray = [];
    var checkDuplicateRole = true;
    for (var i = 0; i < $('.rowClass').length; i++) {
        var inputs = {};
        var opportunityName = $('.oppName').eq(i).val();
        var phase = $('.phase').eq(i).val();
        var wave = $('.wave').eq(i).val();
        var resource = $('.resource').eq(i).val();
        checkDuplicateRole = true;
        validation = true;
        inputs['seq_no'] = i + 1;
        inputs['opportunityName'] = opportunityName;
        inputs['phase'] = phase;
        inputs['wave'] = wave;
        inputs['resource'] = resource;
        JsonArray.push(inputs);
    }
    if (validation && checkDuplicateRole) {
        console.log("JsonArray Retrieve--->", JsonArray);
		applicationListSaveAjaxcall(JsonArray);
 
    }
    else {
        if (!validation)
            notification("warning", "Please fill atleast one row fields.", "Warning");
        if (!checkDuplicateRole)
            notification("warning", "Please provide unique roles.", "Warning");
        checkRoles = false;
    }
    e.preventDefault();
});

function applicationListSaveAjaxcall(JsonArray) {
    var checkAjax = false;
    $.ajax({
        url: "applicationList",
        type: 'POST',
        data: { JsonArray: JSON.stringify(JsonArray) },
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("SAVE DATA:", data);
            JsonObject = data;
            if (data) {
                notification("success", "Saved successfully.", "Note:");
                checkRoles = true;
            }
            else {
                notification("error", "Error occured while saving.", "Error:");
                checkRoles = false;
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}



function searchPhaseFunction(i) {
    $('#phaseSearch' + i).keyup(function() {
        $('#phaseResult' + i).html('');
        var searchField = $('#phaseSearch' + i).val();
        var expression = new RegExp(searchField, "i");
        $.ajax({
            type: "POST",
            url: "OpportunityListServlet",
            dataType: "json",
            success: function(data) {
                console.log(data);
                if (!$.isArray(data)) {
                    data = [data];
                }
                $('#phaseResult' + i).empty();
                $.each(data[3][0], function(key, value) {
                    if (value.phaseName.search(expression) != -1) {
                        $('#phaseResult' + i).append('<li class="list-group-item link-class">' + value.phaseName  + '</li>');
                    }
                });
            }
        });
    });
    $('#phaseResult' + i).on('click', 'li', function() {
        var click_text = $(this).text();
        $('#phaseSearch' + i).val(click_text);
        $("#phaseResult" + i).html('');
        
    });
};


function searchWaveFunction(i) {
    $('#waveSearch' + i).keyup(function() {
        $('#waveResult' + i).html('');
        var searchField = $('#waveSearch' + i).val();
        var expression = new RegExp(searchField, "i");
        $.ajax({
            type: "POST",
            url: "OpportunityListServlet",
            dataType: "json",
            success: function(data) {
                console.log(data);
                if (!$.isArray(data)) {
                    data = [data];
                }
                $('#waveResult' + i).empty();
                $.each(data[3][1], function(key, value) {
					/*var phase = ((value.phaseName).replaceAll(" ", "")).replaceAll("-", "");*/
                    if (value.waveName.search(expression) != -1) {
                        $('#waveResult' + i).append('<li class="list-group-item link-class">' + value.waveName  + '</li>');
                    }
                });
            }
        });
    });
    $('#waveResult' + i).on('click', 'li', function() {
        var click_text = $(this).text();
        $('#waveSearch' + i).val(click_text);
        $("#waveResult" + i).html('');
        
    });
};


$(document).on('change','.phase',function(){
$(".waveOptions").hide();
var phaseName = $(this).val();
if(phaseName!="Select")
    {
    $("."+(phaseName.replaceAll(" ","")).replaceAll("-","")).show();
    $(".wave").val("Select");
    }
    else
    {
    $(".waveOptions").show();
    }
});

$(document).on('change','.filter',function(){
   /* var category = $("#category").val();*/
    var phase = $(".phase").val();
    var wave = $(".wave").val();
    filterAjaxCall(category,phase,wave);
});

/*$(document).on('change','.phaseList',function(){
$("#waveResult").hide();
var phaseName = $(this).val();
if(phaseName!="Select")
    {
    $("."+(phaseName.replaceAll(" ","")).replaceAll("-","")).show();
    $(".waveList").val("Select");
    }
    else
    {
    $("#waveResult").show();
    }
});

$(document).on('change','.filter',function(){
   /* var category = $("#category").val();*/
   /* var phase = $("#phaseResult").val();
    var wave = $("#waveResult").val();
    filterAjaxCall(category,phase,wave);
});*/
function filterAjaxCall(category,phase,wave)
{
    $.ajax({
        url: "OpportunityFilterListServlet",
        type: 'POST',
        dataType: "json",
        data:{wave:wave,category:category,phase:phase,bySearch:false},
        success: function (data) {
            console.log("Data:", data);
             if (!$.isArray(data)) {
                 data = [data];
             } 
        },
        error: function (e) {
            console.log(e);
        }
});
}

$(document).on('click', '.editpopup', function() {
	$('#editpopup_btn').click();
	$.ajax({
		url: "PlanAndPriorityWithinPhase",
		type: 'POST',
		dataType: "json",
		success: function(data) {
			console.log(data);
			var resourceOptions = "<option selected class='options Select' value=''>Select</option>"
			$.each(data[1][0], function(key, value) {
				resourceOptions += "<option class='options resourceOptions' value='" + value.resourcesList + "'>" + value.resourcesList + "</option>";
			});
			var list = "<div class='rowClass' style='text-align:center;'>" + "<select multiple data-live-search='true' class='listOfResource selectpicker' multiple data-actions-box='true'>" + resourceOptions +
				"</select>" +
				"</div>";
			$('#resource-list').append(list);
			$('.listOfResource').selectpicker();
		}

	});

});
