$(document).ready(function(){
	archiveEnvironmentDataRetrieve();
	
	$(document).on('click','#AddEnvmntName', function(){
		
		var tableName = 'archive_environment_name_info';
		var seqNum = $('.rowClassName').length;
	
		archiveEnvironmentAddAjaxCall(seqNum,tableName);
		
	});
	
	
	$(document).on('click','#AddEnvmntServer', function(){
		
		var tableName = 'archive_environment_serverip_info';
		var seqNum = $('.rowClassServer').length;
	
		archiveEnvironmentAddAjaxCall(seqNum,tableName);
		
	});
	
	
	//Environment Name edit
	$(document).on('click','.EditRowName', function(){
		
		var seqNum = $(this).index(".EditRowName");
		var nameReadOnly = $(".devName").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			$(".devName").eq(seqNum).removeAttr("readonly");
			$(".testName").eq(seqNum).removeAttr("readonly");
			$(".stageName").eq(seqNum).removeAttr("readonly");
			$(".prodName").eq(seqNum).removeAttr("readonly");
			notification("info","Seleted row is editable.","Info:");
		}
		else
		{
			$(".devName").eq(seqNum).prop("readonly", true);
			$(".testName").eq(seqNum).prop("readonly", true);
			$(".stageName").eq(seqNum).prop("readonly", true);
			$(".prodName").eq(seqNum).prop("readonly", true);
			notification("info","Seleted row is non-editable.","Info:");
		}	
			
	});

	//Environment server edit
	$(document).on('click','.EditRowServer', function(){
		
		var seqNum = $(this).index(".EditRowServer");
		var nameReadOnly = $(".devServerIp").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			$(".devServerIp").eq(seqNum).removeAttr("readonly");
			$(".testServerIp").eq(seqNum).removeAttr("readonly");
			$(".stageServerIp").eq(seqNum).removeAttr("readonly");
			$(".prodServerIp").eq(seqNum).removeAttr("readonly");
			notification("info","Seleted row is editable.","Info:");
		}
		else
		{
			$(".devServerIp").eq(seqNum).prop("readonly", true);
			$(".testServerIp").eq(seqNum).prop("readonly", true);
			$(".stageServerIp").eq(seqNum).prop("readonly", true);
			$(".prodServerIp").eq(seqNum).prop("readonly", true);
			notification("info","Seleted row is non-editable.","Info:");
		}	
			
	});

//Environment Name delete 
$(document).on('click','.DeleteRowName', function(){
		
		var seqNum = $(this).index('.DeleteRowName')+1;
		$('#EnvmntNameDeleteSeq').val(seqNum);
		$('#EnvmntNameDeleteId').click();
		
	});

$(document).on('click','#EnvmntNameDeleteSubmit', function(){
	
	var tableName = 'archive_environment_name_info';
	$('.submitDisableEnvmntName').attr('disabled', true);
	var seqNum = $('#EnvmntNameDeleteSeq').val();
	
	archiveEnvmtDeleteAjaxCall(seqNum,tableName);
	$('.submitDisableEnvmntName').attr('disabled', false);
	$('#EnvmntNameDeleteClose').click();
});

//Environment Server delete 
$(document).on('click','.DeleteRowServer', function(){
		
		var seqNum = $(this).index('.DeleteRowServer')+1;
		$('#EnvmntServerDeleteSeq').val(seqNum);
		$('#EnvmntServerDeleteId').click();
		
	});

$(document).on('click','#EnvmntServerDeleteSubmit', function(){
	
	var tableName = 'archive_environment_serverip_info';
	$('.submitDisableEnvmntServer').attr('disabled', true);
	var seqNum = $('#EnvmntServerDeleteSeq').val();
	
	archiveEnvmtDeleteAjaxCall(seqNum,tableName);
	$('.submitDisableEnvmntServer').attr('disabled', false);
	$('#EnvmntServerDeleteClose').click();
});
	
});

