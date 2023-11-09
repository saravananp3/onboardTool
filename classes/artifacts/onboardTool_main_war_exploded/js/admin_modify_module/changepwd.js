$('#change_PWD').click(function(){
		var user_Name=$("#user_Name").val();
        var prev_pwd=$("#prev_pwd").val();
        var new_pwd=$("#new_pwd").val();
        var conf_new_pwd=$('#conf_new_pwd').val();
        console.log("Prev Pwd : ",prev_pwd);
        if(prev_pwd=="")
        {
		notification("error","Please Enter Current Password","Note");
		}
         if(new_pwd!=conf_new_pwd)
		{

			notification("error","New Password and Confirm New Password Does not Match","Note");
			 

		}
		
		if($("#new_pwd").val().length<8 && $('#conf_new_pwd').val().length<8)
		{
			notification("error","New Password and Confirm New Password Contains atleast 8 Characters","Note");
		}
        if(new_pwd==conf_new_pwd && $("#new_pwd").val().length>=8 && $('#conf_new_pwd').val().length>=8 && prev_pwd!="")
        {
			$.ajax({
            url: "Change_pwd_servlet",
            type: 'POST',
            data : {user_Name:user_Name,prev_pwd:prev_pwd,new_pwd:new_pwd},
            dataType: "json",
            success: function (data) {                       
            console.log("Change Password : ",data) 
           if(data.Prev_Pwd=="False")
           {
			notification("error", "Current Password is Incorrect", "Error");

      	  } 
      	  if(data.Prev_Pwd=="True")
           {
			notification("success", "Password is Updated Successfully", "Note");
           setTimeout(function() {
				location.href="logout.jsp";
				}, 2000);
      	  } 
      	  }
        });
        }
     
		
       });
      
