$(document).on('change', '#oppNameDrop', function(){
	var oppName = $('#oppNameDrop').val();
	ganttChartAjaxCall(oppName);
});

function ganttChartAjaxCall(oppName){
	
	$.ajax({
        url: "dashboardGanttChartServlet",
        type: 'POST',
        async:false,
        dataType: "json",
        data:{oppName:oppName},
        success: function (data) {
        	console.log("Gantt Chart data : ", data);
        	//ganttChartDetails(data);   	        	
        },
        
        error: function (e) {
            console.log(e);
        }
    });
	
}

function ganttChartDetails(data)
{
	google.charts.load('current', {'packages':['gantt']});
	    google.charts.setOnLoadCallback(drawChart);

	    function drawChart() {

	      var dataValue = new google.visualization.DataTable();
	      dataValue.addColumn('string', 'Task ID');
	      dataValue.addColumn('string', 'Task Group');
	      dataValue.addColumn('string', 'Resource');
	      dataValue.addColumn('date', 'Actual Start Date');
	      dataValue.addColumn('date', 'Actual End Date');
	      dataValue.addColumn('number', 'Duration');
	      dataValue.addColumn('number', 'Percent Complete');
	      dataValue.addColumn('string', 'Dependencies');

	      var rows = [];
	      var rowCount = 1; 
	      var checkData = false;
	      //$.each(data, function(key, value){
	    	  var row =[];
	    	  //if(value.actSrt != '' && value.actSrt != undefined && value.actSrt != null && value.actEnd != '' && value.actEnd != undefined && value.actEnd != null){
	    	  //var startDate = (value.actSrt).split("/");
	    	  //var endDate = (value.actEnd).split("/");
	    	  
	    	  row.push("1");
	    	  row.push("Initiation & Setup");
	    	  row.push(rowCount.toString());
	    	  row.push(new Date(2021, 0,2));
	    	  row.push(new Date(2021, 0,5));
	    	  row.push(null);
	    	  row.push(100);
	    	  row.push(null);
	    	  
	    	  rows.push(row);
	    	  
	    	  row =[];
	    	  row.push("2");
	    	  row.push("Infrastructure");
	    	  row.push(rowCount.toString());
	    	  row.push(new Date(2021, 0, 10));
	    	  row.push(new Date(2021, 0, 14));
	    	  row.push(null);
	    	  row.push(100);
	    	  row.push(null);
	    	  rows.push(row);
	    	  
	    	  row =[];
	    	  row.push("3");
	    	  row.push("Intake Process / Methodology");
	    	  row.push(rowCount.toString());
	    	  row.push(new Date(2021, 0, 11));
	    	  row.push(new Date(2021, 0, 24));
	    	  row.push(null);
	    	  row.push(100);
	    	  row.push(null);
	    	  rows.push(row);
	    	  
	    	  row =[];
	    	  row.push("4");
	    	  row.push("Archive Implementation");
	    	  row.push(rowCount.toString());
	    	  row.push(new Date(2021, 0, 20));
	    	  row.push(new Date(2021, 1, 03));
	    	  row.push(null);
	    	  row.push(100);
	    	  row.push(null);
	    	  rows.push(row);
	    	  
	    	  row =[];
	    	  row.push("5");
	    	  row.push("Closure");
	    	  row.push(rowCount.toString());
	    	  row.push(new Date(2021, 1, 06));
	    	  row.push(new Date(2021, 1, 13));
	    	  row.push(null);
	    	  row.push(100);
	    	  row.push(null);
	    	  rows.push(row);
	    	  rowCount++;
	    	  checkData = true;
	      //}
	      //});
	      	      
	      dataValue.addRows(rows);

	      var options = {
	    		  
	    		  width: 1200,
	                height: 350,
	        gantt: {
	          trackHeight: 30
	        },
	        labelMaxWidth:500,
	      sortTasks:false
	      };

	      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));
          if(checkData)
	      chart.draw(dataValue, options);
          else
        $("#chart_div").html("Details for this Opportunity is N/A.");
          
	    }
}
