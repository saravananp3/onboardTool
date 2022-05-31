var number = 0;
$(document).ready(function() {
    StakeHolderDataRetrieveAjaxCall();
    $(document).on('click', '.DeleteRow', function() {
        var seqnum = $(this).index('.DeleteRow');
        $("#Sequence").val(seqnum);
        $("#deletepopup_btn").click();
    });
    $(document).on('click', '.EditRow', function() {
        var seqnum = $(this).index('.EditRow');
        var ReadOnly = $('.name').eq(seqnum).is('[readonly]');
        if (ReadOnly) {
            ReadOnlyPropertyConfig(seqnum, false);
            notification("info", "Selected row is editable.", "Info");
        }
        else {
            ReadOnlyPropertyConfig(seqnum, true);
            notification("info", "Selected row is non editable", "Info");
        }
    });
    $(document).on('click', '#DeleteSubmit', function() {
        var DeleteSeqNum = $("#Sequence").val();
        DeleteRowAjaxCall(DeleteSeqNum);
    });
});
function StakeHolderDataRetrieveAjaxCall() {
    $.ajax({
        url: "IntakeStakeHolderDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        data: { isApprover: "false" },
        success: function(data) {
            console.log("Data Retrieve Stake Holder json array----->", data);
            if (!$.isArray(data)) {
                data = [data];
            }
            var index = 0;
            var checkData = false;
            var options_arr = ['Development Owner', 'Application Owner', 'Project Sponsor', 'Project Manager', 'Business Owner', 'Technical S.M.E'];
            $.each(data[0], function(key, value) {
                if (index == 0) {
                    checkData = value.checkExistence;
                    $("#UserList").html("");
                }
                else if (checkData && index != 0) {
                    var name = (value.name == undefined) ? "" : value.name;
                    var emailid = (value.emailId == undefined) ? "" : value.emailId;
                    var username = (value.username == undefined) ? "" : value.username;
                    var role = (value.role == undefined) ? "" : value.role;
                    var priorityNum = (value.priorityNum == undefined) ? "" : value.priorityNum;
                    var readonly = "readonly";
                    var disable = "disabled";
                    var options = "";
                    for (var n = 0; n < options_arr.length; n++) {
                        var selected = (role == options_arr[n]) ? "selected" : "";
                        options += "<option value='" + options_arr[n] + "' " + selected + ">" + options_arr[n] + "</option>";
                    }
                    if (role == undefined || role == "" && emailid == undefined || emailid == "" && username == undefined || username == "" && name == "" || name == undefined) {
                        readonly = "";
                        disable = "";
                    }
                    var Row = "<tr class='UserRow'>" +
                        "<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>" +
                        "<ul class='dropdown-menu' style = 'min-width: inherit;'>" +
                        "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black;'>&nbsp;&nbsp;&nbsp;Edit</a></li>" +
                        "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black;'>&nbsp;&nbsp;&nbsp;Delete</a></li>" +
                        "</ul>" +
                        "</div>" +
                        "</td>" +
                        "<td><input type='text' id='firstName" + number + "' class ='name' style='width: 100%; text-align: center;' value='" + name + "' " + readonly + "></td>" +
                        "<td><input type='text' id='search" + number + "' class ='emailid' style='width: 100%; text-align: center;' onClick='searchFunction(" + number + ");' value='" + emailid + "' " + readonly + "><ul id='result" + number + "' class='list-group searchResult'></ul></td>" +
                        "<td><input type='text' id='userName" + number + "' class='username' style='width: 100%; text-align: center;' value='" + username + "' " + readonly + "></td>" +
                        "<td><select type='text'class='role' value='" + role + "' style='width: 100%; text-align: center;padding: 0.3rem 0 0.3rem 0;'>" +
                        options
                        + "</select></td>"
                        + "<td><input type='text' class='priorityNum' style='width: 100%; text-align: center;' value='" + priorityNum + "' " + readonly + "/></td>"
                        +
                        "</tr>";
                    $("#UserList").append(Row);
                }
                index++;
                number++;
            });
            if (!checkData) {
                notification("info", "No user data found, please click add button to add row.", "Info");
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}
function ReadOnlyPropertyConfig(index, prop) {
    var fieldClass = ['name', 'emailid', 'username', 'role', 'priorityNum'];
    for (var i = 0; i < fieldClass.length; i++) {
        var checkrole = true;
        var role = fieldClass[i].toString();
        if (role == "role") {
            var userRole = $(".role").eq(index).val();
            if (userRole == "Application Owner" || userRole == "Development Owner" || userRole == "Business Owner")
                checkrole = false;
        }
        if (checkrole) {
            $("." + fieldClass[i]).eq(index).attr('Readonly', '');
            $("." + fieldClass[i]).eq(index).attr('Readonly', prop);
        }
    }
    if (prop == false)
        $(".name").eq(index).focus();
}
function DeleteRowAjaxCall(DeleteSeqNum) {
    $.ajax({
        url: "IntakeStakeHolderDeleteRowServlet",
        type: 'POST',
        async: false,
        data: { DeleteSeqNum: DeleteSeqNum },
        dataType: "json",
        success: function(data) {
            console.log("delete row --> ", data);
            if (data.checkExistence) {
                $(".UserRow").eq(DeleteSeqNum).remove();
                notification("success", "Row deleted successfully.", "Note");
            }
            else
                notification("error", "Delete failed.", "Error");
            $("#DeleteClose").click();
            $("#Sequence").val("");
        },
        error: function(e) {
            console.log(e);
        }
    });
    return false;
}
function searchFunction(i) {
    $('#search' + i).keyup(function() {
        $('#result' + i).html('');
        var searchField = $('#search' + i).val();
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
                $('#result' + i).empty();
                $.each(data, function(key, value) {
                    if (value.u_email.search(expression) != -1) {
                        $('#result' + i).append('<li class="list-group-item link-class">' + value.u_email + '</li>');
                    }
                });
            }
        });
    });
    $('#result' + i).on('click', 'li', function() {
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
                        document.getElementById('firstName' + i).value = first_name;
                        document.getElementById('userName' + i).value = user_name;
                    }
                    count = count + 1;
                });
            }
        });
    });
};