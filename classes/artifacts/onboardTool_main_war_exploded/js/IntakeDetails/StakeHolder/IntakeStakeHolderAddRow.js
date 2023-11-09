$("#AddStakeUserBtn").click(function()
{
    AddRowAjaxCall();
    //location.reload();
});
function AddRowAjaxCall()
{
    $.ajax({
        url: "IntakeStakeHolderAddRowServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
        console.log("data add row---->",data);
        if(data.checkAdd)
        {
             var Row =  "<tr class='UserRow'>"+
            
                        "<td><input type='text' id='firstName"+number+"' class ='name' style='width: 100%; text-align: center;' value='' ></td>"+
                        "<td><input type='text' id='search"+number+"' class ='emailid' style='width: 100%; text-align: center;' onClick='searchFunction("+number+");' value='' ><ul id='result"+number+"' class='list-group searchResult'></ul></td>"+
                        "<td><input type='text' id='userName"+number+"' class='username' value='' style='width: 100%; text-align: center;' ></td>"+
                        "<td><select type='text' class='role' value='' style='width: 100%; text-align: center;padding: 0.3rem 0 0.3rem 0;'>"+
                             "<option value='Development Owner'>Development Owner</option>"+
                             "<option value='Application Owner'>Application Owner</option>"+
                             "<option value='Project Sponsor'>Project Sponsor</option>"+
                             "<option value='Project Manager'>Project Manager</option>"+
                             "<option value='Business Owner'>Business Owner</option>"+
                             "<option value='Technical S.M.E'>Technical S.M.E</option>"+
                             "</select></td>"+
                            "<td><input type='text' class='priorityNum' style='width: 100%; text-align: center;' value=''/></td>"+
                             "<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                        "<ul class='dropdown-menu' style = 'min-width: inherit;'>"+
                        "<li><a   class='fa fa-edit EditRow' style='font-size: 19px; font-weight:750; color: black;'>&nbsp;&nbsp;Edit</a></li>"+
                        "<li><a   class='fa fa-trash DeleteRow' style='font-size: 18px; font-weight:750;color: black;'>&nbsp;&nbsp;Delete</a></li>"+
                        "</ul>"+
                        "</div>"+
                        "</td>"+
                        "</tr>";
             $("#UserList").append(Row);
             notification("success","Row added Successfully.","Note");
             number++;
        }
        else if(!data.checkAdd)
        {
            notification("error","Row is not added.","Error");
        }
        },
        error: function (e) {
            console.log(e);
        }
    });
}
function searchFunction(i){
    $('#search'+i).keyup(function() {
        $('#result'+i).html('');
        var searchField = $('#search'+i).val();
        var expression = new RegExp(searchField, "i");
        $.ajax({
            type: "POST",
            url: "Retrieve_users_servlet",
            dataType: "json",
            success: function(data) {
                console.log(data);
                 if (!$.isArray(data)) {
                data = [data];
            }
                $('#result'+i).empty();
                $.each(data, function(key, value) {
                    if (value.u_email.search(expression) != -1){                        
                        $('#result'+i).append('<li class="list-group-item link-class" id="list">' + value.u_email +'</li>');                    
                    }
                });
            }
        });
    });
    $('#result' + i).on('click', '#list', function() {
        var click_text = $(this).text();
        $('#search' + i).val(click_text);
        $("#result" + i).html('');
        $.ajax({
            type: "POST",
            url: "Retrieve_users_servlet",
            dataType: "json",
            success: function(data) {
                console.log(data);
                if (!$.isArray(data)) {
                    data = [data];
                }
                var count = 0;
                var first_name;
                var user_name;
                $.each(data, function() {
                    if (click_text == data[count].u_email) {
                        first_name = data[count].ufname;
                        user_name = data[count].uname;
                        console.log(first_name);
                        console.log(user_name);
                        document.getElementById('firstName'+i).value = first_name;
                        document.getElementById('userName'+i).value = user_name;
                    }
                    count = count + 1;
                });
            }
        });
    });
};