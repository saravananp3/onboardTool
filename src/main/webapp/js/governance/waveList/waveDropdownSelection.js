$(document).on('change','.filter',function(){
	
	var id=$(this).attr("id");
	
	var drpValue = $(this).val();
    
	var drpClass = drpValue.replaceAll("-","").replaceAll(" ","");
	getChange(drpClass,drpValue,id);
    var phaseName =$("#phase").val();
    var waveName = $("#wave").val();
    var appName = $("#application").val();
    filterWaveListAjaxCall(phaseName,waveName,appName);
});
function getChange(drpClass,drpValue,id) {
	switch(id){
	case 'application':
		getApplicationChange(drpClass,drpValue);
		break;
	case 'wave':
		getWaveChange(drpValue);
		break;
	}
}

function getApplicationChange(appClass,appValue) {
	if(appValue!="All"){
	    var waveName =  $("."+appClass).eq(0).attr("value");
	    var waveValue = $("#wave").val(waveName);
	    }
	else{
		var waveValue = $("#wave").val("All");
	}
}

function getWaveChange(waveValue) {
	if(waveValue!="All"){
		$(".appOption").hide();
	    $("."+waveValue.replaceAll("-","").replaceAll(" ","")).show();
	    $("#application").val('All');
	  }
	else{
		$(".appOption").show();
	}
}

function filterWaveListAjaxCall(phaseName,waveName,appName)
{
	$.ajax({
        url: "filterWaveListServlet",
        type: 'POST',
        dataType: "json",
        async:false,
        data: {phaseName:phaseName, waveName:waveName, appName:appName},
        success: function (data) {
        	console.log("Data:", data);
        	 if (!$.isArray(data)) {
                 data = [data];
        	 }  
        	 displayFilterWaveList(data);
        },
        error: function (e) {
            console.log(e);
        }
	});
}
function displayFilterWaveList(data){
		 var i = 1;
		 $('#ul_id').html("");
	 $.each(data, function(key, value){
	    	 var waveName = value.WaveName; 
	    	 var WaveId = value.WaveId; 
	    	 var li_element ="<li class = 'waveCard'>"+
						"<div class='drophide'>"+
						"<i class = 'fal fa-ellipsis-v dropbtn dropClass' style='font-size:35px; position:absolute; width:90%; top:0px;'>"+
						"<div class='dropdown-content myDropdown' style = 'float:right;'>"+
						"<a class = 'options' style = 'text-align:left;' href='#'>Edit</a>"+
						"<a class = 'options deleteWaveClass' style = 'text-align:left;' href='#'>Delete</a>"+
						"</div>"+
						"</i>"+
						"<input type = 'hidden' class = 'waveName' value = '"+waveName+"'>"+
						"<input type = 'hidden' class = 'waveId' value = '"+WaveId+"'>"+
						"</div>"+
	                  "<h3 class='cbp-vm-title left-col primary waveHeadingName' name='name' contenteditable='false'>"+waveName+"</h3>"+
	                  "</li>";
		$('#ul_id').append(li_element);
		i++;
	 });
}