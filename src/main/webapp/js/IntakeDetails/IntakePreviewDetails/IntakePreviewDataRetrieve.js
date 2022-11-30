var dependencyColumn = "";
var readOnlyValue = "";
var finalCheck;
var exportContent = [];
$(document).ready(function() {
	// @Html.Partial("_WaitModal");
	var progressCss = $("#emailProgress");
	//complete:function showSpin(){$("#loading-overlay").hide();}
	IntakePreviewDataRetrieveAjaxCall();

	$(document).on('click', '#exportPdf', function(o) {
		$.ajax({
			url: "exportPdfServlet",
			type: 'POST',
			async: false,
			dataType: "json",
			data: { jsonContent: JSON.stringify(exportContent), modulename: "INTAKE" },
			success: function(data) {
				var pdfPath = data.path;
				pdfPath = pdfPath.replaceAll("\\", "//");
				window.location.href = "downloadPDFservlet?path='" + pdfPath + "'";
				//downloadPDFAjaxCall(pdfPath);
				//setTimeout(deletePDFAjaxCall(pdfPath), 2000);
				//deletePDFAjaxCall(pdfPath);
				o.preventDefault();
			},
			error: function(e) { console.log(e); }

		});
	});
	$(document).on('click', '#button_id', function() {
		// $("#loading_overlay").show();
		//showSpin();
		//$("#loading_overlay").attr("style","display:block;");
		//$("#loading_overlay").html(progressCss.val());

		emailAjaxCall("INTAKE");

	});
});

