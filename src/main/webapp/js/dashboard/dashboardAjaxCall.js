$(document).ready(function(){
	dashboardDetails();
	
	
});


function dashboardDetails(){
	
	
	$.ajax({
        url: "dashboardServlet",
        type: 'POST',
        async:false,
        dataType: "json",
        success: function (data) {
        	console.log("Data : ", data);
        	/*$('.totcounter').eq(0).html(data[0].opportunityCount);
        	$('.totcounter').eq(1).html(data[0].decommissionCount);
        	$('.totcounter').eq(2).html(data[0].archiveCount);
        	$('.totcounter').eq(3).html(data[0].retireCount);*/
        	
        	google.charts.load("current", {packages:["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
              var dataValue = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['Opportunity in Intake phase', data[1].intakeCount],
                ['Opportunity in Requirement phase', data[1].reqCount],
                ['Opportunity in Execution phase', data[1].archiveExeCount],
                ['Opportunity in Decommission phase', data[1].decomExeCount],
              
              ]);

              var options = {
                
                pieHole: 0.4,width: 1250,
                
              };

              var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
              chart.draw(dataValue, options);
            }

            $.each(data[2],function(key,value){
            	
            	var option = "<option>"+value+"</option>";
            	$('#oppNameDrop').append(option);
            	
            	
            });
            
            ganttChartDetails(data[3]);
        	
            google.charts.load("current", {packages:["corechart"]});
            google.charts.setOnLoadCallback(drawBarChart);

            var barChartData=[];
            var obj =['Opportunity','Db Size in Gb'];
            barChartData.push(obj);
            $.each(data[4],function(key,value){
            
            	obj = [];
            	obj.push(value.oppName);
            	obj.push(value.totalDBSize);
            	barChartData.push(obj);
            	
            });
            function drawBarChart() {
            	var databar = google.visualization.arrayToDataTable(barChartData);

            	var view = new google.visualization.DataView(databar);
                view.setColumns([{"label":"opportunity Name","type":"string"},{"label":"Db Size in GB","type":"number"}]);
                var options = {
                        title: "Oportunities , Db Size in GB",
                        width: 600,
                        height: 400,
                        bar: {groupWidth: "100%"},
                        legend: { position: "none" },
                      };
              var chart = new google.visualization.BarChart(document.getElementById("top_x_div"));
              //var chart = new google.charts.BarChart(document.getElementById('top_x_div'));
              chart.draw(view, options);
            };
        },
        
        error: function (e) {
            console.log(e);
        }
    });
}