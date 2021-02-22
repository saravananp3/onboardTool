$(document).on('change','.filter', function(){

	var id = $(this).attr("id");
	
	if(id=="phase")
	{
	  $("#wave").val("All");
	}
    else if(id=="wave")
    {
    	$("#application").val("All");
    }
    var phase = $("#phase").val();
    var wave = $("#wave").val();
    var application = $("#application").val();
    getList(phase,wave,application ,"Phase",false);
});

function getList(phase,wave,application ,category,searchByApp)
{
	$.ajax({
        url: "filteringListServlet",
        type: 'POST',
        dataType: "json",
        data:{wave:wave,category:category,phase:phase, application:application,searchByApp:searchByApp},
        success: function (data) {
        	console.log("Wave Options:", data);
        	 if (!$.isArray(data)) {
                 data = [data];
        	 }
        	 switch(category)
        	 {
        	 case "Wave":
        		 displayWaveList(data);
        		 break;
        	 case "Application":
        		 getOpportunityList(data);
        		 break;
        	 case "Phase":
        		 getPhaseList(data);
        		 break;
        	 }
        	 
        },
        error: function (e) {
            console.log(e);
        }
});
}

function getPhaseList(data)
{
	$("#ul_id").html("");
    $.each(data, function(key, value){
   	 var phaseName = value.phaseName; 
   	 var phaseId = value.phaseId; 
   	
	var li_element ="<li class = 'phaseCard' >"+
		        	"<div class='drophide'>"+
					"<i class = 'fal fa-ellipsis-v dropbtn dropClass' style='font-size:35px; position:absolute; width:90%; top:0px;'>"+
					"<div class='dropdown-content myDropdown' style = 'float:right;'>"+
					"<a class = 'options editPhaseClass' style = 'text-align:left;' href='#'>Edit</a>"+
					"<a class = 'options deletePhaseClass' style = 'text-align:left;' href='#'>Delete</a>"+
					"</div>"+
					"</i>"+
					"<input type = 'hidden' class = 'phaseName' value = '"+phaseName+"'/>"+
					"<input type = 'hidden' class = 'phaseId' value = '"+phaseId+"'/>"+
					"</div>"+
					"<h3 class='cbp-vm-title' style='display:none;'>"+value.apps+"</h3>"+
                    "<h3 class='left-col primary phaseHeadingName' name='name' contenteditable='false'>"+phaseName+"</h3>"+
                    "</li>";
	$('#ul_id').append(li_element);
    });
}
function getOpportunityList(data)
{
	$('#ul_id').html("");
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
    });
}