function IntakePreviewDataRetrieveAjaxCall() {
	$.ajax({
		url: "IntakePreviewDataRetrieveServlet",
		type: 'POST',
		dataType: "json",
		success: function(data) {
			console.log("Data Retrieve Preview json array----->", data);
			exportContent = data;
			var inputs = {};
			$("#OpportunityInfoPreview").html("");
			$("#TriageInfoPreview").html("");
			$("#TriageSummInfoPreview").html("");
			$("#ApplicationInformationPreview").html("");
			$("#DataCharacteristicsPreview").html("");
			$("#ComplianceCharacteristicsPreview").html("");
			$("#ArchivalConsumptionPreview").html("");
			$("#ContractInformationPreview").html("");
			$("#StakeHolderInfoPreview").html("");


			for (var i = 0; i < data[0].length; i++) {
				var OppTag = "<pre style='font-family:verdana;font-size:90%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:140ch;'data-bs-toggle='tooltip' data-bs-placement='top' title='"+data[0][i].Value+"' class = 'OppInfoPreview'><b>"+data[0][i].LabelName+"</b> : "+data[0][i].Value+" </pre>";
				$("#OpportunityInfoPreview").append(OppTag);
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                    return new bootstrap.Tooltip(tooltipTrigger) 
    });
			}

			var checkTriageDependency;
			for (var j = 0; j < data[1].length; j++) {

				var triageStyle = "";

				var column_name = data[1][j].ColumnName;

				var columnValue = data[1][j].Value;

				if (column_name == 'Preliminary_CBA') {
					var formatter = new Intl.NumberFormat('en-US', {
						style: 'currency',
						currency: 'USD',

					});
					columnValue = formatter.format(columnValue)
				}

				if (checkTriageDependency)
					triageStyle = "display:none;";

				     	var TriageTag = "<pre style='font-family:verdana;font-size:90%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:140ch;"+triageStyle+"' data-bs-toggle='tooltip' data-bs-placement='top' title='"+data[1][j].Value+"' class = 'TriageInfoPreview'><b>"+data[1][j].LabelName+"</b> : "+data[1][j].Value+" </pre>";
				checkTriageDependency = checkDependency(column_name, columnValue);

				$("#TriageInfoPreview").append(TriageTag);
					var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                    return new bootstrap.Tooltip(tooltipTrigger) });
			}

			for (var k = 0; k < data[2].length; k++) {
					var TriageSummTag = "<pre style='font-family:verdana;font-size:90%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:140ch;' data-bs-toggle='tooltip' data-bs-placement='top' title='"+data[2][k].Value+"'class = 'TriageSummInfoPreview'><b>"+data[2][k].LabelName+"</b> : "+data[2][k].Value+" </pre>";
				$("#TriageSummInfoPreview").append(TriageSummTag);
				     	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                    return new bootstrap.Tooltip(tooltipTrigger) });
			}

			var checkAssessmentDependency;

			for (var l = 0; l < data[3].length; l++) {

				for (var m = 0; m < data[3][l].length; m++) {

					var assessmentStyle = "";

					var column_name = data[3][l][m].ColumnName;

					var columnValue = data[3][l][m].Value;

					var check = checkReadOnlyData(column_name);

					if (checkAssessmentDependency)
						assessmentStyle = "display:none;";

					if (check) {
						assessmentStyle = "";
					}
					else if (finalCheck) {
						finalCheck = false;
						assessmentStyle = "display:none;";
					}
					if (data[3][l][m].ColumnName == "AppDetails" && data[3][l][m].section == "ApplicationInformation" && data[3][l][m].Value === "COTS – Commercial Off The Shelf" || data[3][l][m].Value === "MOTS – Modified Off The Shelf")
						$("#ContractInformationPreview").show();

					var AssessmentTag = "<pre style='font-family:verdana;font-size:90%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:140ch;"+assessmentStyle+"' data-bs-toggle='tooltip' data-bs-placement='top' title='"+data[3][l][m].Value+"'class = 'AssessmentPreview'><b>"+data[3][l][m].LabelName+"</b> : "+data[3][l][m].Value+" </pre>";
					checkAssessmentDependency = checkDependency(column_name, columnValue);

					$("#" + data[3][l][m].section + "Preview").append(AssessmentTag);
					 var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                    return new bootstrap.Tooltip(tooltipTrigger) });
				}
			}

			 var table = "<table class='table table-bordered'style='white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:144ch;'>"+
				"<thead>" +
				"<tr>" +
				"<th>Name</th>" +
				"<th>Email</th>" +
				"<th>User Name</th>" +
				"<th>Role</th>" +
				"<th>Approval Status</th>" +
				"</tr>" +
				"</thead>" +
				"<tbody id = 'StakeHolder'>";


			for (var n = 1; n < data[4].length; n++) {

				// var stakeHolderTag = "<pre
				// style='font-family:verdana;font-size:100%;' class =
				// 'stakeHolderInfoPreview'><b>"+data[4][n].LabelName+"</b> :
				// "+data[4][n].Value+" </pre>";
				table += "<tr>"+
            				"<td style='font-family:verdana;font-size:90%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:50ch;'>"+data[4][n].name+"</td>"+
            				"<td style='font-family:verdana;font-size:90%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:50ch;'data-bs-toggle='tooltip' data-bs-placement='top' title='"+data[4][n].emailId+"'>"+data[4][n].emailId+"</td>"+
            				"<td style='font-family:verdana;font-size:90%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:50ch;'>"+data[4][n].username+"</td>"+
            				"<td style='font-family:verdana;font-size:90%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:50ch;'>"+data[4][n].role+"</td>"+
            				"<td style='font-family:verdana;font-size:90%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:50ch;'>"+data[4][n].intakeApproval+"</td>"+
            			  "</tr>";
			}
			table += "</tbody>" +
				"</table>";
			$("#StakeHolderInfoPreview").append(table);
			 var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                    return new bootstrap.Tooltip(tooltipTrigger) });
			notification("info", "Review of previous details.", "Info");
			// var onclick_attr = $("#ReviewNextBtn").attr("onclick");
			$("#ReviewNextBtn").attr("onclick", "location.href='IntakeApproval.jsp?a_id=" + data[5].a_id + "';");
			$(".ReviewNextBtn").attr("onclick", "location.href='IntakeApproval.jsp?a_id=" + data[5].a_id + "';");

			if (data[5].checkRequestSign == 1) {
				$("#button_id").show();
			}
			else {
				$("#button_id").show();
			}
			var checkReviewPage = data[data.length - 1].CheckExistence;
			if (checkReviewPage == true) {
				$("#ReviewNextBtn").show();
				$("#ReviewPrevBtn").show();
				$("#button_id").hide();
			}
		},
		error: function(e) {
			console.log(e);

		}

	});
}


