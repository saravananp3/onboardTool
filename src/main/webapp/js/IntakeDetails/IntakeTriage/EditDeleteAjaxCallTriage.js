    $('#TriageEditSubmit').click(function(){
    	var Label=$("#TriageLabelModify").val();
    	var Mandatory = $("#TriageEditMandatory").val();
    	var Seq_Num=$('#TriageEditSeqNum').val();
    	if (Label !='')
    	{
    		
    	$.ajax({
            url: "IntakeTriageEditServlet",
            type: 'POST',
            data : {seq_num:Seq_Num,label:Label,Mandatory:Mandatory},
            dataType: "json",
            success: function (data) {
            	
            	//alert("success");
            	console.log("Modify data : "+data.seq_no);
            	var index = data.seq_no - 1;
            	var updated_label_name = data.label_name;
            	var previous_label_name =data.previous_label_name;
            	if(data.mandatory==true)
            		{
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first").addClass("required_fie");
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first .hidedel").remove();
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first").append("<div class='deletealert' style='display:none;'></div>");
            		}
            	else
            		{
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first").removeClass("required_fie");
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first .deletealert").remove();
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first").append("<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;'></span>");
            		}
            	var html = $(".Inputvalue").eq(index).find("label[for =triage]").html();
            	var html1 =html.replace(previous_label_name,updated_label_name);
            	
            	console.log("HTML "+html1);
            	$(".Inputvalue").eq(index).find("label[for =triage]:first").html(html1);
            	$("#TriageLabelModify").val("");
            	$("#TriageEditClose").click();
            	$('.hidepen').hide();
            	//$('#Record_No').val(data.RandomNumber);
            },
            error: function (e) {
                console.log(e);
            }
        });
    	}
    	else {
    		
    		alert("Please fill the value in field");
    	}
    });
    $('#TriageDeleteSubmit').click(function(){
    	
    	var Seq_Num=$('#sequenceTriageDelete').val();
    	var check = TriageDeleteAjax(Seq_Num);
    	if(check)
    	{
    		$("#OpportunityListbtn").click();
    	}
    	
    });
    
    function TriageDeleteAjax(Seq_Num)
    {
    	$.ajax({
            url: "IntakeTriageDeleteServlet",
            type: 'POST',
            async: false,
            data : {seq_num:Seq_Num},
            dataType: "json",
            success: function (data) {
            	console.log("index"+data.index);
            	var index = data.index;
            	$(".Inputvalue").eq(index).remove();
            	$("#TriageDeleteClose").click();
            	$('.hidedel').hide();
            	//$("#OpportunityListbtn").click();
            },
            error: function (e) {
                console.log(e);
            }
        });
    	return true;
    }
    