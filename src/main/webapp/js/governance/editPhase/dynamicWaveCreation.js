$('#addWave').click(function(){
	
	
    	var waveName = $("#addWaveModify").val();
    	
    	var creationType = "Wave";
    	
    	dynamicWave(waveName, creationType);
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


	
