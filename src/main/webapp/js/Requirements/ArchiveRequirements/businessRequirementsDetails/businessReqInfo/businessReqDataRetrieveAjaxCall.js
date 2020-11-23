$(document).ready(function(){
	
	businessReqDataRetrieve();
	businessReqInScopeDataRetrieve();
	
$(document).on('click','.EditRowBusiness', function(){
		
		var seqNum = $(this).index(".EditRowBusiness");
		var nameReadOnly = $(".description").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			
			$(".description").eq(seqNum).removeAttr("readonly");
			notification("info","Seleted row is editable.","Info:");
		}
		else
		{
			
			$(".description").eq(seqNum).prop("readonly", true);
			notification("info","Seleted row is non-editable.","Info:");
		}	
			
	});
	

});

function businessReqDataRetrieve(){
	
	$.ajax({
        url: "businessReqDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Data Retrieve--->",data);
        	if(data.checkData){
        		$('.business').html(data.business);
				if(data.business != '')
        			$('#busreqNext').attr('disabled', false);
				var businessrequirements = data.businessreq; 
        		var busreqList = businessrequirements.split("::");
        		var busreqValue = "";
        		for(var i = 0; i<busreqList.length; i++)
        			busreqValue += "<li>"+busreqList[i]+"</li>";
        		$('.business').find('ul').html('');
        		$('.business').find('ul').html(busreqValue);
        	}
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}

function businessReqInScopeDataRetrieve(){
	
	$.ajax({
        url: "businessreqInScopeDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 $.each(data, function(key, value){
            	 var Row="<tr class = 'rowClass'>"+
            	 "<td style='text-align:center'>"+value.req_in_scope+"</td>" +
            	 "<td><textarea style='width: 100%' class='description' readonly>"+value.description+"</textarea></td>" +
            	 "<td>"+
            	 "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                            "<ul class='dropdown-menu'>"+
                            "<li><a  class='fa fa-edit EditRowBusiness' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                            "</ul>"+
                            "</div>"+
            	 "</td>" +
            	 "</tr>";
            	 $("#reqinscope").append(Row);
             });
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}