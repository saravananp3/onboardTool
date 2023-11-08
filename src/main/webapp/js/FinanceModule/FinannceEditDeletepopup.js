$(document).on('click', '.editpopup', function() {
	$('#editpopup_btn').click();
	var seqnum = $(this).index('.editpopup');
	var currentRow = $(this).closest("tr");
	var ProjectNumber_modify = currentRow.find("td:eq(0)").text();
	var ApplicationName_modify = currentRow.find("td:eq(1)").text();
	var Software_and_Licensing_modify = currentRow.find("td:eq(2)").text();
	var Contract_Date_Modify = currentRow.find("td:eq(3)").text();
	var Scope_modify = currentRow.find("td:eq(4)").text();
	var AvoidanceCost_modify = currentRow.find("td:eq(5)").text();
	var ArchiveCost_modify = currentRow.find("td:eq(6)").text();
	var CBA_modify = currentRow.find("td:eq(7)").text();
	var Approval_modify = currentRow.find("td:eq(8)").text();
	var Type_modify = currentRow.find("td:eq(9)").text();
	var random_id_modify = currentRow.find("td:eq(10)").text();


	$('#ProjectNumber_modify').val(ProjectNumber_modify);
	$('#ApplicationName_modify').val(ApplicationName_modify);
	$('#Software_and_Licensing_modify').val(Software_and_Licensing_modify);
	$('#Contract_Date_Modify').val(Contract_Date_Modify);
	$('#Scope_modify').val(Scope_modify);
	$('#AvoidanceCost_modify').val(AvoidanceCost_modify);
	$('#ArchiveCost_modify').val(ArchiveCost_modify);
	$('#CBA_modify').val(CBA_modify);
	$('#Approval_modify').val(Approval_modify);
	$('#Type_modify').val(Type_modify);
	$('#random_id_modify').val(random_id_modify);
console.log("Random Id Number",random_id_modify);
	$('#EditPopUp').on('shown.bs.modal', function() {
	});
});
$(document).on('click', '.deletepopup', function() {
	$('#deletepopup_btn').click();
	var seq_num = $(this).index('.deletepopup');
	var currentRow = $(this).closest("tr");
	var random_id = currentRow.find("td:eq(5)").text();
	$('#random_id').val(random_id);
	$('#DeletePopUp').on('shown.bs.modal', function() {
	});
});