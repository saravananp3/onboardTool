$(document).ready(function(){
	 $.ajax({
	        url: "phaseListServlet",
	        type: 'POST',
	        dataType: "json",
	        success: function (data) {
	        	console.log("Data GovernanceList", data);
	        	 if (!$.isArray(data)) {
	                 data = [data];
	                 
	             }
                 var i = 1;
	             $.each(data, function(key, value){
	            	 var waveName = value.phaseName; 
	            	 var WaveId = value.phaseId; 
	            	
	        	var li_element ="<li>"+
                                 "<h3 class='cbp-vm-title left-col primary' name='name'>"+waveName+"</h3>"+
                                 "<p class='right-col primary' >In Test</p>"+
                                
                                  "<button type='button' class='btn btn-primary' name='btn' onClick=\"editWave('"+WaveId+"','"+waveName+"')\";>"+
                                  "<i class='fa fa-eye'></i>/ &nbsp; <i class='fa fa-edit'></i>"+
                                  "</button>"+
                                  "</li>";
	        	$('#ul_id').append(li_element);
	        	
	        	i++;
	             });
	             $('#title_id').html("Number of Wave &nbsp;("+(i-1)+")");
	        },
	        error: function (e) {
	            console.log(e);
	        }
});
});