var typingTimer;                
var doneTypingInterval = 500;  
$(document).on('keyup','#appFilter', function () {
          clearTimeout(typingTimer);
          var Obj_this = this;
          typingTimer=setTimeout(function (){
              doneTyping(Obj_this);
              },  doneTypingInterval);
});
$(document).on('keydown','#appFilter',function () {
clearTimeout(typingTimer);
 /*setTimeout(function() {
       $('#appFilter').empty();
   }, 1000);*/
});
function doneTyping(obj)
{
var phaseName = $(obj).val();
if(phaseName!=="") {
getList(phaseName,"Phase",true);
} else {
setTimeout(function() {
window.location.reload();
}, doneTypingInterval);
}
}
function getList(phase,category, searchByApp)
{
    $.ajax({
        url: "filteringListServlet",
        type: 'POST',
        dataType: "json",
        data:{category:category,phase:phase,searchByApp:searchByApp},
        success: function (data) {
            console.log("Wave Options:", data);
             if (!$.isArray(data)) {
                 data = [data];
             }
             switch(category)
             {
             /*case "Wave":
                 displayWaveList(data);
                 break;
             case "Application":
                 getOpportunityList(data);
                 break;*/
             case "Phase":
                 getPhaseList(data);
                 break;
             }
        },
        error: function (e) {
            console.log(e);
        }
});
}