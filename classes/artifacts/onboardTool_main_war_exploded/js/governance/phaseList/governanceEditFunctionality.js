$(document).ready(function(){
$(document).on('click',".editPhaseClass",function()
		{
	         var index = $(this).index(".editPhaseClass");
	         var phaseId = $(".phaseId").eq(index).val();
	         location.href ="phaseEdit.jsp?phaseId='"+phaseId+"'";
	         
		});
$(document).on('change',".phaseHeadingName",function()
		{
	         var index = $(this).index(".phaseHeadingName");
	         
		});
		
});

