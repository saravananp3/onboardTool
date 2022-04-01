$(document).ready(function() {
	dashboardDetails();
	BindPhaseWave();
	doughnutType();
});
function dashboardDetails() {
	$.ajax({
		url: "dashboardServlet",
		type: 'POST',
		async: false,
		dataType: "json",
		success: function(data) {
			/*console.log("Data : ", data);
			if (data[0].phaseCount == 0 || data[0].phaseCount == 1)
				$(".font_icon").eq(0).html('Phase');
			if (data[0].waveCount == 0 || data[0].waveCount == 1)
				$(".font_icon").eq(1).html('Wave');
			if (data[0].appCount == 0 || data[0].appCount == 1)
				$(".font_icon").eq(2).html('App');*/
			/*$('.totcounter').eq(0).html(data[0].phaseCount);
			$('.totcounter').eq(1).html(data[0].waveCount);
			$('.totcounter').eq(2).html(data[0].appCount);*/
			/*if(data[0].intakeCount == 0 || data[0].intakeCount== 1)
                $(".font_icon").eq(3).html('Intake');*/
            $('.totcounter').eq(1).html(data[0].phaseCount);
            $('.totcounter').eq(2).html(data[0].waveCount);
            $('.totcounter').eq(3).html(data[0].appCount);
            $('.totcounter').eq(0).html(data[0].intakeCount);
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
                var aname=value.appName==undefined?"":value.appName;
                var sdate=value.submittedDate==undefined?"":value.submittedDate;
                var dcom=value.decomAnalyst==undefined?"":value.decomAnalyst;
                var phase=value.phaseName==undefined?"":value.phaseName;
                var areq=value.ArchiveRequired==undefined?"":value.ArchiveRequired;
                var ctdate=value.completionTarget==undefined?"":value.completionTarget;
                var t_row = "<tr>"
                    + "<td>" + aname + "</td>"
                    + "<td>" + sdate + "</td>"
                    + "<td>" + dcom + "</td>"
                    + "<td>" + phase + "</td>"
                    + "<td>" + areq + "</td>"
                    + "<td>" + ctdate + "</td>"
                    + "</tr>";
                $('#dataTableId').append(t_row);
                $.fn.pageMe = function(opts) {
					var $this = this,
						defaults = {
							perPage: 7,
							showPrevNext: false,
							hidePageNumbers: false
						},
						settings = $.extend(defaults, opts);

					var listElement = $this;
					var perPage = settings.perPage;
					var children = listElement.children();
					var pager = $('.pager');

					if (typeof settings.childSelector != "undefined") {
						children = listElement.find(settings.childSelector);
					}

					if (typeof settings.pagerSelector != "undefined") {
						pager = $(settings.pagerSelector);
					}

					var numItems = children.size();
					var numPages = Math.ceil(numItems / perPage);

					pager.data("curr", 0);

					if (settings.showPrevNext) {
						$('<li><a href="#" class="prev_link"><<</a></li>').appendTo(pager);
					}

					var curr = 0;
					while (numPages > curr && (settings.hidePageNumbers == false)) {
						$('<li><a href="#" class="page_link">' + (curr + 1) + '</a></li>').appendTo(pager);
						curr++;
					}

					if (settings.showPrevNext) {
						$('<li><a href="#" class="next_link">>></a></li>').appendTo(pager);
					}

					pager.find('.page_link:first').addClass('active');
					pager.find('.prev_link').hide();
					if (numPages <= 1) {
						pager.find('.next_link').hide();
					}
					pager.children().eq(1).addClass("active");

					children.hide();
					children.slice(0, perPage).show();

					pager.find('li .page_link').click(function() {
						var clickedPage = $(this).html().valueOf() - 1;
						goTo(clickedPage, perPage);
						return false;
					});
					pager.find('li .prev_link').click(function() {
						previous();
						return false;
					});
					pager.find('li .next_link').click(function() {
						next();
						return false;
					});

					function previous() {
						var goToPage = parseInt(pager.data("curr")) - 1;
						goTo(goToPage);
					}

					function next() {
						goToPage = parseInt(pager.data("curr")) + 1;
						goTo(goToPage);
					}

					function goTo(page) {
						var startAt = page * perPage,
							endOn = startAt + perPage;

						children.css('display', 'none').slice(startAt, endOn).show();

						if (page >= 1) {
							pager.find('.prev_link').show();
						}
						else {
							pager.find('.prev_link').hide();
						}

						if (page < (numPages - 1)) {
							pager.find('.next_link').show();
						}
						else {
							pager.find('.next_link').hide();
						}

						pager.data("curr", page);
						pager.children().removeClass("active");
						pager.children().eq(page + 1).addClass("active");

					}
				};
            });
            $(document).ready(function() {
                $('#example').DataTable();
            });
            /* paging('example','maxRows',data[4].length,'appStatus');*/
            $.each(data[6], function(key, value) {
                var aname=value.app_name==undefined?"":value.app_name;
                var cdate=value.craetionDate==undefined?"":value.craetionDate;
                var status=value.status==undefined?"":value.status;
                var tcdate=value.targetCompletionDate==undefined?"":value.targetCompletionDate;
                var phase=value.phaseName==undefined?"":value.phaseName;
                var wave=value.waveName==undefined?"":value.waveName;
                var dcapprove=value.DesignApproval==undefined?"":value.DesignApproval;
                var t_row = "<tr>"
                    + "<td>" + aname + "</td>"
                    + "<td>" + cdate + "</td>"
                    + "<td>" + status + "</td>"
                    + "<td>" + tcdate + "</td>"
                    + "<td>" + phase + "</td>"
                    + "<td>" + wave + "</td>"
                    + "<td>" + dcapprove + "</td>"
                    + "</tr>";
                $('#dataTableId1').append(t_row);
                	$.fn.pageMe = function(opts) {
					var $this = this,
						defaults = {
							perPage: 7,
							showPrevNext: false,
							hidePageNumbers: false
						},
						settings = $.extend(defaults, opts);

					var listElement = $this;
					var perPage = settings.perPage;
					var children = listElement.children();
					var pager = $('.pager');

					if (typeof settings.childSelector != "undefined") {
						children = listElement.find(settings.childSelector);
					}

					if (typeof settings.pagerSelector != "undefined") {
						pager = $(settings.pagerSelector);
					}

					var numItems = children.size();
					var numPages = Math.ceil(numItems / perPage);

					pager.data("curr", 0);

					if (settings.showPrevNext) {
						$('<li><a href="#" class="prev_link"><<</a></li>').appendTo(pager);
					}

					var curr = 0;
					while (numPages > curr && (settings.hidePageNumbers == false)) {
						$('<li><a href="#" class="page_link">' + (curr + 1) + '</a></li>').appendTo(pager);
						curr++;
					}

					if (settings.showPrevNext) {
						$('<li><a href="#" class="next_link">>></a></li>').appendTo(pager);
					}

					pager.find('.page_link:first').addClass('active');
					pager.find('.prev_link').hide();
					if (numPages <= 1) {
						pager.find('.next_link').hide();
					}
					pager.children().eq(1).addClass("active");

					children.hide();
					children.slice(0, perPage).show();

					pager.find('li .page_link').click(function() {
						var clickedPage = $(this).html().valueOf() - 1;
						goTo(clickedPage, perPage);
						return false;
					});
					pager.find('li .prev_link').click(function() {
						previous();
						return false;
					});
					pager.find('li .next_link').click(function() {
						next();
						return false;
					});

					function previous() {
						var goToPage = parseInt(pager.data("curr")) - 1;
						goTo(goToPage);
					}

					function next() {
						goToPage = parseInt(pager.data("curr")) + 1;
						goTo(goToPage);
					}

					function goTo(page) {
						var startAt = page * perPage,
							endOn = startAt + perPage;

						children.css('display', 'none').slice(startAt, endOn).show();

						if (page >= 1) {
							pager.find('.prev_link').show();
						}
						else {
							pager.find('.prev_link').hide();
						}

						if (page < (numPages - 1)) {
							pager.find('.next_link').show();
						}
						else {
							pager.find('.next_link').hide();
						}

						pager.data("curr", page);
						pager.children().removeClass("active");
						pager.children().eq(page + 1).addClass("active");

					}
				};
            });
                
            $(document).ready(function() {
                $('#example1').DataTable();
            });
			/*paging('example1','maxRows1',data[6].length,'appReq');*/
			
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
  	var perfix=/*"<li style='font-size: 11px;'><span>100%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>90%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>80%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>70%</span><hr></li>"+
                "<li style='font-size: 11px;'><span>60%</span><hr></li>"+*/
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
        
        $.each(data[10], function(key, value) {
                var aname=value.app_name==undefined?"":value.app_name;
                var status=value.status==undefined?"":value.status;
                var stdate=value.startDate==undefined?"":value.startDate;
                var t_row = "<tr>"
                    + "<td>" + aname + "</td>"
                    + "<td>" + stdate + "</td>"
                    + "<td>" + status + "</td>"
                    + "</tr>";
                $('#dataTableId2').append(t_row);
                
               	$.fn.pageMe = function(opts) {
					var $this = this,
						defaults = {
							perPage: 7,
							showPrevNext: false,
							hidePageNumbers: false
						},
						settings = $.extend(defaults, opts);

					var listElement = $this;
					var perPage = settings.perPage;
					var children = listElement.children();
					var pager = $('.pager');

					if (typeof settings.childSelector != "undefined") {
						children = listElement.find(settings.childSelector);
					}

					if (typeof settings.pagerSelector != "undefined") {
						pager = $(settings.pagerSelector);
					}

					var numItems = children.size();
					var numPages = Math.ceil(numItems / perPage);

					pager.data("curr", 0);

					if (settings.showPrevNext) {
						$('<li><a href="#" class="prev_link"><<</a></li>').appendTo(pager);
					}

					var curr = 0;
					while (numPages > curr && (settings.hidePageNumbers == false)) {
						$('<li><a href="#" class="page_link">' + (curr + 1) + '</a></li>').appendTo(pager);
						curr++;
					}

					if (settings.showPrevNext) {
						$('<li><a href="#" class="next_link">>></a></li>').appendTo(pager);
					}

					pager.find('.page_link:first').addClass('active');
					pager.find('.prev_link').hide();
					if (numPages <= 1) {
						pager.find('.next_link').hide();
					}
					pager.children().eq(1).addClass("active");

					children.hide();
					children.slice(0, perPage).show();

					pager.find('li .page_link').click(function() {
						var clickedPage = $(this).html().valueOf() - 1;
						goTo(clickedPage, perPage);
						return false;
					});
					pager.find('li .prev_link').click(function() {
						previous();
						return false;
					});
					pager.find('li .next_link').click(function() {
						next();
						return false;
					});

					function previous() {
						var goToPage = parseInt(pager.data("curr")) - 1;
						goTo(goToPage);
					}

					function next() {
						goToPage = parseInt(pager.data("curr")) + 1;
						goTo(goToPage);
					}

					function goTo(page) {
						var startAt = page * perPage,
							endOn = startAt + perPage;

						children.css('display', 'none').slice(startAt, endOn).show();

						if (page >= 1) {
							pager.find('.prev_link').show();
						}
						else {
							pager.find('.prev_link').hide();
						}

						if (page < (numPages - 1)) {
							pager.find('.next_link').show();
						}
						else {
							pager.find('.next_link').hide();
						}

						pager.data("curr", page);
						pager.children().removeClass("active");
						pager.children().eq(page + 1).addClass("active");

					}
				};
           });;
            $(document).ready(function() {
                $('#example2').DataTable();
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
    vartitle = {
		text: "Live Data"
	}
	var options = {
        title: {
            display: true,
            text: "Phases"
        },
        
    }

$.ajax({
        url: "dashboardServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("Data : ", data);
            $.each(data[9],function(key,value1){
   		var data = [
        {
            value: value1.newOpportunity,
            color: "#7FFFD4",
            highlight: "lightblue",
            label: "New Opportunity"
        },
        {
            value: value1.triage,
            color: "#1565c0",
            highlight: "lightskyblue",
            label: "Triage"
        },
        {
            value: value1.assesment,
            color: "#6495ed",
            highlight: "#82aadd",
            label: "Assessment"
        },
        {
            value: value1.pendingApproval,
            color: "#1d88aa",
            highlight: "darkorange",
            label: "Pending Approval"
        },
        {
            value: value1.completed,
            color: "#83ddd4",
            highlight: "darkgreen",
            label: "Completed"
        }
    ];
    console.log(data)
    var chart = new Chart(ctx).Doughnut(data);
    });
    
   }});
});

/*$("#phId").change(function() {
	doughnutType();
  
});*/

function doughnutType()
{
    resetCanvas();
    var ctx = $("#mycanvas1").get(0).getContext("2d");
    var selectedPhase=$('#phase :selected').text();
    var selectedwave=$('#wave :selected').text();
   	var options = {
        title: {
            display: true,
            text: "Waves"
        },
     }
    var phase=selectedPhase==""?"All":selectedPhase;
    var wave=selectedwave==""?"All":selectedwave;
    $.ajax({
        url: "dashboardDoughnutServlet",
        type: 'POST',
        async: false,
        data:{phase:phase,wave:wave},
        dataType: "json",
        success: function(data) {
            console.log("Wave Data : ", data);
            $.each(data[0],function(key,value1){
    var result = [
        {
            value: value1.NoApp,
            color: "#aeb8c1",
            highlight: "lightskyblue",
            label: "No Apps Found"
        },
        {
            value: value1.archiveReqPer,
            color: "#1565c0",
            highlight: "#82aadd",
            label: "Archieve Requirements"
        },
        {
            value: value1.archiveExePer,
            color: "#1d88aa",
            highlight: "darkorange",
            label: "Archieve Execution"
        },
        {
            value: value1.completed,
            color: "#83ddd4",
            highlight: "darkgreen",
            label: "Completed"
        }
    ];
    console.log("Result : ",result)
    var chart = new Chart(ctx).Doughnut(result);
        });
   }});
}

function BindPhaseWave()
{
    $.ajax({
            url: "OpportunityListServlet",
            type: 'POST',
            dataType: "json",
            success: function (data) {
                console.log("Data OpportunityList", data);
                 if (!$.isArray(data)) {
                     data = [data];
                 }
                 $.each(data[0], function(key, value){
                     var options = "<option>"+value+"</option>";
                     $('#existWaveTypesId').append(options);
                 });
                 var phaseOptions ="<option selected class='options All' value='All'>All</option>"
                 $.each(data[2][0], function(key, value){
                      phaseOptions += "<option class='phaseOptions options' value='"+value.phaseName+"'>"+value.phaseName+"</option>";
                 });
                 $('#phase').append(phaseOptions);
                 var waveOptions ="<option selected class='options All' value='All'>All</option>"
                     $.each(data[2][1], function(key, value){
                         var phase = ((value.phaseName).replaceAll(" ","")).replaceAll("-","");
                          waveOptions += "<option class='options waveOptions "+phase+"' value='"+value.waveName+"'>"+value.waveName+"</option>";
                     });
                 $('#wave').append(waveOptions);
            },
            error: function (e) {
                console.log(e);
            }
});
}
$(document).on('change','#phase',function(){
$(".waveOptions").hide();
var phaseName = $(this).val();
if(phaseName!="All")
    {
    $("."+(phaseName.replaceAll(" ","")).replaceAll("-","")).show();
    $("#wave").val("All");
    }
    else
    {
    $(".waveOptions").show();
    }
   /* UpdateDoughnut();*/
   doughnutType();
});
$(document).on('change','#wave',function(){
   /* UpdateDoughnut();*/
   doughnutType();
    });
$(document).on('change','.filter',function(){
    var category = $("#category").val();
    var phase = $("#phase").val();
    var wave = $("#wave").val();
    filterAjaxCall(category,phase,wave);
});
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

/*function UpdateDoughnut(){
     var ctx = $("#mycanvas1").get(0).getContext("2d");
    var selectedPhase=$('#phase :selected').text();
    var selectedwave=$('#wave :selected').text();
    var options = {
        title: {
            display: true,
            text: "Waves"
        },
    }
    var phase=selectedPhase==""?"All":selectedPhase;
    var wave=selectedwave==""?"All":selectedwave;
    $.ajax({
        url: "dashboardDoughnutServlet",
        type: 'POST',
        async: false,
        data:{phase:phase,wave:wave},
        dataType: "json",
        success: function(data) {
            console.log("Wave Data : ", data);
            $.each(data[0],function(key,value1){
    var result = [
        {
            value: value1.NoApp,
            color: "#486ccc",
            highlight: "lightskyblue",
            label: "No Apps Found"
        },
        {
            value: value1.archiveReqPer,
            color: "#d1e1f3",
            highlight: "#82aadd",
            label: "Archieve Requirements"
        },
        {
            value: value1.archiveExePer,
            color: "#FFC0CB",
            highlight: "darkorange",
            label: "Archieve Execution"
        },
        {
            value: value1.completed,
            color: "#aeb8c1",
            highlight: "darkorange",
            label: "Completed"
        }
    ];
    console.log("Result : ",result)
});
}
});
}*/

function resetCanvas() {
  $('#mycanvas1').remove(); // this is my <canvas> element
  $('#canvas2').append("<canvas id='mycanvas1' width='200' height='200' style='margin-left: 96%;'><canvas>");
};

$(document).ready(function() {
    var ctx = $("#canvasCBA").get(0).getContext("2d");
   
    var options = {
        title: {
            display: true,
            text: 'Waves'
        },
    }
    var selectedPhase=$('#phase :selected').text();
    var selectedwave=$('#wave :selected').text();
     var phase=selectedPhase==""?"All":selectedPhase;
    var wave=selectedwave==""?"All":selectedwave;
    $.ajax({
        url: "dashboardDoughnutServlet",
        type: 'POST',
        async: false,
         data:{phase:phase,wave:wave},
        dataType: "json",
        success: function(data) {
            console.log("CBA Data : ", data);
            $.each(data[1],function(key,value1){
    var result = [
        {
            value: value1.sunmOfIntake,
            color: "#1565c0",
            highlight: "lightskyblue",
            label: "Sum Of Intake/Opportunity"
        },
        {
            value: value1.sumOfInProgress,
            color: "#d1e0f3",
            highlight: "#82aadd",
            label: "Sum Of InProcess"
        },
        {
            value: value1.sumOfRealised,
            color: "#d2d6e2",
            highlight: "darkorange",
            label: "Sum Of Realized"
        }
    ];
    console.log("Result : ",result)
    var chart = new Chart(ctx).Pie(result);
        });
   }});
});

/*$(document).ready(function() {
     var ctx = $("#pieChartId").get(0).getContext("2d");
    var options = {
		label: {
			fontSize: 12,
			width: 200
		},
        title: {
            display: true,
            text: "Waves"
            
        },
    }
    $.ajax({
        url: "dashboardServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("Archive Data : ", data);
            $.each(data[5],function(key,value1){
    var result = [
        {
            value: value1.archiveCount,
            color: "#486ccc",
            highlight: "lightskyblue",
            label: "Archive"
        },
        {
            value: value1.decommissionCount,
            color: "#d1e1f3",
            highlight: "#82aadd",
            label: "Decommission"
        },
        {
            value: value1.retiredCount,
            color: "#aeb8c1",
            highlight: "darkorange",
            label: "To be Retired"
        }
    ];
    console.log("Result : ",result)
    var chart = new Chart(ctx).Pie(result, options);
        });
   }});
});*/