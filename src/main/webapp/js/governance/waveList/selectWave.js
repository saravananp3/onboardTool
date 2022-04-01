$(document).on('click','.waveCard',function(){
	var index = $(this).index(".waveCard");
	var waveName = $(".waveName").eq(index).val();
	var waveId = $(".waveId").eq(index).val();
	selectWaveAjaxCall(waveName,waveId);
});

function selectWaveAjaxCall(name,id)
{
	var f=document.form;
	f.method="post";
	f.action="selectWaveServlet?selectedWaveName="+name+"&selectedWaveId="+id;
	f.submit();
}