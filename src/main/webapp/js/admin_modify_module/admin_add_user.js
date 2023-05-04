$('#add_usersubmit').click(function(){
        var uname=$("#uname").val();
        var ufname=$("#ufname").val();
        var ulname=$('#ulname').val();
        var u_email=$('#u_email').val();
        var u_pwd=$('#u_pwd').val();
        var conf_u_pwd=$('#conf_u_pwd').val();
        var u_role=$('#u_role').val();
        var uflag=true;
        if(uname=="")
        {
		notification("error","Please Enter Username","Note");
		}
		 if(ufname=="")
        {
		notification("error","Please Enter Firstname","Note");
		}
		 if(ulname=="")
        {
		notification("error","Please Enter Lastname","Note");
		}		
        
        if(IsEmail(u_email)==false)
        {
		notification("error","Please Enter a Valid Email","Note");
		}	
		if(u_pwd=="")
        {
		notification("error","Please Enter Password","Note");
		}
		 if(u_role=="")
         {
		 notification("error","Please Select a User Role","Note");
		 }
        if(u_pwd!=conf_u_pwd)
        {
		notification("error","Password and Confirm Password Does not Match","Note");
		}
        if(u_pwd==conf_u_pwd&&IsEmail(u_email)==true&&u_role!="")
        {
        $.ajax({
            url: "Add_users_servlet",
            type: 'POST',
            data : {uname:uname,ufname:ufname,ulname:ulname,u_email:u_email,u_pwd:u_pwd,u_role:u_role},
            dataType: "json",
            success: function (data) {
			if($("#u_pwd").val().length<8 && $('#conf_u_pwd').val().length<8)
			{
				notification("error","Password and Confirm Password Contains atleast 8 Characters","Note");
			}
			 if(data.uemailduplicate=="Yes" && data.unameduplicate=="Yes")
            {
			 uflag=false;	
			 notification("error","Username & E-Mail Already Exists","Note");
			}
          	if(data.uemailduplicate=="Yes" && uflag)
            {
			notification("error","E-Mail Already Exists","Note");
	 		}
	 		if(data.unameduplicate=="Yes" && uflag)
            {
	 		notification("error","Username Already Exists","Note");
	 		}
	 		if(data.flag=="Success")
            {
	 		notification("success","User is Added Successfully.","Note");
	 		window.setTimeout(function(){location.reload()},1500)
	 		}
                console.log("Data",data);
                
        } 
           
        });
        }
        function IsEmail(u_email) {
  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  if(!regex.test(u_email)) {
    return false;
  }else{
    return true;
  }
}
       });
        

       
       
        $(document).on('click', '.editpopup', function () {
    $('#editpopup_btn').click();
     var seqnum=$(this).index('.editpopup');
    var currentRow=$(this).closest("tr");
    var uname_modify=currentRow.find("td:eq(0)").text();
    var ufname_modify=currentRow.find("td:eq(1)").text();
    var ulname_modify=currentRow.find("td:eq(2)").text();
    var u_email_modify=currentRow.find("td:eq(3)").text();
    var u_role_modify=currentRow.find("td:eq(4)").text();
    var random_id_modify=currentRow.find("td:eq(5)").text();
    
    
     $('#uname_modify').val(uname_modify);
     $('#ufname_modify').val(ufname_modify);
     $('#ulname_modify').val(ulname_modify);
     $('#u_email_modify').val(u_email_modify);
     $('#u_role_modify').val(u_role_modify);
     $('#random_id_modify').val(random_id_modify);
     
    $('#EditPopUp').on('shown.bs.modal', function () {
    });
    });
    $(document).on('click', '.deletepopup', function () {
    $('#deletepopup_btn').click();
    var seq_num=$(this).index('.deletepopup');
    var currentRow=$(this).closest("tr");
    var random_id=currentRow.find("td:eq(5)").text();
    $('#random_id').val(random_id);
    $('#DeletePopUp').on('shown.bs.modal', function () {
    });
    });