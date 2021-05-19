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
        	if(data[0].phaseCount == 0 || data[0].phaseCount == 1)
        		$(".font_icon").eq(0).html('Phase');
            
        	if(data[0].waveCount == 0 || data[0].waveCount== 1)
            	$(".font_icon").eq(1).html('Wave');
            
        	if(data[0].appCount == 0 || data[0].appCount== 1)
            	$(".font_icon").eq(2).html('App');
        	
        	$('.totcounter').eq(0).html(data[0].phaseCount);
        	$('.totcounter').eq(1).html(data[0].waveCount);
        	$('.totcounter').eq(2).html(data[0].appCount);
        	
        	google.charts.load("current", {packages:["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
              var dataValue = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['Application in Intake module', 3],
                ['Application in Requirement module', 1],
                ['Application in Execution module', 2],
                ['Application in Decommission module',4 ],
              
              ]);

              var options = {
                
                pieHole: 0.4,
                width: 600,
                height: 400,
                
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