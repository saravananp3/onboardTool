$(document).ready(function(){

	
	//Screen Info
$(document).on('click','.screenInfoEditRow', function(){
	
	var className = $(this).attr('class');
	/*getTableSections(className);*/
	var seqNum = $(this).index('.screenInfoEditRow');
	
		var nameReadOnly = $(".screenDisplay").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			
			$(".screenDisplay").eq(seqNum).removeAttr("readonly");
			$(".purpose").eq(seqNum).removeAttr("readonly");
			$(".equivalentLegacy").eq(seqNum).removeAttr("readonly");
			
			notification("info","Seleted row is editable in Screen Info","Info:");
		}
		else
		{
			
			$(".screenDisplay").eq(seqNum).prop("readonly", true);
			$(".purpose").eq(seqNum).prop("readonly", true);
			$(".equivalentLegacy").eq(seqNum).prop("readonly", true);
			
			notification("info","Seleted row is non-editable in Screen Info","Info:");
		}	
	});

//Search form
$(document).on('click','.searchFormEditRow', function(){
	
	var className = $(this).attr('class');
	/*getTableSections(className);*/
	var seqNum = $(this).index('.searchFormEditRow');
	
		var nameReadOnly = $(".searchFormFieldName").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			
			$(".searchFormFieldName").eq(seqNum).removeAttr("readonly");
			$(".searchFormFieldFormat").eq(seqNum).removeAttr("readonly");
			$(".searchFormDataType").eq(seqNum).removeAttr("disabled");
			$(".searchFormDataRetrieval").eq(seqNum).removeAttr("disabled");
			$(".searchFormRequiredField").eq(seqNum).removeAttr("disabled");
			$(".searchFormAdditionalInfo").eq(seqNum).removeAttr("readonly");
			
			notification("info","Seleted row is editable in Screen Info","Info:");
		}
		else
		{
			
			$(".searchFormFieldName").eq(seqNum).prop("readonly", true);
			$(".searchFormFieldFormat").eq(seqNum).prop("readonly", true);
			$(".searchFormDataType").eq(seqNum).prop("disabled", true);
			$(".searchFormDataRetrieval").eq(seqNum).prop("disabled", true);
			$(".searchFormRequiredField").eq(seqNum).prop("disabled", true);
			$(".searchFormAdditionalInfo").eq(seqNum).prop("readonly", true);
			
			notification("info","Seleted row is non-editable in Screen Info","Info:");
		}	
	});
var deleteSearchForm = false;
	$(document).on('click','.screenInfoDeleteRow', function(){
		
		var seqNum = $(this).index('.screenInfoDeleteRow')+1;
		$('#screenInfoDeleteSeq').val(seqNum);
		$('#screenInfoDeleteId').click();
		deleteSearchForm = false;
	});
$(document).on('click','.searchFormDeleteRow', function(){
		
		var seqNum = $(this).index('.searchFormDeleteRow')+1;
		$('#screenInfoDeleteSeq').val(seqNum);
		$('#screenInfoDeleteId').click();
		deleteSearchForm = true;
	});
	$(document).on('click','#screenInfoDeleteSubmit', function(){
	
	
	$('.submitDisableScreenInfo').attr('disabled', true);
	var seqNum = $('#screenInfoDeleteSeq').val();
	if(!deleteSearchForm)
	archiveScreenInfoDeleteAjaxCall(seqNum);
	else
	archiveSearchFormDeleteAjaxCall(seqNum);
	$('.submitDisableScreenInfo').attr('disabled', false);
	$('#screenInfoDeleteClose').click();
	});


});

function archiveScreenInfoDeleteAjaxCall(seqNum){
	
	$.ajax({
        url: "archiveScreenReqDeleteServlet",
        type: 'POST',
        data: {seqNum:seqNum},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Delete Row for Screen req--->",data);
        	if(data.DeleteStatus){
        		for(var i=seqNum;i<$('.ScreenReqId').length;i++)
    			{
    			 var count = 0;
    			 var seq_num=i+"";
    			  if(seq_num.length<3)
    			  {
    			  count = 3-seq_num.length;
    			  for(var j=0;j<count;j++)
    			  seq_num = "0"+seq_num;
    			  }
    			var reqId = $('.ScreenReqId').eq(i).html();
    			var ReqId = reqId.split("-");
    			$('.ScreenReqId').eq(i).html(ReqId[0]+"-"+seq_num);
    			
    			}
        		
        		$('.screenReqRowClass').eq(seqNum-1).remove();
        		if(data.searchFormDeleteStatus)
        			{
        			var deleteReqId = data.deleteReqId;
        			var deleteClass = deleteReqId.replace("-","");
        			var deleteLength = $("."+deleteClass).length;
        			for(var i=0;i<deleteLength;i++)
        				$("."+deleteClass).eq(0).remove();
        			var reqIdArray = [];
        			var screenReqLength = $(".searchFormRowClass").length;
        			for(var i = 0; i < screenReqLength;i++)
        			{
        				var classNames = $(".searchFormRowClass").eq(i).attr("class");
        			    var className = classNames.split(" ");
        			   if(!reqIdArray.includes(className[1]))
        				   reqIdArray.push(className[1]);
        			   var ArrayLength = reqIdArray.length;
        			   var seqNumber =  parseInt(className[1].substring(className[1].lastIndexOf('R')+1));
        			   if(ArrayLength!=seqNumber)
        				{
        				   var seq_num = (seqNumber-1)+""; 
        				   if(seq_num.length<3)
        	    			  {
        	    			  count = 3-seq_num.length;
        	    			  for(var j=0;j<count;j++)
        	    			  seq_num = "0"+seq_num;
        	    			  }
        				   var reqId = "SDR-"+seq_num;
        				   var reqClass = "SDR"+seq_num;
        				   $(".searchFormRowClass").eq(i).find(".searchFormReqId").html(reqId);
        				   $(".searchFormRowClass").eq(i).attr('class',className[0]+" "+reqClass);
        				   
        				}
        			}
        				}
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
	function archiveSearchFormDeleteAjaxCall(seqNum){
		
		$.ajax({
	        url: "archiveSearchFormDeleteServlet",
	        type: 'POST',
	        data: {seqNum:seqNum},
	        async: false,
	        dataType: "json",
	        success: function (data) {
	        	console.log("Delete Row for Screen req--->",data);
	        	if(data.DeleteStatus){
	        		$('.searchFormRowClass').eq(seqNum-1).remove();
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
