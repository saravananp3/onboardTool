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
        	$('.totcounter').eq(0).html(data[0].opportunityCount);
        	$('.totcounter').eq(1).html(data[0].decommissionCount);
        	$('.totcounter').eq(2).html(data[0].archiveCount);
        	$('.totcounter').eq(3).html(data[0].retireCount);
        	
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
        	
        },
        
        error: function (e) {
            console.log(e);
        }
    });
	
	
}