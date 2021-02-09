$(document).ready(function(){
	selectCategory("Phase");
	selectCategoryAjaxCall("WAVE_OPTIONS");
	$(document).on('click', '.addClass', function(){
		var index = $(this).index('.addClass');
		$(".myDropdown").eq(index).hide();
		var oppName = $('.oppName').eq(index).val();
		$('#oppNameId').val(oppName);
		$('#existWaveSeqNum').val(index);
		$('#addWaveBtnId').click();
	});
	$(document).on('change','#phase',function(){
		var phaseName = $(this).val();
		$(".waveOption").hide();
		if(phaseName=="none")
			$(".waveOption").show();
		else
		$("."+((phaseName).replace(" ","").replace("-",""))).show();
    });
});
function selectCategoryAjaxCall(operation)
{
	$.ajax({
        url: "selectCategoryServlet",
        type: 'POST',
        dataType: "json",
        data:{operation:operation},
        success: function (data) {
        	console.log("Wave Options:", data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 $("#wave").append("<option  class='none' value='none'>none</option>");
        	 $.each(data,function(key,value){
        		 var phaseName = ((value.phaseName).replace(" ","").replace("-",""));
        		 var waveName = value.WaveName;
        	    $("#wave").append("<option  class='waveOption "+phaseName+"' value='"+waveName+"' >"+waveName+"</option>");
        	 })
        	 
        	  
        },
        error: function (e) {
            console.log(e);
        }
});

}
$(document).on('change','#category',function(){
	selectCategory($(this).val());
});
function selectCategory(category)
{
	$("#ul_id").html("");
	//$("#phase").val("none");
	//$("#wave").val("none");
	switch(category)
	{
	
	case "Phase":
		phaseListAjaxCall();
		
		break;
		
	case "Wave":
		waveListAjaxCall();
		break;
		
	case "Application":
		$(".waveOption").show();
		opportunityListAjaxCall();
		break;
	
	}
}
 function waveListAjaxCall()
 {
	 $.ajax({
	        url: "governanceListServlet",
	        type: 'POST',
	        dataType: "json",
	        success: function (data) {
	        	console.log("Data GovernanceList", data);
	        	 if (!$.isArray(data)) {
	                 data = [data];
	                 
	             }
              
	        	 displayWaveList(data);
	            
	        },
	        error: function (e) {
	            console.log(e);
	        }
});
 }
 function displayWaveList(data)
 {
	 var i = 1;
	 $('#ul_id').html("");
     $.each(data, function(key, value){
    	 var waveName = value.WaveName; 
    	 var WaveId = value.WaveId; 
    	
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
 }
function opportunityListAjaxCall()
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
        	 
        	 var i = 1;
             
             $.each(data[1], function(key, value){
            	 var opportunityName = value.OpportunityName; 
            	 var OpportunityId = value.OpportunityId; 
            	 var checkWave = value.CheckWave;
            	 var optionWave = "";
            	 if(checkWave || data[0].length == 0)
            		 optionWave = "display:none;";	 
            	
        	var li_element ="<li class='opportunityCard'>"+
        					"<div class='drophide'>"+
        					"<i class = 'fal fa-ellipsis-v dropbtn dropClass' style='font-size:35px; position:absolute; width:90%; top:0px;'>"+
        					"<div class='dropdown-content myDropdown' style = 'float:right;'>"+
        					"<a class = 'options' style = 'text-align:left;' href='#'>Edit</a>"+
        					"<a class = 'options addClass' style = 'text-align:left;"+optionWave+"' href='#'>Add to Wave</a>"+
        					"<a class = 'options deleteClass' style = 'text-align:left;' href='#'>Delete</a>"+
        					"</div>"+
        					"</i>"+
        					"<input type = 'hidden' class = 'oppName' value = '"+opportunityName+"'>"+
        					"<input type = 'hidden' class = 'oppId' value = '"+OpportunityId+"'>"+
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
}
function phaseListAjaxCall()
{
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
             var option ="<option class='options' value='none'>none</option>"
             $.each(data, function(key, value){
            	 var phaseName = value.phaseName; 
            	 var phaseId = value.phaseId; 
            	
        	var li_element ="<li>"+
                             "<h3 class='cbp-vm-title left-col primary' name='name'>"+phaseName+"</h3>"+
                             "<p class='right-col primary' >In Test</p>"+
                            
                              "<button type='button' class='btn btn-primary' name='btn' onClick=\"editWave('"+phaseId+"','"+phaseName+"')\";>"+
                              "<i class='fa fa-eye'></i>/ &nbsp; <i class='fa fa-edit'></i>"+
                              "</button>"+
                              "</li>";
        	$('#ul_id').append(li_element);
        	 option +="<option class='options' value='"+phaseName+"'>"+phaseName+"</option>";
        	
        	i++;
             });
             $('#phase').html(option);
             $('#title_id').html("Number of Wave &nbsp;("+(i-1)+")");
        },
        error: function (e) {
            console.log(e);
        }
});	
}
