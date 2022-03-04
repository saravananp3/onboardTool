$(document).ready(function() {
	dashboardDetails();
});
function dashboardDetails() {
	$.ajax({
		url: "dashboardServlet",
		type: 'POST',
		async: false,
		dataType: "json",
		success: function(data) {
			console.log("Data : ", data);
			if (data[0].phaseCount == 0 || data[0].phaseCount == 1)
				$(".font_icon").eq(0).html('Phase');
			if (data[0].waveCount == 0 || data[0].waveCount == 1)
				$(".font_icon").eq(1).html('Wave');
			if (data[0].appCount == 0 || data[0].appCount == 1)
				$(".font_icon").eq(2).html('App');
			$('.totcounter').eq(0).html(data[0].phaseCount);
			$('.totcounter').eq(1).html(data[0].waveCount);
			$('.totcounter').eq(2).html(data[0].appCount);
			google.charts.load('current', { 'packages': ['table'] });
			google.charts.setOnLoadCallback(drawTable);
			function drawTable() {
				var data = new google.visualization.DataTable();
				data.addColumn('string', 'App Name');
				data.addColumn('string', 'Type');
				data.addColumn('string', 'Status');
				data.addColumn('string', 'Phase');
				data.addColumn('string', 'Wave');
				data.addColumn('string', 'End date');
				data.addColumn('string', 'Owner');
				data.addRows([
					['App1', 'Intake', 'Plan and Priority', 'Phase1', 'Wave1', '27-01-2022', 'Satya'],
					['App2', 'Archive', 'Plan and Priority', 'Phase1', 'Wave1', '27-01-2022', 'Satya'],
					['App3', 'Intake', 'Plan and Priority', 'Phase1', 'Wave1', '27-01-2022', 'Harsha'],
					['App4', 'Archive', 'Plan and Priority', 'Phase1', 'Wave1', '27-01-2022', 'Ravi']
				]);
				var table = new google.visualization.Table(document.getElementById('table_chart'));
				table.draw(data, { showRowNumber: true, width: '100%', height: '100%' });
			}
			/*google.charts.load("current", {packages:["corechart"]});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() {
			  var dataValue = google.visualization.arrayToDataTable([
				['Task', 'Hours per Day'],
				['Application in Intake module', 3],
				['Application in Requirement module', 1],
				['Application in Execution module', 2],
				['Application in Decommission module',4 ],
			  ]);
			  //zoom = ( window.outerWidth - 10 ) / window.innerWidth
			  var currFFZoom = 1;
			  var currIEZoom = 100;
			  var step = 2;
			  currIEZoom += step;
			  var options = {
				pieHole: 0.4,
				width: 600,
				height: 400,
			  };
			  var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
			  chart.draw(dataValue, options);
			}
*/
			$.each(data[2], function(key, value) {
				var option = "<option>" + value + "</option>";
				$('#oppNameDrop').append(option);
			});
			ganttChartDetails(data[3]);
			google.charts.load("current", { packages: ["corechart"] });
			google.charts.setOnLoadCallback(drawBarChart);
			var barChartData = [];
			var obj = ['Opportunity', 'Db Size in Gb'];
			barChartData.push(obj);
			$.each(data[4], function(key, value) {
				obj = [];
				obj.push(value.oppName);
				obj.push(value.totalDBSize);
				barChartData.push(obj);
			});
			var pieChartData = [];
			var obj = ['Application Type', 'Number of Application'];
			pieChartData.push(obj);
			//$.each(data[5],function(key,value){
			obj = [];
			obj.push("Archive");
			obj.push(data[5].archiveCount);
			pieChartData.push(obj);
			obj = [];
			obj.push("Decommission");
			obj.push(data[5].decommissionCount);
			pieChartData.push(obj);
			obj = [];
			obj.push("To be Retired");
			obj.push(data[5].retiredCount);
			pieChartData.push(obj);
			
			google.charts.load('current', { 'packages': ['corechart'] });
			google.charts.setOnLoadCallback(drawPieChart);
			function drawPieChart() {
				var pieData = google.visualization.arrayToDataTable(pieChartData);
				var pieOptions = {
					/*title: 'Application',*/
					colors: ['#83ddd4', '#1d88aa', '#1f346d']
				};
				var pieChart = new google.visualization.PieChart(document.getElementById('pieChartId'));
				pieChart.draw(pieData, pieOptions);
			}
			
			$.each(data[4], function(key, value) {
				var t_row = "<tr>"
					+ "<td>" + value.appName + "</td>"
					+ "<td>" + value.appType + "</td>"
					+ "<td>" + value.appStatus + "</td>"
					+ "<td>" + value.progress + "</td>"
					+ "<td>" + value.phaseName + "</td>"
					+ "<td>" + value.waveName + "</td>"
					+ "<td>" + value.endDate + "</td>"
					+ "<td>" + value.owner + "</td>"
					+ "</tr>";
				$('#dataTableId').append(t_row);
			});
			$(document).ready(function() {
				$('#example').DataTable();
			});
			$.each(data[6], function(key, value) {
				var t_row = "<tr>"
					+ "<td>" + value.appName + "</td>"
					+ "<td>" + value.module + "</td>"
					+ "<td>" + value.dueDate + "</td>"
					+ "<td>" + value.resource + "</td>"
					+ "<td>" + value.status + "</td>"
					+ "</tr>";
				$('#dataTableId1').append(t_row);
			});
			$(document).ready(function() {
				$('#example1').DataTable();
			});
			
			$.each(data[7], function(key, value) {
				var t_row = "<div class='row'>" 
				+ "<div class='p-2 border border-danger col-md-8' style='background-color: #f5dfe3;border-radius: 4px; width:85%; margin-left: 10px; font-size: 16px; font-weight: 500;'>Risks</div>"
				+ "<div class='p-2 border border-danger col-md-4' style='background-color: #f80206; width:10%;text-align:center;color:#fff; font-size: 16px;'>" + value.riskCount + "</div>"
				+ "</div>" + 
				 "<div class='row mt-4'>" 
				+ "<div class='p-2 border border-warning col-md-8' style='background-color: #f3eae3;border-radius: 4px; width:85%; margin-left: 10px; font-size: 16px; font-weight: 500;'>Issues</div>"
				+ "<div class='p-2 border border-warning col-md-4' style='background-color: #fe7800; width:10%;text-align:center;color:#fff; font-size: 16px;'>" + value.issueCount + "</div>"
				+ "</div>" +
				 "<div class='row mt-4'>" 
				+ "<div class='p-2 border border-primary col-md-8' style='background-color: #cedde6;border-radius: 4px; width:85%; margin-left: 10px; font-size: 16px; font-weight: 500;'>Deadlines</div>"
				+ "<div class='p-2 border border-primary col-md-4' style='background-color: #1464c5; width:10%;text-align:center;color:#fff; font-size: 16px;'>" + value.deadlineCount + "</div>"
				+ "</div>";
				$('#dataCountIssue').append(t_row);
			});
			
			/*$.each(data[8], function(key, value) {
				var list = "<li><div data-percentage='" + value.db2Percent + "' class='bar'></div><span>DB2</span></li>"
					+ "<li><div data-percentage='" + value.msSqlPercent + "' class='bar'></div><span>MS SQL</span></li>"
					+ "<li><div data-percentage='" + value.mySqlPercent + "' class='bar'></div><span>MySQL</span></li>"
					+ "<li><div data-percentage='" + value.oraclePercent + "' class='bar'></div><span>Oracle</span></li>"
					+ "<li><div data-percentage='" + value.sybasePercent + "' class='bar'></div><span>Sybase</span></li>"
					+ "<li><div data-percentage='" + value.otherPercent + "' class='bar'></div><span>Other</span></li>";
				$('#bars').append(list);
				$("#bars li .bar").each(function(key, bar) {
					var percentage = $(this).data('percentage');
					$(this).animate({
						'height': percentage,
					}, 1000);
				})
			})
			
			google.charts.load("current", { packages: ['corechart'] });
			google.charts.setOnLoadCallback(drawChart);
			$.each(data[8],function drawChart(key, value) {
				console.log(data[8]);
				var data = google.visualization.arrayToDataTable([
					["State", "$", { role: "style" }],
					['Sum of Realized', 110000.00, 'blue'],
					['Sum of in Process', 365000, 'blue'],
					['Sum of Intake/Opportunity', 192000.00, 'blue']]);

				var view = new google.visualization.DataView(data);
				view.setColumns([0, 1,
					{
						calc: "stringify",
						sourceColumn: 1,
						type: "string",
						role: "annotation"
					},
					2]);

				var options = {
					title: "Total",
					width: 400,
					height: 250,
					bar: { groupWidth: "25%" },
					legend: { position: "none" },
				};
				var chart = new google.visualization.ColumnChart(document.getElementById("columnChartId"));
				chart.draw(view, options);
			});
			*/
			
			$.each(data[8],function(key,value){
  	var perfix="<li style='font-size: 11px;'><span>100%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>90%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>80%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>70%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>60%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>50%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>40%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>30%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>20%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>10%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>0%</span><hr></li>";
                /* var perfix="<li style='font-size: 12px;'><span>100%</span></li>"+
                "<li style='font-size: 12px;'><span>90%</span></li>"+
                "<li style='font-size: 12px;'><span>80%</span></li>"+
                "<li style='font-size: 12px;'><span>70%</span></li>"+
                "<li style='font-size: 12px;'><span>60%</span></li>"+
                "<li style='font-size: 12px;'><span>50%</span></li>"+
                "<li style='font-size: 12px;'><span>40%</span></li>"+
                "<li style='font-size: 12px;'><span>30%</span></li>"+
                "<li style='font-size: 12px;'><span>20%</span></li>"+
                "<li style='font-size: 12px;'><span>10%</span><hr></li>"+
                "<li style='font-size: 12px;'><span>0%</span></li>";*/
                $('#numbers').append(perfix);
                $("li span hr").css("display", "inline-block");
                $("hr").css({"width": "335px", "border": "red", "margin-left": "50px", "position": "relative", "top": "20px"});
    var list="<li><div data-percentage='"+ value.db2Percent +"' class='bar'></div><span style='font-size: 11px;'>DB2</span></li>"
            +"<li><div data-percentage='"+ value.msSqlPercent +"' class='bar'></div><span style='font-size: 11px;'>MS SQL</span></li>"
            +"<li><div data-percentage='"+ value.mySqlPercent +"' class='bar'></div><span style='font-size: 11px;'>MySQL</span></li>"
            +"<li><div data-percentage='"+ value.oraclePercent +"' class='bar'></div><span style='font-size: 11px;'>Oracle</span></li>"
            +"<li><div data-percentage='"+ value.sybasePercent +"' class='bar'></div><span style='font-size: 11px;'>Sybase</span></li>"
            +"<li><div data-percentage='"+ value.otherPercent +"' class='bar'></div><span style='font-size: 11px;'>Other</span></li>";
            $('#bars').append(list);
          $("#bars li .bar").each(function(key, bar){
            var percentage = $(this).data('percentage');
            $(this).animate({
              'height':percentage,
            }, 1000);
          })
        });
			
			function drawBarChart() {
				var databar = google.visualization.arrayToDataTable(barChartData);
				var view = new google.visualization.DataView(databar);
				view.setColumns([{ "label": "opportunity Name", "type": "string" }, { "label": "Db Size in GB", "type": "number" }]);
				var options = {
					title: "Oportunities , Db Size in GB",
					width: 600,
					height: 400,
					bar: { groupWidth: "100%" },
					legend: { position: "none" },
				};
				var chart = new google.visualization.BarChart(document.getElementById("top_x_div"));
				//var chart = new google.charts.BarChart(document.getElementById('top_x_div'));
				chart.draw(view, options);
			};
			
		},
		error: function(e) {
			console.log(e);
		}
	});
}


$(document).ready(function() {
	var ctx = $("#mycanvas").get(0).getContext("2d");

	var options = {
		title: {
			display: true,
			text: "Phases"
		},
	}

	var data = [
		{
			value: 27,
			color: "#486ccc",
			highlight: "lightskyblue",
			label: "Yet To Start"
		},
		{
			value: 33,
			color: "#d1e1f3",
			highlight: "#82aadd",
			label: "In Progress"
		},
		{
			value: 40,
			color: "#aeb8c1",
			highlight: "darkorange",
			label: "Completed"
		}
	];

	var chart = new Chart(ctx).Doughnut(data);
});

$(document).ready(function() {
	var ctx = $("#mycanvas1").get(0).getContext("2d");

	var options = {
		title: {
			display: true,
			text: "Waves"
		},
	}
	var data = [
		{
			value: 27,
			color: "#486ccc",
			highlight: "lightskyblue",
			label: "Yet To Start"
		},
		{
			value: 33,
			color: "#d1e1f3",
			highlight: "yellowgreen",
			label: "In Progress"
		},
		{
			value: 40,
			color: "#aeb8c1",
			highlight: "darkorange",
			label: "Completed"
		}
	];

	var chart = new Chart(ctx).Doughnut(data);
});

