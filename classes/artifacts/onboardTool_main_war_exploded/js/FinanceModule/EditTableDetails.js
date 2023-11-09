$('#update_submit').click(function(){
        var seq_num=$('#random_id_modify').val();
        var Project_Number=$("#ProjectNumber_modify").val();
        var  Application_Name=$("#ApplicationName_modify").val();
        var Software_and_Licensing=$("#Software_and_Licensing_modify").val();
        var Contract_Date=$("#Contract_Date_Modify").val();
        var scope_of_infrastructure=$("#Scope_modify").val();
        var Cost_Avoidance=$("#AvoidanceCost_modify").val();
         var Cost_of_Archive=$("#ArchiveCost_modify").val();
        var CBA=$("#CBA_modify").val();
         var Funding_approval=$("#Approval_modify").val();
          var Funding_type=$("#Type_modify").val();
          console.log("The Sequence number",seq_num);
       console.log("I am  Connected to js page");
       
        var flag=true;
        var uflag=true;
    if (Application_Name==""){
     notification("error","Application Name cannot be null.","Details Update"); 
     flag=false;   
    }
    if (Project_Number==""){
    notification("error","Project_Number cannot be null.","Details Update");
    flag=false;     
    }
    if (Software_and_Licensing ==""||Contract_Date==""||scope_of_infrastructure==""||Cost_Avoidance==""||Cost_of_Archive==""||CBA==""||Funding_approval==""||Funding_type=="") {
    notification("error","Fill All The Required Details","Details Update");
    flag=false;     
    }
   
    if(flag){
           $.ajax({     
            url: "EditTableDetailServlet",
            type: 'POST',
            data : {ProjectNumber_modify:Project_Number,ApplicationName_modify:Application_Name,Software_and_Licensing_modify:Software_and_Licensing,Contract_Date_Modify:Contract_Date,Scope_modify:scope_of_infrastructure,AvoidanceCost_modify:Cost_Avoidance,ArchiveCost_modify:Cost_of_Archive,CBA_modify: CBA,Approval_modify:Funding_approval,Type_modify:Funding_type},
            dataType: "json",
            success: function (data) {
                var seq_num=data.random_id;
                var Project_Number=data.Project_Number;
                var Application_Name=data.Application_Name;
                var Software_and_Licensing=data.Software_and_Licensing;
                var Contract_Date=data.Contract_Date;
                var scope_of_infrastructure=data.scope_of_infrastructure;
                var Cost_Avoidance=data.Cost_Avoidance;
                var Cost_of_Archive=data.Cost_of_Archive;
                var CBA=data.CBA;
                var Funding_approval=data.Funding_approval;
                var Funding_approval=data.Funding_approval;
            if(data.ProjectNumber=="Yes" && data.ApplicationName=="Yes")
            {
			 uflag=false;	
			 notification("error","Application Name And Project Number Already Exists","Note");
			}
			if(data.ProjectNumber=="Yes" && uflag)
            {
			notification("error","ProjectNumber Already Exists","Note");
	 		}
	 		if(data.ApplicationName=="Yes" && uflag)
            {
	 		notification("error","Application Name Already Exists","Note");
	 		}
	 		if(data.flag=="Success")
            {
	 		notification("success","Finance Details Updated Successfully.","User Update");
	 		window.setTimeout(function(){location.reload()},1500)
	 		}  
	 		if(data.partial_update=="Success")
            {
	 		notification("success","FinanceDetails Details Updated Successfully.","User Update");
	 		window.setTimeout(function(){location.reload()},1500)
	 		}              
            }
        });
 }});	
      