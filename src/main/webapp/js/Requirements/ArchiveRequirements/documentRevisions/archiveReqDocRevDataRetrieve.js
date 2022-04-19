$(document).ready(function(){
    archiveReqDocRevDataRetrieve();
});
function archiveReqDocRevDataRetrieve(){
    $.ajax({
        url: "archiveReqDocRevDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
            console.log("Table Retrieve--->",data);
             if (!$.isArray(data)) {
                 data = [data];
             }
             $("#docRevInfo").html("");
             var checkTable = data[0].checkExistance;
                 var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            today = mm + '/' + dd + '/' + yyyy;
             if(checkTable){
             $.each(data, function(key, value){
                 var dateFromDb=value.date==''?today:value.date;
                 var versionFromDb=value.version;
                 var Row="<tr class = 'rowClassDoc'>"+
                 "<td><input type ='text' class='date' value='"+dateFromDb+"' readonly></td>" +
                 "<td><input type ='text' class='version' value='"+versionFromDb+"' readonly></td>" +
                 "<td><input type ='text' class='documentChanges' value='"+value.documentChanges+"' readonly></td>" +
                 "<td><input type ='text' class='changeAuthor' value='"+value.changeAuthor+"' readonly></td>" +
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
                 });
             var script="<script>$('.datepicker1').datepicker({\n" +
             "format: \"mm/dd/yyyy\",\n"+
             "clearBtn:true,"+
             "autoclose: true,\n"+
             "orientation: 'bottom',"+
             "});";
             $('#scripttag').append(script);
                 }
            else{
                     var Row="<tr class = 'rowClassDoc'>"+
                     "<td><input type ='text' class='date' value="+today+" readonly></td>" +
             "<td><input type ='text' class='version' value="+'1' +" readonly></td>" +
                                         "<td><input type ='text' class='documentChanges' value='' readonly></td>" +
                     "<td><input type ='text' class='changeAuthor' value='' readonly></td>" +
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
                 }
                 },
        error: function (e) {
            console.log(e);
        }
    });
}