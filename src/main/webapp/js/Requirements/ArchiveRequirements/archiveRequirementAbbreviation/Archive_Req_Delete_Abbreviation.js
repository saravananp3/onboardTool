$(document).on('click', '.deletepopup', function () {
   $('#dltabbreviationbtn').click();
});


$('#delete_abbreviation_submit').click(function(){
        var random_id=$('#seq_no_dlt').val();
        $.ajax({
            url: "Delete_Abbreviation_Servlet",
            type: 'POST',
            data : {random_id:random_id},
            dataType: "json",
            success: function (data) {
                var random_id=data.random_id;
                
            }
        });
        notification("success","Abbreviation and its Description are deleted successfully","Delete Abbreviation");
        window.setTimeout(function(){location.reload()},220)});
        //dltabbreviationbtn