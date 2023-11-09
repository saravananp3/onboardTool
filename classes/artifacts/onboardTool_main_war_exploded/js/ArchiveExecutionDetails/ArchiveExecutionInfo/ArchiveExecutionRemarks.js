
$(document).on('click','.remarksIcon',function(){
var seq_num = $(this).index(".remarksIcon");
$("#ArchiveRemarksSeq").val(seq_num);
var remarks = $('.remark').eq(seq_num).val();
var remarkPoints=[];
$("#remarkPts").html("");
var pts="";
pts+="<ul>";
var emptyListFlag = true;
if(remarks!=""&&remarks!=undefined){
remarkPoints = remarks.split(":=:");
for(var i=0;i<remarkPoints.length;i++){
 pts+="<li>"+remarkPoints[i]+"</li>";
 emptyListFlag = false;
}
}
if(emptyListFlag)
	pts += "<li></li>"
pts += "</ul>";
$("#remarkPts").html(pts);
var taskName = $(".taskName").eq(seq_num).html();
var taskGroup =$(".taskGroup").eq(seq_num).html();
$("#remarksTaskGroup").html("Task Group : "+((taskGroup=="")?"NA":taskGroup));
$("#remarksTaskName").html("Task Name : "+((taskName=="")?"NA":taskName));
$("#ArchExecRemarksId").click();
});

$(document).on("mouseenter", ".remarksIcon", function() {
	var index = $(this).index('.remarksIcon');
	$('.ArchiveList').eq(index).attr('data-toggle','');
});

$(document).on("mouseleave", ".remarksIcon", function() {
	var index = $(this).index('.remarksIcon');
	$('.ArchiveList').eq(index).attr('data-toggle','collapse');
});