function archiveEnvmtDeleteAjaxCall(seqNum,tableName){
	
	$.ajax({
        url: "archiveEnvironmentDeleteServlet",
        type: 'POST',
        data: {seqNum:seqNum, tableName:tableName},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Delete Row Retrieve--->",data);
        	if(data.DeleteStatus){
        		var columnSuffix2 = ((tableName == ("archive_environment_name_info"))?"Name":(tableName == ("archive_environment_serverip_info")?"Server":""));
        		
        		$('.rowClass'+columnSuffix2).eq(seqNum-1).remove();
        		notification("success","Seleted row deleted Successfully.","Note:");
        	}
        	else
        		notification("error","Error occured while deleting the row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}

function archiveEnvironmentAddAjaxCall(seqNum,tableName){
	
	$.ajax({
        url: "archiveEnvironmentAddServlet",
        type: 'POST',
        data: {seqNum:seqNum, tableName:tableName},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Add Row Retrieve--->",data);
        	var columnSuffix1 = ((tableName == ("archive_environment_name_info"))?"Name":(tableName == ("archive_environment_serverip_info")?"ServerIp":""));
        	var columnSuffix2 = ((tableName == ("archive_environment_name_info"))?"Name":(tableName == ("archive_environment_serverip_info")?"Server":""));
        	
        	if(data.AddStatus){
        		var Row="<tr class = 'rowClass"+columnSuffix2+"'>"+
           	 "<td><input type ='text' class='dev"+columnSuffix1+"' value=''></td>" +
           	 "<td><input type ='text' class='test"+columnSuffix1+"' value=''></td>" +
           	 "<td><input type ='text' class='stage"+columnSuffix1+"' value=''></td>" +
           	 "<td><input type ='text' class='prod"+columnSuffix1+"' value=''></td>" +
           	 "<td>"+
           	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                           "<ul class='dropdown-menu'>"+
                           "<li><a  class='fa fa-edit EditRow"+columnSuffix2+"' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                           "<li><a  class='fa fa-trash DeleteRow"+columnSuffix2+"' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                           "</ul>"+
                           "</div>"+
           	 "</td>" +
           	 "</tr>";
           	 $("#Environment"+columnSuffix2).append(Row);
           	 	notification("success","Row added Successfully.","Note:");
        	}
        	else
        		notification("error","Error occured while adding the row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}


function archiveEnvironmentDataRetrieve(){
	
	
	$.ajax({
        url: "archiveEnvironmentNameDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 $("#EnvironmentName").html("");
        	 var checkTable = data[0][0].checkExistance;
        	 if(checkTable){
             $.each(data[0], function(key, value){
            	 
            	 var Row="<tr class = 'rowClassName'>"+
            	 "<td><input type ='text' class='devName' value='"+value.DevName+"' readonly></td>" +
            	 "<td><input type ='text' class='testName' value='"+value.TestName+"' readonly></td>" +
            	 "<td><input type ='text' class='stageName' value='"+value.StageName+"' readonly></td>" +
            	 "<td><input type ='text' class='prodName' value='"+value.ProdName+"' readonly></td>" +
            	 "<td>"+
            	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                            "<ul class='dropdown-menu'>"+
                            "<li><a  class='fa fa-edit EditRowName' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                            "<li><a  class='fa fa-trash DeleteRowName' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                            "</ul>"+
                            "</div>"+
            	 "</td>" +
            	 "</tr>";
            	 $("#EnvironmentName").append(Row);
            	 });
            	 }
        	 
            else{
            		 var Row="<tr class = 'rowClassName'>"+
                	 "<td><input type ='text' class='devName' value='' readonly></td>" +
                	 "<td><input type ='text' class='testName' value='' readonly></td>" +
                	 "<td><input type ='text' class='stageName' value='' readonly></td>" +
                	 "<td><input type ='text' class='prodName' value='' readonly></td>" +
                	 "<td>"+
                	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                                "<ul class='dropdown-menu'>"+
                                "<li><a  class='fa fa-edit EditRowName' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                                "<li><a  class='fa fa-trash DeleteRowName' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                                "</ul>"+
                                "</div>"+
                	 "</td>" +
                	 "</tr>";
                	 $("#EnvironmentName").append(Row);
            	 }
        	 
        	 $("#EnvironmentServer").html("");
        	 var checkTable = data[1][0].checkExistance;
        	 if(checkTable){
             $.each(data[1], function(key, value){
            	 
            	 var Row="<tr class = 'rowClassServer'>"+
            	 "<td><input type ='text' class='devServerIp' value='"+value.DevServerIp+"' readonly></td>" +
            	 "<td><input type ='text' class='testServerIp' value='"+value.TestServerIp+"' readonly></td>" +
            	 "<td><input type ='text' class='stageServerIp' value='"+value.StageServerIp+"' readonly></td>" +
            	 "<td><input type ='text' class='prodServerIp' value='"+value.ProdServerIp+"' readonly></td>" +
            	 "<td>"+
            	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                            "<ul class='dropdown-menu'>"+
                            "<li><a  class='fa fa-edit EditRowServer' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                            "<li><a  class='fa fa-trash DeleteRowServer' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                            "</ul>"+
                            "</div>"+
            	 "</td>" +
            	 "</tr>";
            	 $("#EnvironmentServer").append(Row);
            	 });
            	 }
        	 
            else{
            		 var Row="<tr class = 'rowClassServer'>"+
                	 "<td><input type ='text' class='devServerIp' value='' readonly></td>" +
                	 "<td><input type ='text' class='testServerIp' value='' readonly></td>" +
                	 "<td><input type ='text' class='stageServerIp' value='' readonly></td>" +
                	 "<td><input type ='text' class='prodServerIp' value='' readonly></td>" +
                	 "<td>"+
                	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                                "<ul class='dropdown-menu'>"+
                                "<li><a  class='fa fa-edit EditRowServer' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                                "<li><a  class='fa fa-trash DeleteRowServer' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                                "</ul>"+
                                "</div>"+
                	 "</td>" +
                	 "</tr>";
                	 $("#EnvironmentServer").append(Row);
            	 }
             
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}