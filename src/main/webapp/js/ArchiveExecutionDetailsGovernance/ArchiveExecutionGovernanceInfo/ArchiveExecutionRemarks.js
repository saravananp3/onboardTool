$(document).on('click','.remarksIcon',function(){
var ss=$(this).index(".remarksIcon");
var s1 = $(this).attr("id");
var seq_num=parseInt(s1.replace(/[^0-9.]/g, ""));
console.log("Index",seq_num);
$("#ArchiveRemarksSeq").val(ss);
var remarks = $('.remark').eq(ss).val();
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
var taskGroup =$("#taskGroup"+seq_num+"").text();
console.log("TASK GROUP",taskGroup);
$("#remarksTaskGroup").html("Task Group : "+((taskGroup=="")?"NA":taskGroup));
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