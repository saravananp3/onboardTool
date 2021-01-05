$(document).ready(function(){
	
	$(document).on('click', '.addClass', function(){
		var index = $(this).index('.addClass');
		$(".myDropdown").eq(index).hide();
		var oppName = $('.oppName').eq(index).val();
		$('#oppNameId').val(oppName);
		$('#existWaveSeqNum').val(index);
		
		$('#addWaveBtnId').click();
	});
	
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
	        	 
	        	 var i = 1;
                 
	             $.each(data[1], function(key, value){
	            	 var opportunityName = value.OpportunityName; 
	            	 var OpportunityId = value.OpportunityId; 
	            	 var checkWave = value.CheckWave;
	            	 var optionWave = "";
	            	 if(checkWave || data[0].length == 0)
	            		 optionWave = "display:none;";	 
	            	
	        	var li_element ="<li>"+
	        					"<div class='drophide'>"+
	        					"<i class = 'fal fa-ellipsis-v dropbtn dropClass' style='font-size:35px; position:absolute; width:90%; top:0px;'>"+
	        					"<div class='dropdown-content myDropdown' style = 'float:right;'>"+
	        					"<a class = 'options' style = 'text-align:left;' href='#'>Edit</a>"+
	        					"<a class = 'options addClass' style = 'text-align:left;"+optionWave+"' href='#'>Add to Wave</a>"+
	        					"<a class = 'options' style = 'text-align:left;' href='#'>Delete</a>"+
	        					"</div>"+
	        					"</i>"+
	        					"<input type = 'hidden' class = 'oppName' value = '"+opportunityName+"'>"+
	        					"</div>"+
                                 "<h3 class='cbp-vm-title left-col primary' name='name'>"+opportunityName+"</h3>"+
                                 "<p class='right-col primary' >In Test</p>"+
                                
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