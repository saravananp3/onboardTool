$(document).ready(function(){
$(document).on('click',".editWaveClass",function()
		{
	         var index = $(this).index(".editWaveClass");
	         var waveId = $(".waveId").eq(index).val();
	         location.href ="waveEdit.jsp?waveId='"+waveId+"'";
	         
		});
$(document).on('change',".phaseHeadingName",function()
		{
	         var index = $(this).index(".phaseHeadingName");
	         
		});
		
});

