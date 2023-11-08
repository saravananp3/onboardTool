function exportToCSV() {

	var table = document.querySelector('.table');

	var data = [];
	for (var i = 0; i < table.rows.length; i++) {
		var row = table.rows[i];
		var rowData = [];
		for (var j = 0; j < row.cells.length; j++) {
			rowData.push(row.cells[j].textContent.trim());
		}
		data.push(rowData);
	}
	var csvContent = "data:text/csv;charset=utf-8,";
	data.forEach(function(rowArray) {
		var row = rowArray.join(",");
		csvContent += row + "\r\n";
	});
	var encodedUri = encodeURI(csvContent);
	var link = document.createElement("a");
	link.setAttribute("href", encodedUri);
	link.setAttribute("download", "IntakeReportDetails.csv");
	document.body.appendChild(link);

	link.click();
}