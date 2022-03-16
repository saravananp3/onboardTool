$(document).ready(function() {
	$('#dataTableId').pageMe({
		pagerSelector: '#developer_page',
		showPrevNext: true,
		hidePageNumbers: false, 
		perPage: 3
	});
});

$(document).ready(function() {
	$('#dataTableId1').pageMe({
		pagerSelector: '#developer_page_1',
		showPrevNext: true,
		hidePageNumbers: false,
		perPage: 4
	});
});

$(document).ready(function() {
	$('#dataTableId2').pageMe({
		pagerSelector: '#developer_page_2',
		showPrevNext: true,
		hidePageNumbers: false,
		perPage: 4
	});
});