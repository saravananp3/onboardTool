$(document).ready(function()
{	var url_string=window.location.href;
	var modulecategory=url_string.substr(url_string.indexOf("=") + 1)
	if(modulecategory=="Intake")
    {
	var category = "Intake";
    var phases = "All";
    var waves = "All";
    filterAjaxCall(category,phases,waves);
    $("#category").val(category);
    $("#phase").val(phases);
    $("#wave").val(waves);
	}
    
});
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
             getAppList(data);
        },
        error: function (e) {
            console.log(e);
        }
});
}
function getAppList(data)
{
    $('#ul_id').html("");
     var i = 1;
     $.each(data, function(key, value){
         var opportunityName = value.OpportunityName; 
         var OpportunityId = value.OpportunityId; 
         var checkWave = value.CheckWave;
         var optionWave = "";
         if(checkWave || data.length == 0)
             optionWave = "display:none;";   
    var li_element ="<li class='opportunityCard'>"+
                    "<div class='drophide'>"+
                    "<i class = 'fal fa-ellipsis-v dropbtn dropClass' style='font-size:35px; position:absolute; width:90%; top:0px;'>"+
                    "<div class='dropdown-content myDropdown' style = 'float:right;'>"+
                    "<a class = 'options' style = 'text-align:left;' onClick=\"edit('"+OpportunityId+"','"+opportunityName+"')\";>Edit</a>"+
                    "<a class = 'options addClass' style = 'text-align:left;"+optionWave+"' href='#'>Add to Wave</a>"+
                    "<a class = 'options deleteClass' style = 'text-align:left;' href='#'>Delete</a>"+
                    "</div>"+
                    "</i>"+
                    "<input type = 'hidden' class = 'oppName' value = '"+opportunityName+"'>"+
                    "<input type = 'hidden' class = 'oppId' value = '"+OpportunityId+"'>"+
                    "</div>"+
                     "<h3 class='cbp-vm-title left-col primary' data-bs-toggle='tooltip' data-bs-placement='top' title='"+opportunityName+"' name='name'>"+opportunityName+"</h3>"+
                     /*"<p class='right-col primary' >In Test</p>"+*/
                      "<button type='button' class='btn btn-primary mt-3' name='btn' onClick=\"edit('"+OpportunityId+"','"+opportunityName+"')\";>"+
                      "<i class='fa fa-eye'></i>/ &nbsp; <i class='fa fa-edit'></i>"+
                      "</button>"+
                      "</li>";
       $('#ul_id').append(li_element);
      i++;
      
      var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
				return new bootstrap.Tooltip(tooltipTrigger)
			});
  });
}