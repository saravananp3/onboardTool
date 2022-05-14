var i=0;
$(document).ready(function (){
$(document).on('click','#docRevAdd', function(){
        var seqNum = $('.rowClassDoc').length;
        archiveReqDecRevAddAjaxCall(seqNum);
    });
});
function archiveReqDecRevAddAjaxCall(seqNum){
    $.ajax({
        url: "archiveReqDecRevAddServlet",
        type: 'POST',
        data: {seqNum:seqNum},
        async: false,
        dataType: "json",
        success: function (data) {
            console.log("Add Row Retrieve--->",data);
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            today = mm + '/' + dd + '/' + yyyy;
            var seq=Number(seqNum);
            var version=getRevisionVersion();
            seq=seq+1;
            var finalVersion=version==1?seq:version;
            if(data.AddStatus){
                var Row="<tr class = 'rowClassDoc'>"+
             "<td><input type ='text' class='date' style='width: 100%; text-align:center;' value="+today+" readonly></td>" +
             "<td><input type ='text' class='version' style='width: 100%; text-align:center;' value="+finalVersion +" readonly></td>" +
             "<td><input type ='text' class='documentChanges' style='width: 100%; text-align:center;' value='' readonly></td>" +
             "<td><input type ='text' class='changeAuthor' style='width: 100%; text-align:center;' value='' readonly></td>" +
             "<td>"+
             "<div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                           "<ul class='dropdown-menu'>"+
                           "<li><a  class='fa fa-edit EditRowDoc' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                           "<li><a  class='fa fa-trash DeleteRowDoc' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                           "</ul>"+
                           "</div>"+
             "</td>" +
             "</tr>";
             $("#docRevInfo").append(Row);
                notification("success","Row added Successfully.","Note:");
            }
            else
                notification("error","Error occured while adding the row.","Error:");
        },
        error: function (e) {
            console.log(e);
        }
    });
    function getRevisionVersion(){
    var version;
    $.ajax({
        url: "RevisionVersionServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
            console.log("version Retrieve--->",data);
                          $.each(data, function(key, value){
                              version=value.version;
                  });
           }
        });
        return version;
    }
}