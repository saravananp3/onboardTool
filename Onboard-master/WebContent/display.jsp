<!DOCTYPE html>
<html lang="en">
<head>
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  
<script type="text/javascript">
    function EnableDisableTextBox(chkROD) {
        var txtROD = document.getElementById("txtROD");
        txtROD.disabled = chkROD.checked ? false : true;
        if (!txtROD.disabled) {
            txtROD.focus();
        }
        
    }
</script>
<script>

$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox").attr("disabled", "disabled");
        }
    });
});
$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox1").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox1").attr("disabled", "disabled");
        }
    });
});


</script>
<script type="text/javascript">
    function ShowHideDiv() {
        var adMigrated = document.getElementById("adMigrated");
        var adMigratedDet = document.getElementById("adMigratedDet");
        adMigratedDet.style.display = adMigrated.value == "Y" ? "block" : "none";
    }
</script>


<script type="text/javascript">
    function ShowHideDiv() {
        var arcNeed = document.getElementById("arcNeed");
        var arcReason = document.getElementById("arcReason");
        arcReason.style.display = arcNeed.value == "N" ? "block" : "none";
        var arcComment = document.getElementById("arcComment");
        arcComment.style.display = arcNeed.value == "O" ? "block" : "none";
    }
</script>


  </head><!--from  w  w w  . ja  va 2 s.co  m-->
  <body style='margin:30px'>
  <%@page language="java"%>
<%@page import="java.sql.*"%>

	
<%

try {
	
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "root");
String query = "select * from appinfo";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
if(rs.next()){
%>
<form class="form-signin"name="loginForm" method="post" action="Onb">
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                
                    
                    <a class="navbar-brand" href="#">Onboard</a>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
</li>
                        <li>
                            <a href="#">Settings</a>
                        </li>
                        <li>
                            <a href="#">Profile</a>
                        </li>
                        <li>
                            <a href="Login.html">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
                <div class="col-sm-2 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active">
                            <a href="project.jsp">Home </a>
                        </li>
                        <li >
                            <a href="display.jsp">Application Information</a>
                        </li>
                        <li class="active"><a href="business.jsp"><bold>Business</bold></a></li>
                            
                        
                        <li>
                            <a href="sample.jsp">Technical</a>
                        </li>
                        <li>
                            <a href="sample.jsp">Requirements</a>
                        </li>
                       
                    </ul>
                </div>
                
                <div class="col-md-9">
                    <h1 class="page-header">Intake</h1>
                    <h3>Application Information</h3>
                    <div class="panel-group" id="panels1"> 
                                                <div class="panel panel-default">
        <div class="panel-heading"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1">                            Application Information                            </a> </h4> 
                            </div>                             
                            <div id="collapse1" class="panel-collapse collapse"> 
                                <div class="panel-body text-left">
                                
                                 
                                  
                                    
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Application Name:</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Application Name" name="appname" value="<%=rs.getString("appname")%>" disabled>
                                        </div>
                                       
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">References to Application:</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="References to Application" name="ref_to_app" value="">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput139">Description :</label>                                             
                                            <textarea class="form-control" rows="3" id="formInput139"><%=rs.getString("descr")%></textarea>
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Application Vendor/Manufacturer</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Application Vendor/Manufacturer" name="app_vendor" value="">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput316">Contract Expiration Date</label>
                                            <div class="input-group"> 
                                                <span class="input-group-addon glyphicon glyphicon-calendar"></span> 
                                                <input type="text" class="form-control" placeholder="Contract Expiration Date" name="contract_exp_date" value=""> 
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="formInput526">Notice Period for Termination of Contract</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Notice Period for Termination of Contract" name="notice_period" value="">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Contract Value of the Application</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Contract Value of the Application" name="contract_value" value="">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Business Units involved</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Business Units involved" name="business_units" value="">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput663">Separate Modules involved in Transactions</label>                                             
                                            <select id="formInput663" class="form-control"> 
                                                <option></option>                                                 
                                                                                              
                                            </select>
                                        </div>
                                         <label for="chkROD">
    										<input type="checkbox" id="chkROD" onclick="EnableDisableTextBox(this)" checked/>
    														Read Only Date
												</label>
												<br />
												Date:
												<input type="date" class="form-control" id="txtROD" disabled="disabled" name="readonly_date" value="" />
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Size of the Database</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Size of the Database" name="dbsize" value="">
                                        </div>
                                       
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Location of Data&nbsp;</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Location of Data " name="dbloc" value="">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Site Location of the Data&nbsp;</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Site Location of the Data " name="site_location_data" value="">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Production Instances</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Production Instances" name="prod_instance" value="">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Location of Production Instances</label>
                                            <input type="text" class="form-control" id="formInput526" placeholder="Location of Production Instances" name="loc_prod_instance" value="">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput95">Information Security Classification of the Data
                                                in the application&nbsp;
</label>                                             
                                            <select id="formInput95" class="form-control"> 
                                                <option></option>                                                 
                                                                                               
                                            </select>
                                        </div>
                                         
                                        <label class="control-label">Application Data-Migrated to New/Alternative App?</label>
     <select id="datamig" class="form-control">
<option value="_">select</option>
<option value="yes">Yes</option>
<option value="no">No</option>
</select>
<label class="control-label">New/Target Application Name</label>
<input type="text" id="textbox" class="form-control" name="target_app_name" disabled="true"/>
<label class="control-label">Date of Migration</label>
<input type="date" id="textbox1" class="form-control" name="date_migration" disabled="true"/>

<label class="control-label">Does this Application needs archival?</label>
    <select id = "arcNeed" onchange = "ShowHideDiv()" class="form-control">
    
        <option value="N">No</option>
        <option value="Y">Yes</option>   
        <option value="O">Other</option>         
    </select>
<hr />
<div id="arcReason" style="display: none">
    Reason:
    <input type="text" id="txtreason" class="form-control" name="reason_archive_no" value=""/>
   
</div>      
<div id="arcComment" style="display: none">
    Comment:
    <input type="text" id="txtComment" class="form-control" name="gen_comment" value=""/>
    </div>                                 
                                  
                                
                                </div>                                 
                            </div>                             
                        </div> 
                                
                                 
                              
                  
                        
                    </div> 
        <button type="submit" class="btn btn-primary btn pull-left" >Save</button>&nbsp;
        
                    <button type="button" class="btn btn-default" href="grid.jsp">Cancel</button> 
       </div>
                
            </div>
            
      
        <%
}
}
catch(Exception e){}
%>
</form>
  </body>
</html>