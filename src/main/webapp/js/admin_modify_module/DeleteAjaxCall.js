$('#delete_submit').click(function(){
        var seq_num=$('#seq_num').val();
        $.ajax({
            url: "Delete_users_servlet",
            type: 'POST',
            data : {seq_num:seq_num},
            dataType: "json",
            success: function (data) {
                var seq_num=data.seq_num;
                notification("success","Selected field is edited successfully in Opportunity.","Note");
            }
        });
        location.reload();});