var checkScope = false;
var checkRoles = false;
var number = 0;
var dependencyColumn = "";
var readOnlyValue = "";
var finalCheck;
var exportContent = [];
var JsonObject =[];
var num=0;

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

			var phaseOptions = "<option selected class='options Select' value=''>Select</option>"
			$.each(data[1][3][0], function(key, value) {
				phaseOptions += "<option class='phaseOptions options' value='" + value.phaseName + "'>" + value.phaseName + "</option>";
			});

			var waveOptions = "<option selected class='options Select' value=''>Select</option>"
			$.each(data[1][3][1], function(key, value) {
				var phaseList1 = ((value.phaseName).replaceAll(" ", "")).replaceAll("-", "");
				waveOptions += "<option class='options waveOptions " + phaseList1 + "' value='" + value.waveName + "'>" + value.waveName + "</option>";
			});
			$.each(data[0][0], function(key, value) {
				var appName = value.appName;
				var disable = "disabled";

				var t_row = "<tr class='rowClass1'>"
					+ "<td><input type = 'text' class ='oppName' value = '" + appName + "'" + disable + " style='width:100%; border:none; text-align:center; background-color: #fff;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + appName + "'></td>"

					+ "<td>" + "<select class='form-select phase' id='phase1' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
					phaseOptions +
					"</select>" + "</td>"

					+ "<td>" + "<select class='form-select wave' id='wave1" + num + "' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
					waveOptions +
					"</select>" + "</td>"

				/*	+ "<td>" + "<select class='form-select resource' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
					resourceOptions +
					"</select>" + "</td>" +*/
					
					+ "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-pencil editpopup'style='display:block;'></span>" +
					"</td>" +

					"<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>" +
					"<ul class='dropdown-menu' style = 'min-width: inherit;'>" +
					"<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black;'>&nbsp;&nbsp;&nbsp;Edit</a></li>" +
					"<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black;'>&nbsp;&nbsp;&nbsp;Delete</a></li>" +
					"</ul>" +
					"</div>" +
					"</td>" +

					"</tr>";


				$('#applicationListWithoutPhase').append(t_row);
				num++;
			});

		}

	})
});









$(document).on('click', '#saveApplicationList-1', function(e) {
	var validation = false;
	var JsonArray = [];
	for (var i = 0; i < $('.rowClass1').length; i++) {
		var inputs = {};
		var appId = $('.oppName').eq(i).val();
		var phaseId = $('.phase').eq(i).val();
		var waveId = $('.wave').eq(i).val();
		validation = true;
		inputs['appName'] = appId;
		inputs['phase'] = phaseId;
		inputs['wave'] = waveId;
	    inputs['flag'] = "S";
		JsonArray.push(inputs);
	}
	if (validation) {
		console.log("JsonArray Retrieve--->", JsonArray);
		applicationListSaveAjaxcall(JsonArray);

	}
	else {
		notification("warning", "Please fill atleast one row fields.", "Warning");
	}
	e.preventDefault();
});

function applicationListSaveAjaxcall(JsonArray) {

	$.ajax({
		url: "PlanAndPrioritySaveServlet",
		type: 'POST',
		data: { JsonArray: JSON.stringify(JsonArray) },
		async: false,
		dataType: "json",
		success: function(data) {
			console.log("SAVE DATA:", data);
			JsonObject = data;
			if (data) {
				notification("success", "Saved successfully.", "Note:");
			}
			else {
				notification("error", "Error occured while saving.", "Error:");
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}




$(document).on('change', '#phase1', function(j) {
	$(".waveOptions").hide();
	var phaseName = $(this).val();
	if (phaseName != "Select") {
		$("." + (phaseName.replaceAll(" ", "")).replaceAll("-", "")).show();
		$("#wave1"+j).val("Select");
	}
	else {
		$(".waveOptions").show();
	}
});

$(document).on('change', '.filter', function(i) {
	/* var category = $("#category").val();*/
	var phase = $("#phase1").val();
	var wave = $("#wave1"+j).val();
	filterAjaxCall(category, phase, wave);
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
function filterAjaxCall(category, phase, wave) {
	$.ajax({
		url: "OpportunityFilterListServlet",
		type: 'POST',
		dataType: "json",
		data: { wave: wave, category: category, phase: phase, bySearch: false },
		success: function(data) {
			console.log("Data:", data);
			if (!$.isArray(data)) {
				data = [data];
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}

/*	$(document).on('click', '.editpopup1', function() {*/
		/*var editVar = $(this).parent().siblings(":first").text();*/
		/*var editVar = $(this).closest('tr').children('td:first').text();
		console.log("editVar", editVar);
		var editVar1 = editVar.find("td:eq(1)").value();
		console.log("editVar1", editVar1);
		   });*/
