$(document).ready(function(){
    requestType();
    redirectToPage();
});
function requestType(){
//  $(".card1").eq(0).removeAttr("href");
//  $(".card1").eq(0).addClass("disabled");
    $(".card1").eq(1).removeAttr("href");
    $(".card1").eq(1).addClass("disabled");
    //$(".card1").attr();
    $.ajax({
        url: "ApproverRolesDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Request Type json array----->",data);
/*          
var value=data.request_type.toString();
if(value == "To be retire"){
    //$(".card1").show();
    $(".card1").eq(0).removeClass("disabled");
    $(".card1").eq(1).removeClass("disabled");
    $(".card1").eq(0).attr("href","ArchiveRequirementsIntroDetails.jsp");
    $(".card1").eq(1).attr("href"," AppDecommInfo.jsp");
    var archiveApprovalStatus = data.checkOverAllArchiveStatus;
    if(archiveApprovalStatus)
        $(".card1").eq(0).attr("href","archiveRequirementsReviewDetails.jsp");
}   
else if(value == "Archive"){
    //$("#archiveReq").show();
    $(".card1").eq(0).removeClass("disabled");
    $(".card1").eq(0).attr("href","ArchiveRequirementsIntroDetails.jsp");
    var archiveApprovalStatus = data.checkOverAllArchiveStatus;
    if(archiveApprovalStatus)
        $(".card1").eq(0).attr("href","archiveRequirementsReviewDetails.jsp");
    } 
else */
if(value == "Decommission"){
    //$("#decomReq").show();
    $(".card1").eq(1).removeClass("disabled");
    $(".card1").eq(1).attr("href"," AppDecommInfo.jsp");
}
}             
         });
}
        function moduleAccess(completeStatus,cuurrentModule)
{
             if(cuurrentModule=="ArchiveIntro" &&completeStatus=="Yes"){
                     $("#archiveReq").attr("href","");
             $("#archiveReq").attr("href","archiveRequirementsLegacyDetails.jsp");
            }else if(cuurrentModule=="ArchiveIntro" &&completeStatus=="No"){
                     $("#archiveReq").attr("href","");
             $("#archiveReq").attr("href","ArchiveRequirementsIntroDetails.jsp");
            }else if(cuurrentModule=="LegacyApplication" &&completeStatus=="Yes"){
                     $("#archiveReq").attr("href","");
             $("#archiveReq").attr("href","archiveRequirementsRetentionDetails.jsp");
            }else if(cuurrentModule=="RetentionApplication" &&completeStatus=="Yes"){
                     $("#archiveReq").attr("href","");
             $("#archiveReq").attr("href","ArchiveBusinessRequirements.jsp");
            }
            else if(cuurrentModule=="BusinessRequirement" &&completeStatus=="Yes"){
                 $("#archiveReq").attr("href","");
             $("#archiveReq").attr("href","archiveReqAbbrevation.jsp");
            }else if(cuurrentModule=="Revisions" &&completeStatus=="Yes"){
                     $("#archiveReq").attr("href","");
             $("#archiveReq").attr("href","archiveRequirementsAddendum.jsp");
            }
            else if(cuurrentModule=="Revisions" &&completeStatus=="No"){
                 $("#archiveReq").attr("href","");
             $("#archiveReq").attr("href","archiveReqAbbrevation.jsp");
            }   
            else if(cuurrentModule=="Addendum" &&completeStatus=="Yes"){
                 $("#archiveReq").attr("href","");
             $("#archiveReq").attr("href","archiveRequirementsReviewDetails.jsp");
            }   
}
function redirectToPage(){
    $.ajax({
        url: "ArchiveReqCurrentPageStatusServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("data-->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            $.each(data, function(key, value){
                var completeStatus=value.completeStatus;
                var cuurrentModule=value.cuurrentModule;
                moduleAccess(completeStatus,cuurrentModule)
            });
        },
        error: function (e) {
            console.log(e);
        }
    });
}