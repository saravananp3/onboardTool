$(document).ready(function(){

	switchValue("Phase");
	
});
$("#category").change(function(){
var selectedValue = $(this).val();
switchValue(selectedValue);

});
 function switchValue(value)
 {
	 $("#phase").val('none');
	 $("#wave").val('none');
	 switch(value)
	 {
	 case 'Phase':
		 $(".PhaseRow").hide();
		 $(".WaveRow").hide();
		 var attr = $("#button").attr('onclick');
		 $("#button").attr("onclick","location.href='NewPhase.jsp'");
		 break;
     case 'Wave':
    	 
		 $(".WaveRow").hide();
		 $(".PhaseRow").show();
		 $("#button").attr("onclick","location.href='NewGovernance.jsp'");
		 break;
     
     case 'Application':
    	 $(".PhaseRow").show();
		 $(".WaveRow").show();
		 $("#button").attr("onclick","location.href='Intake_NewOpportunity.jsp'");
		 break;
	 }
 }