function dependencyKeyValuePair() {

	var inputs = {};

	// Triage Dependency
	inputs["rationalization_type"] = "Other";
	inputs["appPlatfrm"] = "Other";
	inputs["app_and_data_hosted"] = "Yes";
	inputs["compliance"] = "Yes";
	inputs["Financialdate"] = "Yes";
	inputs["TechincalDeterminingdate"] = "Yes";

	// Application Info Dependency
	inputs["AssessAppPlatform"] = "Others";
	inputs["ComplianceLegalDrivers"] = "Yes";
	inputs["BusinessDriversDrivers"] = "Yes";
	inputs["TechnicalDrivers"] = "Yes";
	inputs["SupportedApp"] = "No";

	// DataChar Dependency
	inputs["DataSetMainframe"] = "Yes";
	inputs["ReportGeneration"] = "Yes";
	// inputs["ReadonlyData"] = "Yes";
	// inputs["ReadonlyData"] = "No";
	inputs["UpDownStream"] = "Yes";

	// Archival Dependency
	inputs["legalhold"] = "Yes";
	inputs["specificpurgerequirements"] = "Yes";

	return inputs;
}

function dependencyKeyValueColumnPair() {

	var inputs = {};

	// Triage Dependency
	inputs["rationalization_type"] = "If_other_please_describe";
	inputs["appPlatfrm"] = "If_Other_describe";
	inputs["app_and_data_hosted"] = "vendor";
	inputs["compliance"] = "describe";
	inputs["Financialdate"] = "plsdescribe";
	inputs["TechincalDeterminingdate"] = "pls_describe";

	// Application Info Dependency
	inputs["AssessAppPlatform"] = "OtherPleaseDescribe";
	inputs["ComplianceLegalDrivers"] = "PleaseDescribe1";
	inputs["BusinessDriversDrivers"] = "PleaseDescribe2";
	inputs["TechnicalDrivers"] = "PleaseDescribe3";
	inputs["SupportedApp"] = "SupportApp";

	// DataChar Dependency
	inputs["DataSetMainframe"] = "plsprovideinfo";
	inputs["ReportGeneration"] = "plsprovidedetails";
	// inputs["ReadonlyData"] = "LastUpdateMade";
	// inputs["ReadonlyData"] = "ExpectedDate";
	inputs["UpDownStream"] = "plsdescribeStreams";

	// Archival Dependency
	inputs["legalhold"] = "ifanypleasedescribe";
	inputs["specificpurgerequirements"] = "describedetails";

	return inputs;
}


function checkDependency(ColumnName, Value) {
	var boolean = false;

	var inputs = dependencyKeyValuePair();

	var inputsValueColumn = dependencyKeyValueColumnPair();

	if (inputs.hasOwnProperty(ColumnName)) {

		if (inputs[ColumnName] == Value) {
			boolean = false;
			dependencyColumn = inputsValueColumn[ColumnName];
		}
		else {
			boolean = true;
			dependencyColumn = "";
		}

	}
	else if (ColumnName == "ReadonlyData") {
		finalCheck = true;
		dependencyColumn = "";
		if (Value == "Yes")
			readOnlyValue = "LastUpdateMade";
		else if (Value == "No")
			readOnlyValue = "ExpectedDate";
	}
	else {
		dependencyColumn = "";
	}
	return boolean;

}
function checkReadOnlyData(ColumnName) {

	var checkBoolean = false;

	if (ColumnName == readOnlyValue) {
		checkBoolean = true;
		readOnlyValue = "";
	}
	return checkBoolean;

}
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}