$(document).ready(function(){
	
	waveListAjaxCall();
	
});
$(document).on('mouseenter','.dropClass',function(){
	var index = $(this).index('.dropClass');
	$(".waveCard").eq(index).removeClass("waveCard")
});

$(document).on('mouseleave','.dropClass',function(){
	var index = $(this).index('.dropClass');
	$(".listCard").eq(index).addClass("waveCard")
});


function waveListAjaxCall()
{
	$.ajax({
        url: "waveListServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
        	console.log("Data:", data);
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
		 var phaseName = data[0].phaseName;
		 $("#phase").append("<option>"+phaseName+"</option>");
		 $("#wave").append("<option class='all options' value='All'>All</option>");
		 $("#application").append("<option class='all options' value='All'>All</option>");
	     $.each(data[1], function(key, value){
	    	 var waveName = value.WaveName; 
	    	 var WaveId = value.WaveId; 
	    	 var app =value.Apps;
	       	 
	    	 var li_element ="<li class = 'waveCard listCard'>"+
						"<div class='drophide'>"+
						"<i class = 'fal fa-ellipsis-v dropbtn dropClass' style='font-size:35px; position:absolute; width:90%; top:0px;'>"+
						"<div class='dropdown-content myDropdown' style = 'float:right;'>"+
						"<a class = 'options editWaveClass' style = 'text-align:left;' href='#'>Edit</a>"+
						"<a class = 'options deleteWaveClass' style = 'text-align:left;' href='#'>Delete</a>"+
						"</div>"+
						"</i>"+
						"<input type = 'hidden' class = 'waveName' value = '"+waveName+"'>"+
						"<input type = 'hidden' class = 'waveId' value = '"+WaveId+"'>"+
						"</div>"+
	                  "<h3 class='cbp-vm-title left-col primary waveHeadingName' name='name' contenteditable='false'>"+waveName+"</h3>"+
	                  "</li>";
		$('#ul_id').append(li_element);
		var phaseClass = (phaseName.replaceAll("-","")).replaceAll(" ","");
		var waveClass = (waveName.replaceAll("-","")).replaceAll(" ","");
		//$("#wave").append("<option class='"+phaseClass+" options "++"'>"+waveName+"</option>");
		if(app!=""){
		var appClass = "";
		var apps= app.split(",");
		for(var i=0;i<apps.length;i++){
		$("#application").append("<option class='"+waveClass+" options appOption' value='"+apps[i]+"'>"+apps[i]+"</option>");
		var appName = apps[i].replaceAll(",","").replaceAll(" ","");
		appClass += appName+" "; 
		}
		$("#wave").append("<option class='"+phaseClass+" options waveOption "+appClass+"' value='"+waveName+"' >"+waveName+"</option>");
		}
		
		i++;
	     });
	     $('#title_id').html("Number of Wave &nbsp;("+(i-1)+")");
	 }
	
