$(document).ready(function(){
	 $.ajax({
	        url: "OpportunityListServlet",
	        type: 'POST',
	        dataType: "json",
	        success: function (data) {
	        	console.log("Data OpportunityList", data);
	        	 if (!$.isArray(data)) {
	                 data = [data];
	                 
	             }
                 var i = 1;
	             $.each(data, function(key, value){
	            	 var opportunityName = value.OpportunityName; 
	            	 var OpportunityId = value.OpportunityId; 
	            	
	        	var li_element ="<li>"+
                                 "<h3 class='cbp-vm-title left-col primary' name='name'>"+opportunityName+"</h3>"+
                                 "<p class='right-col primary' >In Test</p>"+
                                 "<center>"+
                                  "<div class='progress center-col cbp-vm-detail'>"+
                                  "<div class='progress-bar progress-bar-success progress-bar-striped' id='prog_bar'"+i+" role='progressbar aria-valuenow='0'"+
                                  "aria-valuemin='0' aria-valuemax='100' style='width:0%'>"+
                                  "0%"+
                                  "</div>"+
                                  "</div>"+
                                  "</center>"+
                                  "<button type='button' class='btn btn-primary' name='btn' onClick=\"edit('"+OpportunityId+"','"+opportunityName+"')\";>"+
                                  "<i class='fa fa-eye'></i>/ &nbsp; <i class='fa fa-edit'></i>"+
                                  "</button>"+
                                  "</li>";
	        	$('#ul_id').append(li_element);
	        	
	        	i++;
	             });
	             $('#title_id').html("Number of Opportunities &nbsp;("+(i-1)+")");
	        },
	        error: function (e) {
	            console.log(e);
	        }
});
});