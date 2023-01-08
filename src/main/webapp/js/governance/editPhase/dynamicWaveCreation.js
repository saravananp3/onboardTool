$('#addWave').click(function(){
	
	
    	var waveName = $("#addWaveModify").val();
    	
    	var creationType = "Wave";
    	if(waveName!=="")
    	{
    	dynamicWave(waveName, creationType);
    	}
    	else
    	{
		notification("warning","Wave Name cannot be Empty","Warning");
		}
});


function dynamicWave(waveName, creationType){
	
	$.ajax({
        url: "dynamicWaveCreationServlet",
        type: 'POST',
        data : {waveName:waveName, creationType:creationType},
        dataType: "json",
        success: function (data) {
        	console.log(data);
        	if(data.saveStatus){
        		  notification("success","Wave added successfully","Note : ");
		          var li = "<li>"+waveName+"</li>";
			      $("#addId").append(li);
			      $("#waves").append("<option value='"+waveName+"'>"+waveName+"</option>");
			      $("select.multiselect").selectpicker("refresh");
        	}
        	
        	else{
        		
        		if(data.checkWaveName)
        			notification("warning","Wave name already exist","Warning");
        		
        		else
        		notification("error","Problem occured while creating wave","Error");
        		
        	}
        },
        error: function (e) {
            console.log(e);
        }
    });
	}


	
